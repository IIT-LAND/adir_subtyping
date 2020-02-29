# euaims_functions.R

#==============================================================================
# function to rescore NA
rescoreNA <- function(df) {
  vals2na = c(6,7,8,9,999)
  for (icol in 1:ncol(df)) {
    mask = is.element(df[,icol][[1]],c(7,8,9,999))
    df[mask,icol] = NA
  }# for icol
  return(df)
}# function rescoreNA

#==============================================================================
# NEW #########################################################################
# function to score ADI items into DSM-5 algorithm summary scores
scoreADI_DSM5 <- function(df) {


  for (i in 1:nrow(df)) {

    df_sub = df[i,]

    if (df_sub$age_years<4){

      # A items
      A1items = c("ADIR34[current]","ADIR35[current]",
                  "ADIR31[current]","ADIR61[current]","ADIR52[current]",
                  "ADIR54[current]","ADIR55[current]","ADIR46[current]",
                  "ADIR51[current]")
      # score A1
      df2use = df_sub[,c(A1items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,2,3,
                          3,3,3,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A1_sumscore"] = sum_score
      df[i,"A1_pct_severity"] = pct_severity

      A2items = c("ADIR50[current]","ADIR42[current]","ADIR43[current]",
                  "ADIR44[current]","ADIR45[current]","ADIR57[current]",
                  "ADIR56[current]")
      # score A2
      df2use = df_sub[,c(A2items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,2,2,
                          2,3,3,
                          3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A2_sumscore"] = sum_score
      df[i,"A2_pct_severity"] = pct_severity

      A3items = c("ADIR36[current]",
                  "ADIR58[current]","ADIR53[current]","ADIR59[current]",
                  "ADIR62[current]","ADIR63[current]")
      # score A3
      df2use = df_sub[,c(A3items)]
      items2use = rescoreNA(df2use)
      possible_points = c(2,2,3,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A3_sumscore"] = sum_score
      df[i,"A3_pct_severity"] = pct_severity

      # B items
      B1items = c("ADIR33[ever]","ADIR37[ever]","ADIR38[ever]",
                  "ADIR69[ever]","ADIR77[ever]","ADIR78[ever]")
      # score B1
      df2use = df_sub[,c(B1items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,2,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B1_sumscore"] = sum_score
      df[i,"B1_pct_severity"] = pct_severity

      B2items = c("ADIR39[ever]",
                  "ADIR70[ever]","ADIR74[ever]","ADIR75[ever]")
      # score B2
      df2use = df_sub[,c(B2items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,3,
                          3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B2_sumscore"] = sum_score
      df[i,"B2_pct_severity"] = pct_severity

      B3items = c("ADIR67[ever]","ADIR68[ever]","ADIR76[ever]")
      # score B3
      df2use = df_sub[,c(B3items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B3_sumscore"] = sum_score
      df[i,"B3_pct_severity"] = pct_severity

      B4items = c("ADIR72[ever]","ADIR73[ever]","ADIR71[ever]")
      # score B4
      df2use = df_sub[,c(B4items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,2)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B4_sumscore"] = sum_score
      df[i,"B4_pct_severity"] = pct_severity


    } else if (df_sub$age_years>=4 | df_sub$age_years<10){

      # A items
      A1items = c("ADIR34[current]","ADIR35[current]",
                  "ADIR31[current]","ADIR61[current]","ADIR52[current]",
                  "ADIR54[current]","ADIR55[current]",
                  "ADIR51[current]")
      # score A1
      df2use = df_sub[,c(A1items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,2,3,
                          3,3,3,
                          3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A1_sumscore"] = sum_score
      df[i,"A1_pct_severity"] = pct_severity

      A2items = c("ADIR42[current]","ADIR43[current]",
                  "ADIR44[current]","ADIR45[current]","ADIR57[current]",
                  "ADIR56[current]")
      # score A2
      df2use = df_sub[,c(A2items)]
      items2use = rescoreNA(df2use)
      possible_points = c(2,2,2,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A2_sumscore"] = sum_score
      df[i,"A2_pct_severity"] = pct_severity

      A3items = c("ADIR36[current]",
                  "ADIR58[current]","ADIR53[current]","ADIR59[current]",
                  "ADIR62[current]","ADIR63[current]",
                  "ADIR49[current]","ADIR64[current]","ADIR65[current]",
                  "ADIR66[current]")
      # score A3
      df2use = df_sub[,c(A3items)]
      items2use = rescoreNA(df2use)
      possible_points = c(2,2,3,
                          3,3,3,
                          3,3,3,
                          3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A3_sumscore"] = sum_score
      df[i,"A3_pct_severity"] = pct_severity

      # B items
      B1items = c("ADIR33[ever]","ADIR37[ever]","ADIR38[ever]",
                  "ADIR69[ever]","ADIR77[ever]","ADIR78[ever]")
      # score B1
      df2use = df_sub[,c(B1items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,2,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B1_sumscore"] = sum_score
      df[i,"B1_pct_severity"] = pct_severity

      B2items = c("ADIR39[ever]",
                  "ADIR70[ever]","ADIR74[ever]","ADIR75[ever]")
      # score B2
      df2use = df_sub[,c(B2items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,3,
                          3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B2_sumscore"] = sum_score
      df[i,"B2_pct_severity"] = pct_severity

      B3items = c("ADIR67[ever]","ADIR68[ever]","ADIR76[ever]")
      # score B3
      df2use = df_sub[,c(B3items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B3_sumscore"] = sum_score
      df[i,"B3_pct_severity"] = pct_severity

      B4items = c("ADIR72[ever]","ADIR73[ever]","ADIR71[ever]")
      # score B4
      df2use = df_sub[,c(B4items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,2)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B4_sumscore"] = sum_score
      df[i,"B4_pct_severity"] = pct_severity

    } else if (df_sub$age_years>10){

      # A items
      A1items = c("ADIR34[current]","ADIR35[current]",
                  "ADIR31[current]","ADIR52[current]",
                  "ADIR54[current]","ADIR55[current]",
                  "ADIR51[current]")
      # score A1
      df2use = df_sub[,c(A1items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,2,3,
                          3,3,3,
                          3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A1_sumscore"] = sum_score
      df[i,"A1_pct_severity"] = pct_severity

      A2items = c("ADIR42[current]","ADIR43[current]",
                  "ADIR44[current]","ADIR45[current]","ADIR57[current]",
                  "ADIR56[current]")
      # score A2
      df2use = df_sub[,c(A2items)]
      items2use = rescoreNA(df2use)
      possible_points = c(2,2,2,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A2_sumscore"] = sum_score
      df[i,"A2_pct_severity"] = pct_severity

      A3items = c("ADIR36[current]",
                  "ADIR58[current]","ADIR53[current]","ADIR59[current]",
                  "ADIR65[current]",
                  "ADIR66[current]")
      # score A3
      df2use = df_sub[,c(A3items)]
      items2use = rescoreNA(df2use)
      possible_points = c(2,2,3,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"A3_sumscore"] = sum_score
      df[i,"A3_pct_severity"] = pct_severity

      # B items
      B1items = c("ADIR33[ever]","ADIR37[ever]","ADIR38[ever]",
                  "ADIR69[ever]","ADIR77[ever]","ADIR78[ever]")
      # score B1
      df2use = df_sub[,c(B1items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,2,
                          3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B1_sumscore"] = sum_score
      df[i,"B1_pct_severity"] = pct_severity

      B2items = c("ADIR39[ever]",
                  "ADIR70[ever]","ADIR74[ever]","ADIR75[ever]")
      # score B2
      df2use = df_sub[,c(B2items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,3,
                          3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B2_sumscore"] = sum_score
      df[i,"B2_pct_severity"] = pct_severity

      B3items = c("ADIR67[ever]","ADIR68[ever]","ADIR76[ever]")
      # score B3
      df2use = df_sub[,c(B3items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,3)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B3_sumscore"] = sum_score
      df[i,"B3_pct_severity"] = pct_severity

      B4items = c("ADIR72[ever]","ADIR73[ever]","ADIR71[ever]")
      # score B4
      df2use = df_sub[,c(B4items)]
      items2use = rescoreNA(df2use)
      possible_points = c(3,3,2)
      na_mask = is.na(items2use)
      max_total_possible = sum(possible_points[!na_mask])
      sum_score = sum(items2use, na.rm = TRUE)
      if (max_total_possible!=0){
        pct_severity = sum_score/max_total_possible
      } else{
        pct_severity = NA
      }
      df[i,"B4_sumscore"] = sum_score
      df[i,"B4_pct_severity"] = pct_severity

    } # if (df$age<4){


    # # A items
    # A1items = c("ADIR34[current]","ADIR35[current]","ADIR31[current]","ADIR52[current]","ADIR54[current]","ADIR55[current]","ADIR51[current]")
    # A2items = c("ADIR42[current]","ADIR43[current]","ADIR44[current]","ADIR45[current]","ADIR57[current]","ADIR58[current]")
    # A3items = c("ADIR36[current]","ADIR58[current]","ADIR53[current]","ADIR59[current]","ADIR35[current]","ADIR66[current]")
    #
    # # B items
    # B1items = c("ADIR33[ever]","ADIR37[ever]","ADIR38[ever]","ADIR69[ever]","ADIR77[ever]","ADIR78[ever]")
    # B2items = c("ADIR39[ever]","ADIR70[ever]","ADIR74[ever]","ADIR75[ever]")
    # B3items = c("ADIR67[ever]","ADIR68[ever]","ADIR76[ever]")
    # B4items = c("ADIR72[ever]","ADIR73[ever]","ADIR71[ever]")

    # # score A1
    # A1_df = df_sub[,c(A1items)]
    # A1_df = rescoreNA(A1_df)
    #
    #
    # total_score = length(A1items)*3
    # sum_score = rowSums(A1_df, na.rm = TRUE)
    # A1_df$sumscore = sum_score
    # A1_df[rowSums(is.na(A1_df[,1:length(A1items)]))==length(A1items),"sumscore"] = NA
    # A1_df$pct_severity = A1_df$sumscore/total_score
    # df$A1_sumscore = A1_df$sumscore
    # df$A1_pct_severity = A1_df$pct_severity
    #
    # # score A2
    # A2_df = df[,c(A2items)]
    # A2_df = rescoreNA(A2_df)
    # total_score = length(A2items)*3
    # sum_score = rowSums(A2_df,na.rm = TRUE)
    # A2_df$sumscore = sum_score
    # A2_df[rowSums(is.na(A2_df[,1:length(A2items)]))==length(A2items),"sumscore"] = NA
    # A2_df$pct_severity = A2_df$sumscore/total_score
    # df$A2_sumscore = A2_df$sumscore
    # df$A2_pct_severity = A2_df$pct_severity
    #
    # # score A3
    # A3_df = df[,c(A3items)]
    # A3_df = rescoreNA(A3_df)
    # total_score = length(A3items)*3
    # sum_score = rowSums(A3_df, na.rm = TRUE)
    # A3_df$sumscore = sum_score
    # A3_df[rowSums(is.na(A3_df[,1:length(A3items)]))==length(A3items),"sumscore"] = NA
    # A3_df$pct_severity = A3_df$sumscore/total_score
    # df$A3_sumscore = A3_df$sumscore
    # df$A3_pct_severity = A3_df$pct_severity


    # # score B1
    # B1_df = df[,c(B1items)]
    # B1_df = rescoreNA(B1_df)
    # total_score = length(B1items)*3
    # sum_score = rowSums(B1_df, na.rm = TRUE)
    # B1_df$sumscore = sum_score
    # B1_df[rowSums(is.na(B1_df[,1:length(B1items)]))==length(B1items),"sumscore"] = NA
    # B1_df$pct_severity = B1_df$sumscore/total_score
    # df$B1_sumscore = B1_df$sumscore
    # df$B1_pct_severity = B1_df$pct_severity
    #
    # # score B2
    # B2_df = df[,c(B2items)]
    # B2_df = rescoreNA(B2_df)
    # total_score = length(B2items)*3
    # sum_score = rowSums(B2_df, na.rm = TRUE)
    # B2_df$sumscore = sum_score
    # B2_df[rowSums(is.na(B2_df[,1:length(B2items)]))==length(B2items),"sumscore"] = NA
    # B2_df$pct_severity = B2_df$sumscore/total_score
    # df$B2_sumscore = B2_df$sumscore
    # df$B2_pct_severity = B2_df$pct_severity
    #
    # # score B3
    # B3_df = df[,c(B3items)]
    # B3_df = rescoreNA(B3_df)
    # total_score = length(B3items)*3
    # sum_score = rowSums(B3_df, na.rm = TRUE)
    # B3_df$sumscore = sum_score
    # B3_df[rowSums(is.na(B3_df[,1:length(B3items)]))==length(B3items),"sumscore"] = NA
    # B3_df$pct_severity = B3_df$sumscore/total_score
    # df$B3_sumscore = B3_df$sumscore
    # df$B3_pct_severity = B3_df$pct_severity
    #
    # # score B4
    # B4_df = df[,c(B4items)]
    # B4_df = rescoreNA(B4_df)
    # total_score = length(B4items)*3
    # sum_score = rowSums(B4_df, na.rm = TRUE)
    # B4_df$sumscore = sum_score
    # B4_df[rowSums(is.na(B4_df[,1:length(B4items)]))==length(B4items),"sumscore"] = NA
    # B4_df$pct_severity = B4_df$sumscore/total_score
    # df$B4_sumscore = B4_df$sumscore
    # df$B4_pct_severity = B4_df$pct_severity


    # df$B_sum = df$B1_sumscore + df$B2_sumscore + df$B3_sumscore + df$B4_sumscore
    # total_score = (length(B1items) + length(B2items) + length(B3items) + length(B4items))*3
    # df$B_pct_severity = df$B_sum/total_score

  } # for (i in 1:nrow(df)){

  df$A_sum = rowSums(df[,c("A1_sumscore","A2_sumscore","A3_sumscore")])
  df$A_pct_severity = rowSums(df[,c("A1_pct_severity","A2_pct_severity","A3_pct_severity")])/3

  df$B_sum = rowSums(df[,c("B1_sumscore","B2_sumscore","B3_sumscore","B4_sumscore")])
  df$B_pct_severity = rowSums(df[,c("B1_pct_severity","B2_pct_severity","B3_pct_severity","B4_pct_severity")])/4

  return(df)
}# function scoreADI_DSM5






# #==============================================================================
# # OLD #########################################################################
# # function to score ADI items into DSM-5 algorithm summary scores
# scoreADI_DSM5 <- function(df) {
#
#   # A items
#   A1items = c("ADIR34[current]","ADIR35[current]","ADIR31[current]","ADIR52[current]","ADIR54[current]","ADIR55[current]","ADIR51[current]")
#   A2items = c("ADIR42[current]","ADIR43[current]","ADIR44[current]","ADIR45[current]","ADIR57[current]","ADIR58[current]")
#   A3items = c("ADIR36[current]","ADIR58[current]","ADIR53[current]","ADIR59[current]","ADIR35[current]","ADIR66[current]")
#
#   # B items
#   B1items = c("ADIR33[ever]","ADIR37[ever]","ADIR38[ever]","ADIR69[ever]","ADIR77[ever]","ADIR78[ever]")
#   B2items = c("ADIR39[ever]","ADIR70[ever]","ADIR74[ever]","ADIR75[ever]")
#   B3items = c("ADIR67[ever]","ADIR68[ever]","ADIR76[ever]")
#   B4items = c("ADIR72[ever]","ADIR73[ever]","ADIR71[ever]")
#
#   # score A1
#   A1_df = df[,c(A1items)]
#   A1_df = rescoreNA(A1_df)
#   total_score = length(A1items)*3
#   sum_score = rowSums(A1_df, na.rm = TRUE)
#   A1_df$sumscore = sum_score
#   A1_df[rowSums(is.na(A1_df[,1:length(A1items)]))==length(A1items),"sumscore"] = NA
#   A1_df$pct_severity = A1_df$sumscore/total_score
#   df$A1_sumscore = A1_df$sumscore
#   df$A1_pct_severity = A1_df$pct_severity
#
#   # score A2
#   A2_df = df[,c(A2items)]
#   A2_df = rescoreNA(A2_df)
#   total_score = length(A2items)*3
#   sum_score = rowSums(A2_df,na.rm = TRUE)
#   A2_df$sumscore = sum_score
#   A2_df[rowSums(is.na(A2_df[,1:length(A2items)]))==length(A2items),"sumscore"] = NA
#   A2_df$pct_severity = A2_df$sumscore/total_score
#   df$A2_sumscore = A2_df$sumscore
#   df$A2_pct_severity = A2_df$pct_severity
#
#   # score A3
#   A3_df = df[,c(A3items)]
#   A3_df = rescoreNA(A3_df)
#   total_score = length(A3items)*3
#   sum_score = rowSums(A3_df, na.rm = TRUE)
#   A3_df$sumscore = sum_score
#   A3_df[rowSums(is.na(A3_df[,1:length(A3items)]))==length(A3items),"sumscore"] = NA
#   A3_df$pct_severity = A3_df$sumscore/total_score
#   df$A3_sumscore = A3_df$sumscore
#   df$A3_pct_severity = A3_df$pct_severity
#
#   df$A_sum = df$A1_sumscore + df$A2_sumscore + df$A3_sumscore
#   total_score = (length(A1items) + length(A2items) + length(A3items))*3
#   df$A_pct_severity = df$A_sum/total_score
#
#   # score B1
#   B1_df = df[,c(B1items)]
#   B1_df = rescoreNA(B1_df)
#   total_score = length(B1items)*3
#   sum_score = rowSums(B1_df, na.rm = TRUE)
#   B1_df$sumscore = sum_score
#   B1_df[rowSums(is.na(B1_df[,1:length(B1items)]))==length(B1items),"sumscore"] = NA
#   B1_df$pct_severity = B1_df$sumscore/total_score
#   df$B1_sumscore = B1_df$sumscore
#   df$B1_pct_severity = B1_df$pct_severity
#
#   # score B2
#   B2_df = df[,c(B2items)]
#   B2_df = rescoreNA(B2_df)
#   total_score = length(B2items)*3
#   sum_score = rowSums(B2_df, na.rm = TRUE)
#   B2_df$sumscore = sum_score
#   B2_df[rowSums(is.na(B2_df[,1:length(B2items)]))==length(B2items),"sumscore"] = NA
#   B2_df$pct_severity = B2_df$sumscore/total_score
#   df$B2_sumscore = B2_df$sumscore
#   df$B2_pct_severity = B2_df$pct_severity
#
#   # score B3
#   B3_df = df[,c(B3items)]
#   B3_df = rescoreNA(B3_df)
#   total_score = length(B3items)*3
#   sum_score = rowSums(B3_df, na.rm = TRUE)
#   B3_df$sumscore = sum_score
#   B3_df[rowSums(is.na(B3_df[,1:length(B3items)]))==length(B3items),"sumscore"] = NA
#   B3_df$pct_severity = B3_df$sumscore/total_score
#   df$B3_sumscore = B3_df$sumscore
#   df$B3_pct_severity = B3_df$pct_severity
#
#   # score B4
#   B4_df = df[,c(B4items)]
#   B4_df = rescoreNA(B4_df)
#   total_score = length(B4items)*3
#   sum_score = rowSums(B4_df, na.rm = TRUE)
#   B4_df$sumscore = sum_score
#   B4_df[rowSums(is.na(B4_df[,1:length(B4items)]))==length(B4items),"sumscore"] = NA
#   B4_df$pct_severity = B4_df$sumscore/total_score
#   df$B4_sumscore = B4_df$sumscore
#   df$B4_pct_severity = B4_df$pct_severity
#
#   df$B_sum = df$B1_sumscore + df$B2_sumscore + df$B3_sumscore + df$B4_sumscore
#   total_score = (length(B1items) + length(B2items) + length(B3items) + length(B4items))*3
#   df$B_pct_severity = df$B_sum/total_score
#
#   return(df)
# }# function scoreADI_DSM5

#==============================================================================
# function to score ADI items into DSM IV algorithm summary scores
scoreADI_DSMIV <- function(df) {

  # A items
  A1items = c("ADIR50[most]","ADIR51[most]","ADIR57[most]")
  A2items = c("ADIR49[most]","ADIR62[most]","ADIR63[most]","ADIR64[most]","ADIR65[most]")
  A3items = c("ADIR52[most]","ADIR53[most]","ADIR54[most]")
  A4items = c("ADIR31[ever]","ADIR55[most]","ADIR56[most]","ADIR58[ever]","ADIR59[most]")

  # B items
  B1items = c("ADIR42[most]","ADIR43[most]","ADIR44[most]","ADIR45[most]")
  B2items = c("ADIR34[ever]","ADIR35[ever]")
  B3items = c("ADIR33[ever]","ADIR36[ever]","ADIR37[ever]","ADIR38[ever]")
  B4items = c("ADIR47[most]","ADIR48[most]","ADIR61[most]")

  # C items
  C1items = c("ADIR67[ever]","ADIR68[ever]")
  C2items = c("ADIR39[ever]","ADIR70[ever]")
  C3items = c("ADIR77[ever]","ADIR78[ever]")
  C4items = c("ADIR69[ever]","ADIR71[ever]")

  # score A1
  A1_df = df[,c(A1items)]
  A1_df = rescoreNA(A1_df)
  total_score = length(A1items)*3
  sum_score = rowSums(A1_df, na.rm = TRUE)
  A1_df$sumscore = sum_score
  A1_df[rowSums(is.na(A1_df[,1:length(A1items)]))==length(A1items),"sumscore"] = NA
  A1_df$pct_severity = A1_df$sumscore/total_score
  df$A1_sumscore = A1_df$sumscore
  df$A1_pct_severity = A1_df$pct_severity

  # score A2
  A2_df = df[,c(A2items)]
  A2_df = rescoreNA(A2_df)
  A2_df$ADIR64_or_ADIR65 = NA
  for (irow in 1:nrow(A2_df)) {
    if (!is.na(A2_df[irow,"ADIR64[most]"]) & is.na(A2_df[irow,"ADIR65[most]"])) {
      A2_df$ADIR64_or_ADIR65[irow] = A2_df[irow,"ADIR64[most]"]
    }else if (is.na(A2_df[irow,"ADIR64[most]"]) & !is.na(A2_df[irow,"ADIR65[most]"])) {
      A2_df$ADIR64_or_ADIR65[irow] = A2_df[irow,"ADIR65[most]"]
    }else if (!is.na(A2_df[irow,"ADIR64[most]"]) & !is.na(A2_df[irow,"ADIR65[most]"])) {
      if (A2_df[irow,"ADIR64[most]"]>=A2_df[irow,"ADIR65[most]"]) {
        A2_df$ADIR64_or_ADIR65[irow] = A2_df[irow,"ADIR64[most]"]
      }else if (A2_df[irow,"ADIR64[most]"]<A2_df[irow,"ADIR65[most]"]) {
        A2_df$ADIR64_or_ADIR65[irow] = A2_df[irow,"ADIR65[most]"]
      }# if
    }# if
  }# for irow
  A2_df$ADIR64_or_ADIR65 = as.numeric(A2_df$ADIR64_or_ADIR65)
  A2_df_tmp = A2_df[,c(1:3,6)]
  sum_score = rowSums(A2_df_tmp,na.rm = TRUE)
  total_score = (length(A2items)-1)*3
  A2_df_tmp$sumscore = sum_score
  A2_df_tmp[rowSums(is.na(A2_df_tmp[,1:length(A2items)-1]))==length(A2items)-1,"sumscore"] = NA
  A2_df_tmp$pct_severity = A2_df_tmp$sumscore/total_score
  df$A2_sumscore = A2_df_tmp$sumscore
  df$A2_pct_severity = A2_df_tmp$pct_severity


  # score A3
  A3_df = df[,c(A3items)]
  A3_df = rescoreNA(A3_df)
  total_score = length(A3items)*3
  sum_score = rowSums(A3_df, na.rm = TRUE)
  A3_df$sumscore = sum_score
  A3_df[rowSums(is.na(A3_df[,1:length(A3items)]))==length(A3items),"sumscore"] = NA
  A3_df$pct_severity = A3_df$sumscore/total_score
  df$A3_sumscore = A3_df$sumscore
  df$A3_pct_severity = A3_df$pct_severity

  # score A4
  A4_df = df[,c(A4items)]
  A4_df = rescoreNA(A4_df)
  total_score = length(A4items)*3
  sum_score = rowSums(A4_df, na.rm = TRUE)
  A4_df$sumscore = sum_score
  A4_df[rowSums(is.na(A4_df[,1:length(A4items)]))==length(A4items),"sumscore"] = NA
  A4_df$pct_severity = A4_df$sumscore/total_score
  df$A4_sumscore = A4_df$sumscore
  df$A4_pct_severity = A4_df$pct_severity

  df$A_sum = df$A1_sumscore + df$A2_sumscore + df$A3_sumscore + df$A4_sumscore
  total_score = (length(A1items) + (length(A2items)-1) + length(A3items) + length(A4items))*3
  df$A_pct_severity = df$A_sum/total_score


  # score B1
  B1_df = df[,c(B1items)]
  B1_df = rescoreNA(B1_df)
  total_score = length(B1items)*3
  sum_score = rowSums(B1_df, na.rm = TRUE)
  B1_df$sumscore = sum_score
  B1_df[rowSums(is.na(B1_df[,1:length(B1items)]))==length(B1items),"sumscore"] = NA
  B1_df$pct_severity = B1_df$sumscore/total_score
  df$B1_sumscore = B1_df$sumscore
  df$B1_pct_severity = B1_df$pct_severity


  # score B2
  B2_df = df[,c(B2items)]
  B2_df = rescoreNA(B2_df)
  total_score = length(B2items)*3
  sum_score = rowSums(B2_df, na.rm = TRUE)
  B2_df$sumscore = sum_score
  B2_df[rowSums(is.na(B2_df[,1:length(B2items)]))==length(B2items),"sumscore"] = NA
  B2_df$pct_severity = B2_df$sumscore/total_score
  df$B2_sumscore = B2_df$sumscore
  df$B2_pct_severity = B2_df$pct_severity

  # score B3
  B3_df = df[,c(B3items)]
  B3_df = rescoreNA(B3_df)
  total_score = length(B3items)*3
  sum_score = rowSums(B3_df, na.rm = TRUE)
  B3_df$sumscore = sum_score
  B3_df[rowSums(is.na(B3_df[,1:length(B3items)]))==length(B3items),"sumscore"] = NA
  B3_df$pct_severity = B3_df$sumscore/total_score
  df$B3_sumscore = B3_df$sumscore
  df$B3_pct_severity = B3_df$pct_severity

  # score B4
  B4_df = df[,c(B4items)]
  B4_df = rescoreNA(B4_df)
  total_score = length(B4items)*3
  sum_score = rowSums(B4_df, na.rm = TRUE)
  B4_df$sumscore = sum_score
  B4_df[rowSums(is.na(B4_df[,1:length(B4items)]))==length(B4items),"sumscore"] = NA
  B4_df$pct_severity = B4_df$sumscore/total_score
  df$B4_sumscore = B4_df$sumscore
  df$B4_pct_severity = B4_df$pct_severity

  df$B_sum = df$B1_sumscore + df$B2_sumscore + df$B3_sumscore + df$B4_sumscore
  total_score = (length(B1items) + length(B2items) + length(B3items) + length(B4items))*3
  df$B_pct_severity = df$B_sum/total_score

  df$Bnv_sum = df$B1_sumscore + df$B4_sumscore
  total_score = (length(B1items) + length(B4items))*3
  df$Bnv_pct_severity = df$Bnv_sum/total_score

  df$Bv_sum = df$B2_sumscore + df$B3_sumscore
  total_score = (length(B2items) + length(B3items))*3
  df$Bv_pct_severity = df$Bv_sum/total_score


  # score C1
  C1_df = df[,c(C1items)]
  C1_df = rescoreNA(C1_df)
  total_score = length(C1items)*3
  sum_score = rowSums(C1_df, na.rm = TRUE)
  C1_df$sumscore = sum_score
  C1_df[rowSums(is.na(C1_df[,1:length(C1items)]))==length(C1items),"sumscore"] = NA
  C1_df$pct_severity = C1_df$sumscore/total_score
  df$C1_sumscore = C1_df$sumscore
  df$C1_pct_severity = C1_df$pct_severity


  # score C2
  C2_df = df[,c(C2items)]
  C2_df = rescoreNA(C2_df)
  total_score = length(C2items)*3
  sum_score = rowSums(C2_df, na.rm = TRUE)
  C2_df$sumscore = sum_score
  C2_df[rowSums(is.na(C2_df[,1:length(C2items)]))==length(C2items),"sumscore"] = NA
  C2_df$pct_severity = C2_df$sumscore/total_score
  df$C2_sumscore = C2_df$sumscore
  df$C2_pct_severity = C2_df$pct_severity

  # score C3
  C3_df = df[,c(C3items)]
  C3_df = rescoreNA(C3_df)
  C3_df$ADIR77_or_ADIR78 = NA
  for (irow in 1:nrow(C3_df)) {
    if (!is.na(C3_df[irow,"ADIR77[ever]"]) & is.na(C3_df[irow,"ADIR78[ever]"])) {
      C3_df$ADIR77_or_ADIR78[irow] = C3_df[irow,"ADIR77[ever]"]
    }else if (is.na(C3_df[irow,"ADIR77[ever]"]) & !is.na(C3_df[irow,"ADIR78[ever]"])) {
      C3_df$ADIR77_or_ADIR78[irow] = C3_df[irow,"ADIR78[ever]"]
    }else if (!is.na(C3_df[irow,"ADIR77[ever]"]) & !is.na(C3_df[irow,"ADIR78[ever]"])) {
      if (C3_df[irow,"ADIR77[ever]"]>=C3_df[irow,"ADIR78[ever]"]) {
        C3_df$ADIR77_or_ADIR78[irow] = C3_df[irow,"ADIR77[ever]"]
      }else if (C3_df[irow,"ADIR77[ever]"]<C3_df[irow,"ADIR78[ever]"]) {
        C3_df$ADIR77_or_ADIR78[irow] = C3_df[irow,"ADIR78[ever]"]
      }# if
    }# if
  }# for irow
  C3_df$ADIR77_or_ADIR78 = as.numeric(C3_df$ADIR77_or_ADIR78)
  C3_df$pct_severity = C3_df$ADIR77_or_ADIR78/((length(C3items)-1)*3)
  df$C3_sumscore = C3_df$ADIR77_or_ADIR78
  df$C3_pct_severity = C3_df$pct_severity


  # score C4
  C4_df = df[,c(C4items)]
  C4_df = rescoreNA(C4_df)
  C4_df$ADIR69_or_ADIR71 = NA
  for (irow in 1:nrow(C4_df)) {
    if (!is.na(C4_df[irow,"ADIR69[ever]"]) & is.na(C4_df[irow,"ADIR71[ever]"])) {
      C4_df$ADIR69_or_ADIR71[irow] = C4_df[irow,"ADIR69[ever]"]
    }else if (is.na(C4_df[irow,"ADIR69[ever]"]) & !is.na(C4_df[irow,"ADIR71[ever]"])) {
      C4_df$ADIR69_or_ADIR71[irow] = C4_df[irow,"ADIR71[ever]"]
    }else if (!is.na(C4_df[irow,"ADIR69[ever]"]) & !is.na(C4_df[irow,"ADIR71[ever]"])) {
      if (C4_df[irow,"ADIR69[ever]"]>=C4_df[irow,"ADIR71[ever]"]) {
        C4_df$ADIR69_or_ADIR71[irow] = C4_df[irow,"ADIR69[ever]"]
      }else if (C4_df[irow,"ADIR69[ever]"]<C4_df[irow,"ADIR71[ever]"]) {
        C4_df$ADIR69_or_ADIR71[irow] = C4_df[irow,"ADIR71[ever]"]
      }# if
    }# if
  }# for irow
  C4_df$ADIR69_or_ADIR71 = as.numeric(C4_df$ADIR69_or_ADIR71)
  C4_df$pct_severity = C4_df$ADIR69_or_ADIR71/((length(C4items)-1)*3)
  df$C4_sumscore = C4_df$ADIR69_or_ADIR71
  df$C4_pct_severity = C4_df$pct_severity


  df$C_sum = df$C1_sumscore + df$C2_sumscore + df$C3_sumscore + df$C4_sumscore
  total_score = (length(C1items) + length(C2items) + (length(C3items)-1) + (length(C4items)-1))*3
  df$C_pct_severity = df$C_sum/total_score

  return(df)
}# function scoreADI_DSMIV

#==============================================================================
# function to generate cross validation indices--------------------------------
crossvalind <- function(N, kfold, rngSeed = 1) {
  set.seed(rngSeed)
  len.seg = ceiling(N/kfold)
  incomplete = kfold*len.seg - N
  complete = kfold - incomplete
  ind = matrix(c(sample(1:N), rep(NA, incomplete)), nrow = len.seg, byrow =
                 TRUE)
  cvi = lapply(as.data.frame(ind), function(x) c(na.omit(x))) # a list
  return(cvi)
} # end function crossvalind---------------------------------------------------

# functions to tell me if an integer is even or odd----------------------------
is.even <- function(x) {
  x %% 2 == 0
}# end function is.even

is.odd <- function(x){
  x %% 2 != 0
}# end function is.odd---------------------------------------------------------

# main function to split datasets----------------------------------------------
SplitDatasets <- function(dset2use, rngSeed = 1) {
  set.seed(rngSeed)
  K = 2
  #dsetID = unique(dset2use$dataset_id)
  result = vector(mode = "list", length = K)
  result[[1]] = data.frame(matrix(nrow=0,ncol=0))
  result[[2]] = data.frame(matrix(nrow=0,ncol=0))
  cvind = crossvalind(dim(dset2use)[1], K, rngSeed = rngSeed)
  fold1 = cvind$V1
  fold2 = cvind$V2
  Discovery = dset2use[fold1,]
  Replication = dset2use[fold2,]

  result[[1]] = rbind(result[[1]],Discovery)
  result[[2]] = rbind(result[[2]],Replication)
  result
} # end function SplitDatasets-------------------------------------------------


# main function to split datasets----------------------------------------------
SplitDatasetsBySex <- function(dset2use, rngSeed = 1) {
  set.seed(rngSeed)
  K = 2

  #============================================================================
  # females
  female_data = subset(dset2use, dset2use$sex=="Female")
  dset2use4real = female_data

  dsetID = unique(dset2use4real$Centre)
  result = vector(mode = "list", length = K)
  result[[1]] = data.frame(matrix(nrow=0,ncol=0))
  result[[2]] = data.frame(matrix(nrow=0,ncol=0))
  for (i in 1:length(dsetID)) {
    curr_dset = dsetID[i]
    dset_mask = is.element(dset2use4real$Centre,curr_dset)
    dset_tmp = dset2use4real[dset_mask,]
    cvind = crossvalind(dim(dset_tmp)[1], K)
    if (is.even(i)) {
      fold1 = cvind$V1
      fold2 = cvind$V2
    } else if (is.odd(i)) {
      fold1 = cvind$V2
      fold2 = cvind$V1
    } # if (is.even(i)) {
    Discovery = dset_tmp[fold1,]
    Replication = dset_tmp[fold2,]

    result[[1]] = rbind(result[[1]],Discovery)
    result[[2]] = rbind(result[[2]],Replication)
  }#for (i in 1:length(dsetID)) {

  female_result = result

  #============================================================================
  # males
  male_data = subset(dset2use, dset2use$sex=="Male")
  dset2use4real = male_data

  dsetID = unique(dset2use4real$Centre)
  result = vector(mode = "list", length = K)
  result[[1]] = data.frame(matrix(nrow=0,ncol=0))
  result[[2]] = data.frame(matrix(nrow=0,ncol=0))
  for (i in 1:length(dsetID)) {
    curr_dset = dsetID[i]
    dset_mask = is.element(dset2use4real$Centre,curr_dset)
    dset_tmp = dset2use4real[dset_mask,]
    cvind = crossvalind(dim(dset_tmp)[1], K)
    if (is.even(i)) {
      fold1 = cvind$V1
      fold2 = cvind$V2
    } else if (is.odd(i)) {
      fold1 = cvind$V2
      fold2 = cvind$V1
    } # if (is.even(i)) {
    Discovery = dset_tmp[fold1,]
    Replication = dset_tmp[fold2,]

    result[[1]] = rbind(result[[1]],Discovery)
    result[[2]] = rbind(result[[2]],Replication)
  }#for (i in 1:length(dsetID)) {

  male_result = result

  #============================================================================
  result = vector(mode = "list", length = K)
  result[[1]] = rbind(male_result[[1]],female_result[[1]])
  result[[2]] = rbind(male_result[[2]],female_result[[2]])

  result
} # end function SplitDatasets-------------------------------------------------


# function to make clustergram plot--------------------------------------------
makeClustergram <- function(clusterDataResult, fname2save = "clustergram.pdf") {
  library(WGCNA)
  # library(tools)

  cLim = c(min(clusterDataResult$adjMat),max(clusterDataResult$adjMat))

  pdf(file = fname2save)
  TOMplot(dissim = as.matrix(clusterDataResult$adjMat),
          dendro = clusterDataResult$clustTree,
          Colors = as.character(clusterDataResult$dynamicColors),
          zlim=cLim, terrainColors = FALSE, col=blueWhiteRed(50))
  dev.off()
  # compactPDF(fname2save)
}# end function makeClustergram------------------------------------------------

# function to cluster the data-------------------------------------------------
ClusterData <- function(dset, deepSplit = 1, minClusterSize = 1, cLim = c(0,1),
                        netType = "signed", linkMethod = "ward.D2", distMetric = "euclidean",
                        mergeModules = FALSE, modMergeCutHeight = 0.01, stand = FALSE, fname2save = FALSE) {

  result = list(length = 11)
  # save input arguments
  result$dset = dset
  result$deepSplit = deepSplit
  result$minClusterSize = minClusterSize
  result$cLim = cLim
  result$netType = netType
  result$linkMethod = linkMethod
  result$distMetric = distMetric

  # load requisite libraries
  library(WGCNA)
  library(cluster)

  # make distance matrix
  if (distMetric=="euclidean") {
    if (!is.logical(stand)) {
      scale_by = dist(rbind(rep(0, times = length(stand)), stand), method = distMetric)
      adjMat = as.matrix(dist(as.matrix(dset), method = distMetric))
      adjMat = adjMat/scale_by
      mat2clust = adjMat
    } else {
      # adjMat = as.matrix(dist(as.matrix(dset), method = distMetric))
      adjMat = as.matrix(daisy(as.matrix(dset), metric = distMetric, stand = TRUE))
      mat2clust = adjMat
    }#if (!is.logical(stand)) {
  } else if (distMetric=="gower") {
    adjMat = as.matrix(daisy(as.matrix(dset), metric = distMetric, stand = TRUE))
    mat2clust = adjMat
  } else if (distMetric=="correlation") {
    adjMat = as.matrix(adjacency(t(dset), type = netType))
    # TOM = TOMsimilarity(adjMat, TOMType = "signed")
    mat2clust = adjMat
  }
  result$adjMat = adjMat

  # run hierarchical clustering
  result$clustTree = hclust(as.dist(mat2clust), method = linkMethod)
  clustTree = result$clustTree

  # dynamic hybrid tree cutting
  dynamicMods = cutreeDynamic(dendro = clustTree, distM = mat2clust,
                              deepSplit = deepSplit, pamRespectsDendro = FALSE, minClusterSize = minClusterSize)
  dynamicColors = labels2colors(dynamicMods)

  # print table of module numbers and module colors
  table(dynamicMods)
  table(dynamicColors)
  result$dynamicMods = dynamicMods
  result$dynamicColors = dynamicColors

  if (mergeModules) {
    # Call automatic merging function -------------------------------------
    merge = mergeCloseModules(t(dset), dynamicColors,
                              cutHeight = modMergeCutHeight, verbose = 3, relabel = TRUE)

    # Merge module colors -------------------------------------------------
    mergedColors = merge$colors

    # rename to moduleColors ----------------------------------------------
    moduleColors = mergedColors

    # Construct numerical labels corresponding to the colors --------------
    colorOrder = c("grey", standardColors(50))
    moduleLabels = match(moduleColors, colorOrder)-1
    result$dynamicMods = moduleLabels
    result$dynamicColors = mergedColors
    #MEs = mergedMEs
  } else {
    result$dynamicMods = dynamicMods
    result$dynamicColors = dynamicColors
  }# if (mergeModules)

  # make plot
  if (is.character(fname2save)) {
    makeClustergram(result, fname2save)
  }# if (makePlot)

  result
}# end function ClusterData----------------------------------------------------


# function to relabel colors of clusters---------------------------------------
relabelClusters <- function(clusterDataResult, oldColors, newColors) {
  relabeledColors = vector("character",
                           length = length(clusterDataResult$dynamicColors))
  for (i in 1:length(oldColors)) {
    mask = clusterDataResult$dynamicColors==oldColors[i]
    relabeledColors[mask] = newColors[i]
  }#for (i in 1:length(oldColors)) {
  clusterDataResult$dynamicColors = relabeledColors
  clusterDataResult
}# end function relableClusters------------------------------------------------


# function to plot summary scores in each subgroup-----------------------------
makeSummaryPlot <- function(clusterDataResult, plotType = "line",
                            fname2save = FALSE, plotDim = NULL, transformPercentSeverity = FALSE,
                            yLim = c(0,0.8)) {
  library(ggplot2)
  library(reshape)
  library(Rmisc)

  df2use = as.data.frame(clusterDataResult$dset)

  # transform scores to percentage of max total one could score
  if (!is.logical(transformPercentSeverity)) {
    for (i in 1:length(transformPercentSeverity)) {
      df2use[,i] = df2use[,i]/transformPercentSeverity[i]
    }#for (i in 1:length(transformPercentSeverity)) {
    yLabel = "Percent Severity"
  } else {
    yLabel = "Score"
  }#if (!transformPercentSeverity==FALSE) {

  df2use$subgroup = clusterDataResult$dynamicColors
  dt = melt(df2use,id = "subgroup")
  dt$subgrpName = dt$subgroup
  uniqueColors = sort(unique(dt$subgrpName))

  p = ggplot(data = dt, aes(x = as.factor(variable),y = value,
                            colour = as.factor(subgrpName), fill = as.factor(subgrpName)))

  if (plotType=="line") {
    # p = p + geom_point(stat='summary', fun.y=mean) +
    # 	stat_summary(fun.y = mean, geom="line", aes(group = subgrpName)) +
    # 	stat_summary(fun.data = "mean_cl_boot")

    ds = summarySE(dt, measurevar = "value", groupvar = c("variable","subgrpName"))
    p = ggplot(ds, aes(x=as.factor(variable), y=value, colour=as.factor(subgrpName))) +
      geom_point(stat='summary', fun.y=mean) +
      stat_summary(fun.y = mean, geom="line", aes(group = subgrpName)) +
      geom_errorbar(aes(ymin=value-ci, ymax=value+ci),width=0)

  } else if (plotType=="bar") {
    p = p + geom_bar(position = "dodge",stat = "summary", fun.y = "mean") +
      stat_summary(fun.data = "mean_cl_boot")
  } else if (plotType=="violin") {
    p = p + geom_violin()
    p = p + scale_fill_manual(values = uniqueColors)
  } else if (plotType=="jitter") {
    p = p + geom_jitter()
  } else if (plotType=="boxplot") {
    p = p + geom_boxplot(fill=NA)
  } # if (plotType=="line")

  p = p + scale_color_manual(values = uniqueColors)
  p = p + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  p = p + ylim(yLim[1],yLim[2])
  p = p + ylab(yLabel)
  p

  if (is.character(fname2save)) {
    if (is.null(plotDim)) {
      ggsave(file=fname2save)
    } else if (is.null(plotDim[1]) & !is.null(plotDim[2])) {
      ggsave(file=fname2save, height = plotDim[2])
    } else if (!is.null(plotDim[1]) & is.null(plotDim[2])) {
      ggsave(file=fname2save, width = plotDim[1])
    } else if (!is.null(plotDim[1]) & !is.null(plotDim[2])) {
      ggsave(file=fname2save, width = plotDim[1], height = plotDim[2])
    } # if (is.null(plotDim))
  }#if (is.character(fname2save)) {
  return(p)
}# end function makeSummaryPlot------------------------------------------------


# function to load in each clustering result across deepSplit levels and then plot
# clustering groups underneath dendrogram
plotClustersDendrogram <- function(fnames, fname2save = FALSE) {
  library(WGCNA)
  tmp = readRDS(fnames[1])
  cTree = tmp$clustTree
  cLabels = vector("character",length=0)
  cGroups = data.frame(matrix(nrow=length(tmp$dynamicColors),ncol=length(fnames)))
  for (i in 1:length(fnames)) {
    tmp = readRDS(fnames[i])
    cLabels = c(cLabels, sprintf("dS=%d",i-1))
    cGroups[,i] = tmp$dynamicColors
  }

  if (is.character(fname2save)) {
    pdf(file = fname2save)
  }#if (is.character(fname2save)) {

  plotDendroAndColors(cTree,cGroups,cLabels,
                      dendroLabels = FALSE, hang = 0.03, addGuide=FALSE, guideHang = 0.05, main = " ")

  if (is.character(fname2save)) {
    dev.off()
  }#if (is.character(fname2save)) {
}# end function plotClustersDendrogram


# function to take a matrix of subjects x items and reorder the item dimension
reorderItems <- function(dset, reorderMethod = "mean", distMetric = FALSE, dS=0) {
  if (reorderMethod!="mean") {
    itemOrder = ClusterData(t(dset), distMetric = distMetric, deepSplit=dS, fname2save = FALSE)
    uniqueClusters = unique(itemOrder$dynamicMods)
    result = as.data.frame(matrix(nrow = dim(dset)[1], ncol =0))
    for (i in 1:length(uniqueClusters)) {
      curr_cluster = uniqueClusters[i]
      mask = itemOrder$dynamicMods==curr_cluster
      result = cbind(result, dset[,mask])
    } # end for (i in 1:leength(uniqueClusters))
  } else if (reorderMethod=="mean") {
    CM = colMeans(dset, na.rm = TRUE)
    itemOrder = order(CM, decreasing = TRUE)
    result = dset[,itemOrder]
  }
  return(result)
}# end function reorderItems---------------------------------------------------

# function to find best rngSeed that makes best split of datasets balanced across sites
findBestSplit <- function(asd_df, seed_range = 1:1000) {
  diffTableDiscrepancy = data.frame(matrix(nrow = length(seed_range), ncol = 2))
  colnames(diffTableDiscrepancy) = c("seed","discrepancy")
  for (i in 1:length(seed_range)){
    print(seed_range[i])
    rngSeed = seed_range[i]
    diffTableDiscrepancy$seed[i] = rngSeed

    # split Schedule A dataset
    dset2use = subset(asd_df, asd_df$Schedule=="A")
    tmp_d = SplitDatasets(dset2use, rngSeed = rngSeed)
    A_Discovery = tmp_d[[1]]
    A_Replication = tmp_d[[2]]

    # split Schedule B dataset
    dset2use = subset(asd_df, asd_df$Schedule=="B")
    tmp_d = SplitDatasets(dset2use, rngSeed = rngSeed)
    B_Discovery = tmp_d[[1]]
    B_Replication = tmp_d[[2]]

    # split Schedule C dataset
    dset2use = subset(asd_df, asd_df$Schedule=="C")
    tmp_d = SplitDatasets(dset2use, rngSeed = rngSeed)
    C_Discovery = tmp_d[[1]]
    C_Replication = tmp_d[[2]]

    # split Schedule D dataset
    dset2use = subset(asd_df, asd_df$Schedule=="D")
    tmp_d = SplitDatasets(dset2use, rngSeed = rngSeed)
    D_Discovery = tmp_d[[1]]
    D_Replication = tmp_d[[2]]

    df_Disc = rbind(A_Discovery, B_Discovery, C_Discovery, D_Discovery)
    df_Rep = rbind(A_Replication, B_Replication, C_Replication, D_Replication)

    a = table(df_Disc$Schedule, df_Disc$Centre)
    b = table(df_Rep$Schedule, df_Rep$Centre)
    if (identical(dim(a),dim(b))) {
      diffTable = a-b
      diffTableDiscrepancy$discrepancy[i] = sum(rowSums(abs(diffTable)))
    } else {
      diffTableDiscrepancy$discrepancy[i] = NA
    }
  }
  return(diffTableDiscrepancy)
}# function findBestSplit ----------------------------------------------------

# function to find TD Age Match
findTDAgeMatch <- function(dset2use, seed_range = c(77,73)) {
  require(MatchIt)

  asd_Disc = subset(dset2use, dset2use$Diagnosis=="ASD" & dset2use$dataset=="Discovery")
  asd_Rep = subset(dset2use, dset2use$Diagnosis=="ASD" & dset2use$dataset=="Replication")
  td_df = subset(dset2use, dset2use$Diagnosis=="TD" & is.na(dset2use$dataset))


  rngSeed = seed_range[1]
  tmp_d = SplitDatasets(td_df, rngSeed = rngSeed)
  td_Disc = tmp_d[[1]]

  data2test = rbind(td_Disc, asd_Disc)
  data2test$DV[data2test$Diagnosis=="TD"] = 0
  data2test$DV[data2test$Diagnosis=="ASD"] = 1
  tmp_df = data2test[,c("age","DV")]
  match.it = matchit(DV ~ age, data = tmp_df, method = "nearest")
  mask = is.element(rownames(data2test), match.it$match.matrix)
  td_Disc_matched = data2test[mask,]


  rngSeed = seed_range[2]
  tmp_d = SplitDatasets(td_df, rngSeed = rngSeed)
  td_Rep = tmp_d[[2]]

  data2test = rbind(td_Rep, asd_Rep)
  data2test$DV[data2test$Diagnosis=="TD"] = 0
  data2test$DV[data2test$Diagnosis=="ASD"] = 1
  tmp_df = data2test[,c("age","DV")]
  match.it = matchit(DV ~ age, data = tmp_df, method = "nearest")
  mask = is.element(rownames(data2test), match.it$match.matrix)
  td_Rep_matched = data2test[mask,]

  result = vector(mode = "list", length = 2)
  result[[1]] = td_Disc_matched
  result[[2]] = td_Rep_matched
  return(result)
}# function findTDAgeMatch --------------------------------------------------

#==============================================================================
