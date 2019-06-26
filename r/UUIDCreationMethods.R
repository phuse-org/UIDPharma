# Programmatic UUID method
library(uuid)

Namespace    <- 'PharmaCo.com'
resourceType <- 'clinicaltrial'

UUID <- UUIDgenerate()
UID

studyURI <- paste0("https://", Namespace, "/", resourceType, "/", UUID)
studyURI


# Hash Method

library(digest)

Namespace    <- 'PharmaCo.com'
resourceType <- 'clinicaltrial'

# 1
protocolTitle <-"Safety and Efficacy of the Xanomeline Transdermal Therapeutic System (TTS) in Patients with Mild to Moderate Alzheimer's Disease"

# 2
protocolTitle_nws <- gsub(" ","", protocolTitle)

# 3
uuidTime <- '2019-02-14T09:30:10'

# 4
protocolTitleDate_nws <- paste0(protocolTitle_nws, uuidTime)
# 5
hashID <- sha1(protocolTitleDate_nws)

# 6
studyURI <- paste0("https://", Namespace, "/", resourceType, "/", hashID)
studyURI

# base64 Method

library(RCurl)

Namespace    <- 'PharmaCo.com'
resourceType <- 'clinicaltrial'

# 1
protocolTitle <-"Safety and Efficacy of the Xanomeline Transdermal Therapeutic 
  System (TTS) in Patients with Mild to Moderate Alzheimer's Disease"

# 2
protocolTitle_nws <- gsub(" ","", protocolTitle)

# 3
idTime <- '2019-02-14T09:30:10'

#4 
protocolTitleDate_nws <- paste0(protocolTitle_nws, idTime)

# 5 
encodedID <- base64(protocolTitleDate_nws)

# 6
studyURI <- paste0("https://", Namespace, "/", resourceType, "/", encodedID)
studyURI

# 7 
decoded_ID <- base64Decode(encodedID)
decoded_ID
