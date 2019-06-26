library(digest)

protocolTitle <-"Safety and Efficacy of the Xanomeline Transdermal Therapeutic 
  System (TTS) in Patients with Mild to Moderate Alzheimer's Disease"

protocolTitle_nws <- gsub(" ","", protocolTitle)

dateToday <- '2019-02-14'

protocolTitleDate_nws <- paste0 (protocolTitle_nws, dateToday)

studyURIHash <- sha1(protocolTitleDate_nws)

studyURIHash