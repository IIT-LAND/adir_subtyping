# ndar_functions.R

#==============================================================================

# DSM-5
# Totals and subtotals---------------------------------------------------------
adi_total_labels = c("Social Communication", "RRB")
adi_total_vars2use = c("dbaes_atotal","dbaes_btotal")

adi_subtotal_labels = c("SC A1","SC A2","SC A3","RRB B1","RRB B2","RRB B3","RRB B4")
adi_subtotal_vars2use = c("dbaes_a1","dbaes_a2","dbaes_a3",
                          "dbaes_b1","dbaes_b2","dbaes_b3","dbaes_b4")



# #==============================================================================
# # OLD #########################################################################
# # Items------------------------------------------------------------------------
# # Make labels for each item, and also indicate the names for the current and
# # ever/most abnormal variables
#
# # # Early Language Development
# # adi_earlyLang_labels_items = c("Age of first single words (If ever used) - In months",
# #                                "Age of first phrases (if ever used) - in months")
# # adi_earlyLang_items = c("acqorlossoflang_aword","acqorlossoflang_aphrase")
#
# # SC A1....................................................................
# adi_A1_labels_items = c("Social Verbalization/Chat",
#                         "Reciprocal conversation",
#                         "Use of other's body to communicate",
#                         "Showing and directing attention",
#                         "Seeking to share her/his enjoyment with others",
#                         "Offering comfort",
#                         "Social smiling")
# adi_A1_items = c("funccom_cchat",
#                  "funccom_chat5",
#                  "funccom_cusebod",
#                  "socdev_cshow",
#                  "socdev_cshare",
#                  "socdev_cocomf",
#                  "socdev_cssmile")
#
# # SC A2....................................................................
# adi_A2_labels_items = c("Pointing to express interest",
#                         "Nodding",
#                         "Head shaking",
#                         "Conventional/instrumental gestures",
#                         "Range of facial expressions used to communicate",
#                         "Inappropriate facial expressions")
# adi_A2_items = c("funccom_cpoint",
#                  "funccom_cnod",
#                  "funccom_chshake",
#                  "funccom_cinsges",
#                  "socdev_crfacex",
#                  "socdev_cinapfe")
#
# # SC A3....................................................................
# adi_A3_labels_items = c("Inappropriate questions or statements",
#                         "Inappropriate facial expressions",
#                         "Offering to share",
#                         "Appropriateness of social responses",
#                         "Reciprocal conversation",
#                         "Social disinhibition")
# adi_A3_items = c("funccom_cinappq",
#                  "socdev_cinapfe",
#                  "socdev_coshare",
#                  "socdev_cresp",
#                  "funccom_chat5",
#                  "socdev_csocdis")
#
# # RRB B1....................................................................
# adi_B1_labels_items = c("Stereotyped utterances and delayed echolalia",
#                         "Pronominal reversal",
#                         "Neologisms/idiosyncratic language",
#                         "Repetitive use of objects or interest in parts of objects",
#                         "Hand and finger mannerisms",
#                         "Other complex mannerisms or stereotyped body movements")
# adi_B1_items = c("funccom_estereo",
#                  "funccom_epron",
#                  "funccom_eneoid",
#                  "intbehav_euseobj",
#                  "intbehav_ehfman",
#                  "intbehav_eothman")
#
# # RRB B2....................................................................
# adi_B2_labels_items = c("Verbal rituals",
#                         "Compulsions/rituals",
#                         "Difficulties with minor changes in subject's own routines or personal environment",
#                         "Resistance to trivial changes in the environment")
# adi_B2_items = c("funccom_everrit",
#                  "intbehav_ecrit",
#                  "intbehav_echange",
#                  "intbehav_eresis")
#
# # RRB B3....................................................................
# adi_B3_labels_items = c("Unusual preoccupations",
#                         "Circumscribed interests",
#                         "Unusual attachment to objects")
# adi_B3_items = c("intbehav_eunproc",
#                  "intbehav_ecirint",
#                  "intbehav_euatt")
#
# # RRB B4....................................................................
# adi_B4_labels_items = c("Undue general sensitivity to noise",
#                         "Abnormal idiosyncratic negative response to specific sensory stimuli",
#                         "Unusual sensory interests")
# adi_B4_items = c("intbehav_enoise",
#                  "intbehav_eabinr",
#                  "intbehav_eunsens")
#
#
# # RRB B4....................................................................
# adi_B4_labels_items = c("Undue general sensitivity to noise",
#                         "Abnormal idiosyncratic negative response to specific sensory stimuli",
#                         "Unusual sensory interests")
# adi_B4_items = c("intbehav_enoise",
#                  "intbehav_eabinr",
#                  "intbehav_eunsens")
#
# # DSMIV verbal items (B2 (Verbal) + B3 (Verbal))............................
# adi_DSMIVverbal_labels_items = c("Social Verbalization/Chat","Reciprocal conversation",
#                                  "Stereotyped utterances and Delayed Echolalia",
#                                  "Inappropriate questions","Pronominal reversal",
#                                  "Neologisms/idiosyncratic language")
# adi_DSMIVverbal_items = c("funccom_cchat","funccom_chat5",
#                           "funccom_estereo","funccom_cinappq","funccom_epron","funccom_eneoid")







# NEW #########################################################################
# Items------------------------------------------------------------------------
# Make labels for each item, and also indicate the names for the current and
# ever/most abnormal variables

# # Early Language Development
# adi_earlyLang_labels_items = c("Age of first single words (If ever used) - In months",
#                                "Age of first phrases (if ever used) - in months")
# adi_earlyLang_items = c("acqorlossoflang_aword","acqorlossoflang_aphrase")

# SC A1....................................................................
adi_A1_labels_items = c("Social Verbalization/Chat",
                        "Reciprocal conversation",
                        "Use of other's body to communicate",
                        "Imitative social play",
                        "Showing and directing attention",
                        "Seeking to share her/his enjoyment with others",
                        "Offering comfort",
                        "Attention to voice",
                        "Social smiling")
adi_A1_items = c("funccom_cchat",
                 "funccom_chat5",
                 "funccom_cusebod",
                 "socdev_csoplay",
                 "socdev_cshow",
                 "socdev_cshare",
                 "socdev_cocomf",
                 "funccom_cavoice",
                 "socdev_cssmile")

# SC A2....................................................................
adi_A2_labels_items = c("Direct gaze",
                        "Pointing to express interest",
                        "Nodding",
                        "Head shaking",
                        "Conventional/instrumental gestures",
                        "Range of facial expressions used to communicate",
                        "Quality of social overtures")
adi_A2_items = c("socdev_cgaze",
                 "funccom_cpoint",
                 "funccom_cnod",
                 "funccom_chshake",
                 "funccom_cinsges",
                 "socdev_crfacex",
                 "socdev_cqualov")

# SC A3....................................................................
adi_A3_labels_items = c("Inappropriate questions or statements",
                        "Inappropriate facial expressions",
                        "Offering to share",
                        "Appropriateness of social responses",
                        "Interest in children",
                        "Responses to approaches of other children",
                        "Imaginative play with peers",
                        "Group play with peers",
                        "Friendships",
                        "Social disinhibition")
adi_A3_items = c("funccom_cinappq",
                 "socdev_cinapfe",
                 "socdev_coshare",
                 "socdev_cresp",
                 "socdev_cintch",
                 "socdev_crespch",
                 "funccom_cpeerpl",
                 "socdev_cgrplay",
                 "socdev_cfriend",
                 "socdev_csocdis")

# RRB B1....................................................................
adi_B1_labels_items = c("Stereotyped utterances and delayed echolalia",
                        "Pronominal reversal",
                        "Neologisms/idiosyncratic language",
                        "Repetitive use of objects or interest in parts of objects",
                        "Hand and finger mannerisms",
                        "Other complex mannerisms or stereotyped body movements")
adi_B1_items = c("funccom_estereo",
                 "funccom_epron",
                 "funccom_eneoid",
                 "intbehav_euseobj",
                 "intbehav_ehfman",
                 "intbehav_eothman")

# RRB B2....................................................................
adi_B2_labels_items = c("Verbal rituals",
                        "Compulsions/rituals",
                        "Difficulties with minor changes in subject's own routines or personal environment",
                        "Resistance to trivial changes in the environment")
adi_B2_items = c("funccom_everrit",
                 "intbehav_ecrit",
                 "intbehav_echange",
                 "intbehav_eresis")

# RRB B3....................................................................
adi_B3_labels_items = c("Unusual preoccupations",
                        "Circumscribed interests",
                        "Unusual attachment to objects")
adi_B3_items = c("intbehav_eunproc",
                 "intbehav_ecirint",
                 "intbehav_euatt")

# RRB B4....................................................................
adi_B4_labels_items = c("Undue general sensitivity to noise",
                        "Abnormal idiosyncratic negative response to specific sensory stimuli",
                        "Unusual sensory interests")
adi_B4_items = c("intbehav_enoise",
                 "intbehav_eabinr",
                 "intbehav_eunsens")


# DSMIV verbal items (B2 (Verbal) + B3 (Verbal))............................
adi_DSMIVverbal_labels_items = c("Social Verbalization/Chat","Reciprocal conversation",
                                 "Stereotyped utterances and Delayed Echolalia",
                                 "Inappropriate questions","Pronominal reversal",
                                 "Neologisms/idiosyncratic language")
adi_DSMIVverbal_items = c("funccom_cchat","funccom_chat5",
                          "funccom_estereo","funccom_cinappq","funccom_epron","funccom_eneoid")










# #==============================================================================
# # OLD #########################################################################
# RescoreADI_DSM5 <- function(D, ItemNames, subscaleName) {
#
#   D_subset = D[,ItemNames]
#
#   result = vector("numeric", length = nrow(D_subset))
#
#   # change any items that are 8 or 9 to NA
#   mask = D_subset==7 | D_subset==8 | D_subset==9
#   D_subset[mask] = NA
#   # mask = ever_subset==7 | ever_subset==8 | ever_subset==9
#   # ever_subset[mask] = NA
#
#   # change any items that are 3 to 2
#   # mask = curr_subset==3
#   # curr_subset[mask] = 2
#   # mask = ever_subset==3
#   # ever_subset[mask] = 2
#
#   for (i in 1:nrow(D_subset)) {
#
#     #Score A1--------------------------------------------------------------
#     if (subscaleName=="A1") {
#
#       # social verbalization chat
#       chat = D_subset[i,ItemNames[1]]
#       chat = as.numeric(chat)
#
#       # reciprocal conversation
#       recipconv = D_subset[i,ItemNames[2]]
#       recipconv = as.numeric(recipconv)
#
#       # use of other's body to communicate
#       useothbodcomm = D_subset[i,ItemNames[3]]
#       useothbodcomm = as.numeric(useothbodcomm)
#
#       # showing or directing attention
#       showing = D_subset[i,ItemNames[4]]
#       showing = as.numeric(showing)
#
#       # seeking to share enjoyment with others
#       shareenjoy = D_subset[i,ItemNames[5]]
#       shareenjoy = as.numeric(shareenjoy)
#
#       # comfort
#       comfort = D_subset[i,ItemNames[6]]
#       comfort = as.numeric(comfort)
#
#       # social smiling
#       socsmile = D_subset[i,ItemNames[7]]
#       socsmile = as.numeric(socsmile)
#
#       # compute score
#       if (is.na(chat) & is.na(recipconv) & is.na(useothbodcomm) & is.na(showing) & is.na(shareenjoy) & is.na(comfort) & is.na(socsmile)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(chat, recipconv, useothbodcomm, showing, shareenjoy, comfort, socsmile, na.rm = TRUE)
#       }#if
#     } # if (subscaleName = "A1") {
#     #Score A1--------------------------------------------------------------
#
#     #Score A2--------------------------------------------------------------
#     if (subscaleName=="A2") {
#
#       # pointing
#       pointing = D_subset[i,ItemNames[1]]
#       pointing = as.numeric(pointing)
#
#       # nodding
#       nodding = D_subset[i,ItemNames[2]]
#       nodding = as.numeric(nodding)
#
#       # headshake
#       headshake = D_subset[i,ItemNames[3]]
#       headshake = as.numeric(headshake)
#
#       # conventional instrumental gestures
#       coninstrgest = D_subset[i,ItemNames[4]]
#       coninstrgest = as.numeric(coninstrgest)
#
#       # range of facial expressions to communicate
#       rangefaceexpcomm = D_subset[i,ItemNames[5]]
#       rangefaceexpcomm = as.numeric(rangefaceexpcomm)
#
#       # inappropriate facial expressions
#       inappfaceexp = D_subset[i,ItemNames[6]]
#       inappfaceexp = as.numeric(inappfaceexp)
#
#       # compute score
#       if (is.na(pointing) & is.na(nodding) & is.na(headshake) & is.na(coninstrgest) & is.na(rangefaceexpcomm) & is.na(inappfaceexp)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(pointing, nodding, headshake, coninstrgest, rangefaceexpcomm, inappfaceexp, na.rm = TRUE)
#       }#if
#     } # if (subscaleName = "A2") {
#     #Score A2--------------------------------------------------------------
#
#     #Score A3--------------------------------------------------------------
#     if (subscaleName=="A3") {
#
#       # inappropriate questions or statements
#       inappquest = D_subset[i,ItemNames[1]]
#       inappquest = as.numeric(inappquest)
#
#       # inappropriate facial expressions
#       inappfaceexp = D_subset[i,ItemNames[2]]
#       inappfaceexp = as.numeric(inappfaceexp)
#
#       # offering to share
#       share = D_subset[i,ItemNames[3]]
#       share = as.numeric(share)
#
#       # appropriateness of social responses
#       appsocresp = D_subset[i,ItemNames[4]]
#       appsocresp = as.numeric(appsocresp)
#
#       # reciprocal conversation
#       recipconv = D_subset[i,ItemNames[5]]
#       recipconv = as.numeric(recipconv)
#
#       # social disinhibition
#       socdisinhibition = D_subset[i,ItemNames[6]]
#       socdisinhibition = as.numeric(socdisinhibition)
#
#       # compute score
#       if (is.na(inappquest) & is.na(inappfaceexp) & is.na(share) & is.na(appsocresp) & is.na(recipconv) & is.na(socdisinhibition)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(inappquest, inappfaceexp, share, appsocresp, recipconv, socdisinhibition, na.rm = TRUE)
#       }#if
#     } # if (subscaleName = "A3") {
#     #Score A3--------------------------------------------------------------
#
#
#     #Score B1--------------------------------------------------------------
#     if (subscaleName=="B1") {
#
#       # sterotyped utteranges and delayed echolalia
#       stuttdelecho = D_subset[i,ItemNames[1]]
#       stuttdelecho = as.numeric(stuttdelecho)
#
#       # pronominal reversal
#       pronounrev = D_subset[i,ItemNames[2]]
#       pronounrev = as.numeric(pronounrev)
#
#       # neologisms idiosyncractic language
#       neologidiolang = D_subset[i,ItemNames[3]]
#       neologidiolang = as.numeric(neologidiolang)
#
#       # repetitive use of objects
#       repuseobj = D_subset[i,ItemNames[4]]
#       repuseobj = as.numeric(repuseobj)
#
#       # hand and finger mannerisms
#       handfinger = D_subset[i,ItemNames[5]]
#       handfinger = as.numeric(handfinger)
#
#       # other complex mannerisms or sterotyped body movements
#       othcompmann = D_subset[i,ItemNames[6]]
#       othcompmann = as.numeric(othcompmann)
#
#       # compute score
#       if (is.na(stuttdelecho) & is.na(pronounrev) & is.na(neologidiolang) & is.na(repuseobj) & is.na(handfinger) & is.na(othcompmann)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(stuttdelecho, pronounrev, neologidiolang, repuseobj, handfinger, othcompmann, na.rm = TRUE)
#       }#if
#     }# if (subscaleName = "B1") {
#     #Score B1--------------------------------------------------------------
#
#     #Score B2--------------------------------------------------------------
#     if (subscaleName=="B2") {
#
#       # verbal rituals
#       verbrit = D_subset[i,ItemNames[1]]
#       verbrit = as.numeric(verbrit)
#
#       # compulsions and rituals
#       comprit = D_subset[i,ItemNames[2]]
#       comprit = as.numeric(comprit)
#
#       # difficulties with minor change
#       diffminchange = D_subset[i,ItemNames[3]]
#       diffminchange = as.numeric(diffminchange)
#
#       # resistance to trivial change
#       restrivchange = D_subset[i,ItemNames[4]]
#       restrivchange = as.numeric(restrivchange)
#
#       # compute score
#       if (is.na(verbrit) & is.na(comprit) & is.na(diffminchange) & is.na(restrivchange)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(verbrit, comprit, diffminchange, restrivchange, na.rm = TRUE)
#       }#if
#     }# if (subscaleName = "B2") {
#     #Score B2--------------------------------------------------------------
#
#     #Score B3--------------------------------------------------------------
#     if (subscaleName=="B3") {
#
#       # unusual preoccupations
#       unusualpreocc = D_subset[i,ItemNames[1]]
#       unusualpreocc = as.numeric(unusualpreocc)
#
#       # circumscribed interests
#       circumint = D_subset[i,ItemNames[2]]
#       circumint = as.numeric(circumint)
#
#       # unusual attachment to objects
#       unusualattachobj = D_subset[i,ItemNames[3]]
#       unusualattachobj = as.numeric(unusualattachobj)
#
#       # compute score
#       if (is.na(unusualpreocc) & is.na(circumint) & is.na(unusualattachobj)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(unusualpreocc, circumint, unusualattachobj, na.rm = TRUE)
#       }#if
#     } # if (subscaleName = "B3") {
#     #Score B3--------------------------------------------------------------
#
#     #Score B4--------------------------------------------------------------
#     if (subscaleName=="B4") {
#
#       # sensitivity to noise
#       sensnoise = D_subset[i,ItemNames[1]]
#       sensnoise = as.numeric(sensnoise)
#
#       # abnormal idiosyncratic negative response to specific stimuli
#       abnormrespspecstim = D_subset[i,ItemNames[2]]
#       abnormrespspecstim = as.numeric(abnormrespspecstim)
#
#       # unusual sensory interests
#       unusualsensint = D_subset[i,ItemNames[3]]
#       unusualsensint = as.numeric(unusualsensint)
#
#       # compute score
#       if (is.na(sensnoise) & is.na(abnormrespspecstim) & is.na(unusualsensint)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(sensnoise, abnormrespspecstim, unusualsensint, na.rm = TRUE)
#       }#if
#     }# if (subscaleName = "B4") {
#     #Score B4--------------------------------------------------------------
#
#
#     # DSM IV Verbal subscales (B2 + B3)------------------------------------
#     #Score B2--------------------------------------------------------------
#     if (subscaleName=="DSMIVverbal") {
#
#
#       # social verbalization chat
#       chat = D_subset[i,ItemNames[1]]
#       chat = as.numeric(chat)
#
#       # reciprocal conversation
#       recipconv = D_subset[i,ItemNames[2]]
#       recipconv = as.numeric(recipconv)
#
#
#       # sterotyped utteranges and delayed echolalia
#       stuttdelecho = D_subset[i,ItemNames[3]]
#       stuttdelecho = as.numeric(stuttdelecho)
#
#       # inappropriate questions or statements
#       inappquest = D_subset[i,ItemNames[4]]
#       inappquest = as.numeric(inappquest)
#
#       # pronominal reversal
#       pronounrev = D_subset[i,ItemNames[5]]
#       pronounrev = as.numeric(pronounrev)
#
#       # neologisms idiosyncractic language
#       neologidiolang = D_subset[i,ItemNames[6]]
#       neologidiolang = as.numeric(neologidiolang)
#
#       if (is.na(chat) & is.na(recipconv) & is.na(stuttdelecho) & is.na(inappquest) & is.na(pronounrev) & is.na(neologidiolang)) {
#         result[i] = NA
#       } else {
#         result[i] = sum(chat, recipconv, stuttdelecho, inappquest, pronounrev, neologidiolang, na.rm = TRUE)
#       }#if (is.na(chat) & is.na(conv)) {
#
#     } # if (subscaleName = "DSMIVverbal") {
#     #DSMIVverbal--------------------------------------------------------------
#
#
#   }#for (i in 1:nrow(curr_subset)) {
#
#   result
# }# end function RescoreADI
# #==============================================================================










#==============================================================================
# NEW #########################################################################
RescoreADI_DSM5 <- function(D, ItemNames, subscaleName) {

  D_subset = D[,ItemNames]

  result = vector("numeric", length = nrow(D_subset))

  # change any items that are 8 or 9 to NA
  # mask = D_subset==6 | D_subset==7 | D_subset==8 | D_subset==9
  mask = D_subset>3
  D_subset[mask] = 0
  # mask = ever_subset==7 | ever_subset==8 | ever_subset==9
  # ever_subset[mask] = NA

  # change any items that are 3 to 2
  # mask = curr_subset==3
  # curr_subset[mask] = 2
  # mask = ever_subset==3
  # ever_subset[mask] = 2

  for (i in 1:nrow(D_subset)) {

    subject_age = D[i,"interview_age"]/12
    # print(sprintf("%s age is %f",D[i,"subjectkey"],subject_age))

    if (is.na(subject_age)){
      result[i] = NA
    } else {

      #Score A1--------------------------------------------------------------
      if (subscaleName=="A1") {

        # social verbalization chat
        chat = D_subset[i,ItemNames[1]]
        chat = as.numeric(chat)

        # reciprocal conversation
        recipconv = D_subset[i,ItemNames[2]]
        recipconv = as.numeric(recipconv)

        # use of other's body to communicate
        useothbodcomm = D_subset[i,ItemNames[3]]
        useothbodcomm = as.numeric(useothbodcomm)

        # imitative social play
        imitsocplay = D_subset[i,ItemNames[4]]
        imitsocplay = as.numeric(imitsocplay)

        # showing or directing attention
        showing = D_subset[i,ItemNames[5]]
        showing = as.numeric(showing)

        # seeking to share enjoyment with others
        shareenjoy = D_subset[i,ItemNames[6]]
        shareenjoy = as.numeric(shareenjoy)

        # offering comfort
        comfort = D_subset[i,ItemNames[7]]
        comfort = as.numeric(comfort)

        # attention to voice
        att2voice = D_subset[i,ItemNames[8]]
        att2voice = as.numeric(att2voice)

        # social smiling
        socsmile = D_subset[i,ItemNames[9]]
        socsmile = as.numeric(socsmile)

        # grab relevant items for specific age bands
        if (subject_age<4){

          items2use = c(chat, recipconv, useothbodcomm, imitsocplay,
                        showing, shareenjoy, comfort, att2voice, socsmile)
          possible_points = c(3,3,3,3,
                              3,3,3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=4 | subject_age<10){

          items2use = c(chat, recipconv, useothbodcomm, imitsocplay,
                        showing, shareenjoy, comfort, socsmile)
          possible_points = c(3,3,3,3,
                              3,3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=10){

          items2use = c(chat, recipconv, useothbodcomm,
                        showing, shareenjoy, comfort, socsmile)
          possible_points = c(3,3,3,3,
                              3,3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } # if (subject_age<4){

        # compute score
        if (na_count==length(items2use)){
          result[i] = NA
        } else{
          result[i] = sum(items2use, na.rm=TRUE)/max_total_possible
        } # if (na_count==length(items2use)){

      } # if (subscaleName = "A1") {
      #Score A1--------------------------------------------------------------

      #Score A2--------------------------------------------------------------
      if (subscaleName=="A2") {

        # direct gaze
        directgaze = D_subset[i,ItemNames[1]]
        directgaze = as.numeric(directgaze)

        # pointing
        pointing = D_subset[i,ItemNames[2]]
        pointing = as.numeric(pointing)

        # nodding
        nodding = D_subset[i,ItemNames[3]]
        nodding = as.numeric(nodding)

        # headshake
        headshake = D_subset[i,ItemNames[4]]
        headshake = as.numeric(headshake)

        # conventional instrumental gestures
        coninstrgest = D_subset[i,ItemNames[5]]
        coninstrgest = as.numeric(coninstrgest)

        # range of facial expressions to communicate
        rangefaceexpcomm = D_subset[i,ItemNames[6]]
        rangefaceexpcomm = as.numeric(rangefaceexpcomm)

        # quality of social overtures
        qualsocover = D_subset[i,ItemNames[7]]
        qualsocover = as.numeric(qualsocover)

        # grab relevant items for specific age bands
        if (subject_age<4){

          items2use = c(directgaze, pointing, nodding, headshake,
                        coninstrgest, rangefaceexpcomm, qualsocover)
          possible_points = c(3,3,2,2,
                              3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=4 | subject_age<10){

          items2use = c(pointing, nodding, headshake,
                        coninstrgest, rangefaceexpcomm, qualsocover)
          possible_points = c(3,2,2,
                              3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=10){

          items2use = c(pointing, nodding, headshake,
                        coninstrgest, rangefaceexpcomm, qualsocover)
          possible_points = c(3,2,2,
                              3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } # if (subject_age<4){

        # compute score
        if (na_count==length(items2use)){
          result[i] = NA
        } else{
          result[i] = sum(items2use, na.rm=TRUE)/max_total_possible
        } # if (na_count==length(items2use)){

      } # if (subscaleName = "A2") {
      #Score A2--------------------------------------------------------------

      #Score A3--------------------------------------------------------------
      if (subscaleName=="A3") {

        # inappropriate questions or statements
        inappquest = D_subset[i,ItemNames[1]]
        inappquest = as.numeric(inappquest)

        # inappropriate facial expressions
        inappfaceexp = D_subset[i,ItemNames[2]]
        inappfaceexp = as.numeric(inappfaceexp)

        # offering to share
        share = D_subset[i,ItemNames[3]]
        share = as.numeric(share)

        # appropriateness of social responses
        appsocresp = D_subset[i,ItemNames[4]]
        appsocresp = as.numeric(appsocresp)

        # interest in children
        intchild = D_subset[i,ItemNames[5]]
        intchild = as.numeric(intchild)

        # responses to approach of other children
        respappothchild = D_subset[i,ItemNames[6]]
        respappothchild = as.numeric(respappothchild)

        # imaginative play with peers
        imagplaypeers = D_subset[i,ItemNames[7]]
        imagplaypeers = as.numeric(imagplaypeers)

        # group play with peers
        grpplaypeers = D_subset[i,ItemNames[8]]
        grpplaypeers = as.numeric(grpplaypeers)

        # reciprocal conversation
        recipconv = D_subset[i,ItemNames[9]]
        recipconv = as.numeric(recipconv)

        # social disinhibition
        socdisinhibition = D_subset[i,ItemNames[10]]
        socdisinhibition = as.numeric(socdisinhibition)

        # grab relevant items for specific age bands
        if (subject_age<4){

          items2use = c(inappquest, inappfaceexp, share,
                        appsocresp, intchild, respappothchild)
          possible_points = c(2,2,3,
                              3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=4 | subject_age<10){

          items2use = c(inappquest, inappfaceexp, share,
                        appsocresp, intchild, respappothchild,
                        imagplaypeers, grpplaypeers, recipconv,
                        socdisinhibition)
          possible_points = c(2,2,3,
                              3,3,3,
                              3,3,3,
                              3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=10){

          items2use = c(inappquest, inappfaceexp, share,
                        appsocresp,
                        recipconv,
                        socdisinhibition)
          possible_points = c(2,2,3,
                              3,
                              3,
                              3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } # if (subject_age<4){

        # compute score
        if (na_count==length(items2use)){
          result[i] = NA
        } else{
          result[i] = sum(items2use, na.rm=TRUE)/max_total_possible
        } # if (na_count==length(items2use)){

      } # if (subscaleName = "A3") {
      #Score A3--------------------------------------------------------------


      #Score B1--------------------------------------------------------------
      if (subscaleName=="B1") {

        # sterotyped utteranges and delayed echolalia
        stuttdelecho = D_subset[i,ItemNames[1]]
        stuttdelecho = as.numeric(stuttdelecho)

        # pronominal reversal
        pronounrev = D_subset[i,ItemNames[2]]
        pronounrev = as.numeric(pronounrev)

        # neologisms idiosyncractic language
        neologidiolang = D_subset[i,ItemNames[3]]
        neologidiolang = as.numeric(neologidiolang)

        # repetitive use of objects
        repuseobj = D_subset[i,ItemNames[4]]
        repuseobj = as.numeric(repuseobj)

        # hand and finger mannerisms
        handfinger = D_subset[i,ItemNames[5]]
        handfinger = as.numeric(handfinger)

        # other complex mannerisms or sterotyped body movements
        othcompmann = D_subset[i,ItemNames[6]]
        othcompmann = as.numeric(othcompmann)

        # grab relevant items for specific age bands
        if (subject_age<4){

          items2use = c(stuttdelecho, pronounrev, neologidiolang,
                        repuseobj, handfinger, othcompmann)
          possible_points = c(3,3,2,
                              3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=4 | subject_age<10){

          items2use = c(stuttdelecho, pronounrev, neologidiolang,
                        repuseobj, handfinger, othcompmann)
          possible_points = c(3,3,2,
                              3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=10){

          items2use = c(stuttdelecho, pronounrev, neologidiolang,
                        repuseobj, handfinger, othcompmann)
          possible_points = c(3,3,2,
                              3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } # if (subject_age<4){

        # compute score
        if (na_count==length(items2use)){
          result[i] = NA
        } else{
          result[i] = sum(items2use, na.rm=TRUE)/max_total_possible
        } # if (na_count==length(items2use)){

      }# if (subscaleName = "B1") {
      #Score B1--------------------------------------------------------------

      #Score B2--------------------------------------------------------------
      if (subscaleName=="B2") {

        # verbal rituals
        verbrit = D_subset[i,ItemNames[1]]
        verbrit = as.numeric(verbrit)

        # compulsions and rituals
        comprit = D_subset[i,ItemNames[2]]
        comprit = as.numeric(comprit)

        # difficulties with minor change
        diffminchange = D_subset[i,ItemNames[3]]
        diffminchange = as.numeric(diffminchange)

        # resistance to trivial change
        restrivchange = D_subset[i,ItemNames[4]]
        restrivchange = as.numeric(restrivchange)

        # grab relevant items for specific age bands
        if (subject_age<4){

          items2use = c(verbrit, comprit, diffminchange,
                        restrivchange)
          possible_points = c(3,3,3,
                              3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=4 | subject_age<10){

          items2use = c(verbrit, comprit, diffminchange,
                        restrivchange)
          possible_points = c(3,3,3,
                              3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=10){

          items2use = c(verbrit, comprit, diffminchange,
                        restrivchange)
          possible_points = c(3,3,3,
                              3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } # if (subject_age<4){

        # compute score
        if (na_count==length(items2use)){
          result[i] = NA
        } else{
          result[i] = sum(items2use, na.rm=TRUE)/max_total_possible
        } # if (na_count==length(items2use)){

      }# if (subscaleName = "B2") {
      #Score B2--------------------------------------------------------------

      #Score B3--------------------------------------------------------------
      if (subscaleName=="B3") {

        # unusual preoccupations
        unusualpreocc = D_subset[i,ItemNames[1]]
        unusualpreocc = as.numeric(unusualpreocc)

        # circumscribed interests
        circumint = D_subset[i,ItemNames[2]]
        circumint = as.numeric(circumint)

        # unusual attachment to objects
        unusualattachobj = D_subset[i,ItemNames[3]]
        unusualattachobj = as.numeric(unusualattachobj)

        # grab relevant items for specific age bands
        if (subject_age<4){

          items2use = c(unusualpreocc, circumint, unusualattachobj)
          possible_points = c(3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=4 | subject_age<10){

          items2use = c(unusualpreocc, circumint, unusualattachobj)
          possible_points = c(3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=10){

          items2use = c(unusualpreocc, circumint, unusualattachobj)
          possible_points = c(3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } # if (subject_age<4){

        # compute score
        if (na_count==length(items2use)){
          result[i] = NA
        } else{
          result[i] = sum(items2use, na.rm=TRUE)/max_total_possible
        } # if (na_count==length(items2use)){

      } # if (subscaleName = "B3") {
      #Score B3--------------------------------------------------------------

      #Score B4--------------------------------------------------------------
      if (subscaleName=="B4") {

        # sensitivity to noise
        sensnoise = D_subset[i,ItemNames[1]]
        sensnoise = as.numeric(sensnoise)

        # abnormal idiosyncratic negative response to specific stimuli
        abnormrespspecstim = D_subset[i,ItemNames[2]]
        abnormrespspecstim = as.numeric(abnormrespspecstim)

        # unusual sensory interests
        unusualsensint = D_subset[i,ItemNames[3]]
        unusualsensint = as.numeric(unusualsensint)

        # grab relevant items for specific age bands
        if (subject_age<4){

          items2use = c(sensnoise, abnormrespspecstim, unusualsensint)
          possible_points = c(3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=4 | subject_age<10){

          items2use = c(sensnoise, abnormrespspecstim, unusualsensint)
          possible_points = c(3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } else if (subject_age>=10){

          items2use = c(sensnoise, abnormrespspecstim, unusualsensint)
          possible_points = c(3,3,3)
          na_mask = is.na(items2use)
          na_count = sum(na_mask)
          max_total_possible = sum(possible_points[!na_mask])

        } # if (subject_age<4){

        # compute score
        if (na_count==length(items2use)){
          result[i] = NA
        } else{
          result[i] = sum(items2use, na.rm=TRUE)/max_total_possible
        } # if (na_count==length(items2use)){

      }# if (subscaleName = "B4") {
      #Score B4--------------------------------------------------------------


      # DSM IV Verbal subscales (B2 + B3)------------------------------------
      #Score B2--------------------------------------------------------------
      if (subscaleName=="DSMIVverbal") {


        # social verbalization chat
        chat = D_subset[i,ItemNames[1]]
        chat = as.numeric(chat)

        # reciprocal conversation
        recipconv = D_subset[i,ItemNames[2]]
        recipconv = as.numeric(recipconv)


        # sterotyped utteranges and delayed echolalia
        stuttdelecho = D_subset[i,ItemNames[3]]
        stuttdelecho = as.numeric(stuttdelecho)

        # inappropriate questions or statements
        inappquest = D_subset[i,ItemNames[4]]
        inappquest = as.numeric(inappquest)

        # pronominal reversal
        pronounrev = D_subset[i,ItemNames[5]]
        pronounrev = as.numeric(pronounrev)

        # neologisms idiosyncractic language
        neologidiolang = D_subset[i,ItemNames[6]]
        neologidiolang = as.numeric(neologidiolang)

        if (is.na(chat) & is.na(recipconv) & is.na(stuttdelecho) & is.na(inappquest) & is.na(pronounrev) & is.na(neologidiolang)) {
          result[i] = NA
        } else {
          result[i] = sum(chat, recipconv, stuttdelecho, inappquest, pronounrev, neologidiolang, na.rm = TRUE)
        }#if (is.na(chat) & is.na(conv)) {

      } # if (subscaleName = "DSMIVverbal") {
      #DSMIVverbal--------------------------------------------------------------
    } # if (is.na(subject_age)){

  }#for (i in 1:nrow(curr_subset)) {

  result
}# end function RescoreADI_DSM5
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
  dsetID = unique(dset2use$dataset_id)
  result = vector(mode = "list", length = K)
  result[[1]] = data.frame(matrix(nrow=0,ncol=0))
  result[[2]] = data.frame(matrix(nrow=0,ncol=0))
  for (i in 1:length(dsetID)) {
    curr_dset = dsetID[i]
    dset_mask = is.element(dset2use$dataset_id,curr_dset)
    dset_tmp = dset2use[dset_mask,]
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
  result
} # end function SplitDatasets-------------------------------------------------


# main function to split datasets----------------------------------------------
SplitDatasetsBySex <- function(dset2use, rngSeed = 1) {
  set.seed(rngSeed)
  K = 2

  #============================================================================
  # females
  female_data = subset(dset2use, dset2use$sex=="F")
  dset2use4real = female_data

  dsetID = unique(dset2use4real$dataset_id)
  result = vector(mode = "list", length = K)
  result[[1]] = data.frame(matrix(nrow=0,ncol=0))
  result[[2]] = data.frame(matrix(nrow=0,ncol=0))
  for (i in 1:length(dsetID)) {
    curr_dset = dsetID[i]
    dset_mask = is.element(dset2use4real$dataset_id,curr_dset)
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
  male_data = subset(dset2use, dset2use$sex=="M")
  dset2use4real = male_data

  dsetID = unique(dset2use4real$dataset_id)
  result = vector(mode = "list", length = K)
  result[[1]] = data.frame(matrix(nrow=0,ncol=0))
  result[[2]] = data.frame(matrix(nrow=0,ncol=0))
  for (i in 1:length(dsetID)) {
    curr_dset = dsetID[i]
    dset_mask = is.element(dset2use4real$dataset_id,curr_dset)
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


#==============================================================================
# Cluster data into subgroups

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
                        stand = FALSE, fname2save = FALSE) {

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
    adjMat = as.matrix(adjacency(t(dset), type = "signed"))
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
  # dt$subgrpName[dt$subgroup=="blue"] = "ASD1"
  # dt$subgrpName[dt$subgroup=="turquoise"] = "ASD2"
  # dt$subgrpName[dt$subgroup=="brown"] = "ASD3"
  # dt$subgrpName[dt$subgroup=="yellow"] = "ASD4"
  p = ggplot(data = dt, aes(x = as.factor(variable),y = value,
                            colour = as.factor(subgrpName), fill = as.factor(subgrpName)))

  if (plotType=="line") {
    #p = p + geom_point(stat='summary', fun.y=mean) +
    #	stat_summary(fun.y = mean, geom="line", aes(group = subgrpName)) +
    #	stat_summary(fun.data = "mean_cl_boot")

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

# function to check and correct dataset for items with scores of 3, 8, or 9----
checkItemData389 <- function(dset) {
  # mask3 = dset==3
  mask7 = dset==7
  mask8 = dset==8
  mask9 = dset==9
  # dset[mask3] = 2
  dset[mask7] = NA
  dset[mask8] = NA
  dset[mask9] = NA
  return(dset)
}# end function checkItemData389---------------------------------------------------

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
