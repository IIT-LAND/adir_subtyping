function estimateConnectivity_z1(corType,MOTTHRESH, rho)
%
%   corType = 'robust' or 'ridge'
%   MOTTHRESH = 1 for censoring, 0 for no censoring
%

%% FLAGS=======================================================================
% MAKESLIDINGWINDOWMOVIE = 0;

if MOTTHRESH~=0
    MOTCENSOR = 1;
else
    MOTCENSOR = 0;
end % if

if strcmp(corType,'robust')
    DOROBUST = 1;
    DOPARTIALCORR = 0;
elseif strcmp(corType,'ridge')
    DOROBUST = 0;
    DOPARTIALCORR = 1;
%     rho = 1;
end % if

%% initial stuff to set========================================================
addpath ~/Dropbox/matlab/FSLNets;
addpath ~/Dropbox/matlab/L1precision;            % L1precision toolbox
addpath ~/Dropbox/matlab/pwling;                 % pairwise causality toolbox
addpath(sprintf('%s/etc/matlab',getenv('FSLDIR')));    % you don't need to edit this if FSL is setup already



%% paths=======================================================================
rootpath = '/Users/mlombardo/Dropbox/euaims/data/adir';
ica_dir = fullfile(rootpath,'ica');
dr_dir = fullfile(ica_dir,'dualreg');
% ts_dir = fullfile(dr_dir,'tsdir');
ts_dir = fullfile(dr_dir,'dr_stage1');
result_dir = fullfile(rootpath,'data');
% mov_dir = fullfile(rootpath,'movies');
% scanInfoFile = fullfile(rootpath,'asd_subgrp_data_rsfmri_ALL_DSM5.csv');
scanInfoFile = fullfile(rootpath,'asd_subgrp_data_rsfmri_ALL_DSM5_diffzscoreGrps_z1.csv');
code_dir = fullfile(rootpath,'code');
% fd_dir = '/Users/mvlombardo/Dropbox/ACE_mri_reconstructed/fd_files';




%% Set components to use=======================================================
goodComponents = 1:30; % list of all good components of interest
badComponents = [2 21:30];
goodComponents(badComponents) = [];


%% load scan information=======================================================
S = readtable(scanInfoFile,'delimiter',',');

subID = S.subid;
subgrpDx = S.subgrp;
dataset = S.dataset;
Dx = S.Diagnosis;
sex = S.sex;
site = S.site;
mefc = S.mefc;
fiq = S.fsiq4_all;
scan_age = S.age;
meanFD = S.meanFD;

% Component Names==============================================================
for icomp = 1:length(goodComponents)
    compNames{icomp} = sprintf('IC%02d',goodComponents(icomp));
end % for icomp


%% grab timeseries data========================================================
d = dir(fullfile(ts_dir,'*.txt'));
nframeCensored = zeros(length(d),1);
for isub = 1:length(d)
    % filename
	tsfile{isub,1} = fullfile(ts_dir,d(isub).name);
    % read in data and extract
	a = readtable(tsfile{isub},'delimiter','space','ReadVariableNames',false);
	tmp = table2array(a(:,1:2:end-1));

    if MOTCENSOR
        fd_tmp = dir(fullfile(fd_dir,sprintf('%s*',S.p2f2_scannum{isub})));
        fdfile2use = fullfile(fd_dir,fd_tmp.name);
        fddata = readtable(fdfile2use,'ReadVariableNames',false,'HeaderLines',0);
        fddata = [0; fddata.Var1];
        fdmask = fddata>=MOTTHRESH;
        ts_data{isub,1} = tmp(~fdmask,goodComponents);
        nframeCensored(isub,1) = sum(fdmask);
    else
        ts_data{isub,1} = tmp(:,goodComponents);
    end % if MOTCENSOR

    % compute correlation matrix
    if DOROBUST
        tmp_r = make_robcorr(ts_data{isub,1},[]);
        tmp_z = r2z_transform(tmp_r);
    elseif DOPARTIALCORR
%         tmp_r = nets_netmats(ts_data{isub},1,'icov',10);
        tmp_r = nets_netmats(ts_data{isub},1,'ridgep',rho);
%         tmp_r = nets_netmats(ts_data{isub},1,'ridgep',rho(isub));
        tmp_z = tmp_r;
    elseif ~DOROBUST & ~DOPARTIALCORR
        tmp_r = corr(ts_data{isub,1});
        tmp_z = r2z_transform(tmp_r);
    end % if DOROBUST
	r(:,:,isub) = tmp_r;
    z(:,:,isub) = tmp_z;
    % grab lower triangle of correlation matrix
    lower_tri_mask = tril(tmp_r,-1)~=0;
    rts_lowertri(isub,:) = tmp_r(lower_tri_mask);
    ts_lowertri(isub,:) = tmp_z(lower_tri_mask);
end % for isub

% make connection names to label the columns of the rts_lowertri matrix
idx2use = find(lower_tri_mask);
[x,y] = ind2sub(size(tmp_r),idx2use);
for i = 1:length(idx2use)
    colLabels{i} = sprintf('%s_%s',compNames{y(i)},compNames{x(i)});
end % for i

% % added to export specific subject's data as tesxt files-------------------
% for isub = 1:length(d)
%     fname2save = fullfile(result_dir,'subject_data',sprintf('%s_tsdata.txt',subID{isub}));
%     % make table for rts_lowertri and export to text file
%     tab2write=cell2table(num2cell(ts_data{isub,1}),'VariableNames',compNames);
%     writetable(tab2write,fname2save,'FileType','text','delimiter','\t');
% end % for isub


if DOPARTIALCORR
    if MOTCENSOR
        fname2save = fullfile(result_dir,sprintf('partialCorData_MotCensor%.02f_ridge_lambda%d.txt',MOTTHRESH,rho));
    elseif ~MOTCENSOR
        fname2save = fullfile(result_dir,sprintf('partialCorData_ridge_lambda%d.diffzscoreGrps_z1.txt',rho));
    end % if MOTCENSOR
end % DOPARTIALCORR

% make table for rts_lowertri and export to text file
tab2write=cell2table([num2cell(subID), Dx, subgrpDx, dataset, site, sex, num2cell([scan_age, meanFD, fiq]) num2cell(rts_lowertri)], ...
    'VariableNames',[{'subid','Diagnosis','subgrp','dataset','site','sex','scan_age','meanFD','fiq'},colLabels]);
writetable(tab2write,fname2save,'FileType','text','delimiter','\t');


end % function estimateConnectivity ===========================================

%% ============================================================================
function Z = r2z_transform(R)

Z = zeros(size(R));

% Loop over columns in R
for icolumn = 1:size(R,2)
    % Loop over rows in R
    for irow = 1:size(R,1)
        % this converts r-values to z-scores
        Z(irow,icolumn) = 0.5*log((1+R(irow,icolumn))/(1-R(irow,icolumn)));
    end % for irow
end % for icolumn

end % function r2z_transform===================================================

%% ============================================================================
function r = make_robcorr(data,covariates)
warning off;
xcol2use = 1;
for irow = 1:size(data,2)
    if isempty(covariates)
        X = data(:,irow);
    elseif ~isempty(covariates)
        X = [data(:,irow) covariates];
    end % if

    for icol = 1:size(data,2)
        Y = data(:,icol);
        [Xadj,Yadj,rrob,prob] = partialcor(X,Y,xcol2use,0,1);
        r(irow,icol) = rrob(1);
        r(icol,irow) = rrob(1);
    end % for icol
end % for irow
warning on;
end % function make_robcorr====================================================
