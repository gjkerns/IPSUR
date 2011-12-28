# Original code by Achim Zeileis, 16 Dec 2009, R-help
# Revised code for R 2.14.0 by Achim Zeleis, 16 Dec 2011, R-devel
# Added: support for header and preamble

## TODO:
#   - fix page numbers from (\d+)-(\d+) to $1--$2
#   - fix title MiXed CaSe words to {MiXed} {CaSe}
 
Rpackages.bib <- function(filename = paste("Rpackages-",getRversion(), ".bib", sep=""), 
		header=TRUE, preamble=NULL, suppress.warnings=TRUE, verbose = TRUE)
{
  ## query packages and their bibentries
  pkgs <- unique(installed.packages()[,1])
  if (suppress.warnings) {
  	warn <- options(warn=-1)
  	on.exit(options(warn))
  }
  bibs <- lapply(pkgs, function(x) try(citation(x)))
  n.installed <- length(bibs)

  ## exclude those with errors
  ok <- !(sapply(bibs, class) == "try-error")
  pkgs <- pkgs[ok]
  bibs <- bibs[ok]
  n.converted <- sum(ok)

  ## number of bibentries per package
  nref <- sapply(bibs, length)
  ncit <- sum(nref)

  ## merge all bibentries
  bibs <- do.call("c", bibs)

  ## add citation keys; need to number those where
  bibkeys <- lapply(1:length(nref), function(i)
    if(nref[i] > 1) paste(pkgs[i], 1:nref[i], sep = ":") else pkgs[i])
  bibs$key <- as.list(unlist(bibkeys))

	if(header) { 
		header <- gsub("^", "%", toLatex(sessionInfo()))
		header <- c(paste("BibTeX file:", filename, "written", Sys.Date(), "by Rpackages.bib()\n"),
							header) 
	}
	unlink(filename)
	output <- file(filename, "a")
	cat(header, preamble, sep='\n', file=output, append=TRUE)
	writeLines(toBibtex(bibs), con=output)
  close(output)
  if(verbose) cat("Converted", n.converted, "citations in", n.installed,
    "packages to BibTeX, containing", ncit, "entries.",
    "\nResults written to file", filename, "\n")

  ## return Bibtex items invisibly
  invisible(bibs)
}

