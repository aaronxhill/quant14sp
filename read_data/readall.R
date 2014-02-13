###################################################################################################
################# ADMIN CODE -- DO NOT MODIFY #####################################################
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
library(RCurl)
xadmin <- getURL("https://raw.github.com/aaronxhill/quant14sp/master/admin/admin.R")
eval(parse(text=xadmin), envir= .GlobalEnv)
###################################################################################################

