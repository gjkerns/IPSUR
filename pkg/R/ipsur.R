

read <- function(topic, pkg = "IPSUR"){
  topic <- as.character(substitute(topic))
  z <- paste("doc/", topic, ".pdf", sep = "")
  tmp <- list(pdf = file.path(system.file(package = pkg), z))
  utils:::print.vignette(tmp)
}


ipsur <- function (string, site = "ipsur.org")
{
   paste0 <- function(...) paste(..., sep = "")
   string <- paste0("http://www.google.com/search?as_q=",
       gsub(" ", "+", string))
   mpp <- paste0("as_sitesearch=", site)
   qstring <- paste(URLencode(string), mpp, sep = "&")
   browseURL(qstring)
   cat(gettext("A search query has been submitted to"), "http://www.google.com\n")
   cat(gettext("The results page should open in your browser shortly\n"))
   invisible(qstring)
}
