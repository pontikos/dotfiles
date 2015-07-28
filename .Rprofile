options(stringsAsFactors=FALSE) 

.First <- function() {
    .libLoc <- '~/Rpackages'
    .libPaths(c(.libLoc,.libPaths()))
    require(utils,quietly=TRUE)
    require(devtools,quietly=TRUE)
    #options( repos = c(CRAN = "http://cran.rstudio.com/"), browserNLdisabled = TRUE, deparse.max.lines = 2)
    #options(repos=structure(c(CRAN="http://cran.rstudio.com/"))
    #options(repos=c(CRAN="http://cran.uk.r-project.org"))
    #biocLite("snpStats")
    message(paste('R_LIBS:    ', Sys.getenv('R_LIBS'), sep=''))
    message(paste('R_PROFILE: ', Sys.getenv('R_PROFILE'), sep=''))
    # Customize the default look and feel of ggplot2
    if(require(ggplot2, quietly=TRUE)) {
    theme_update(panel.background=element_blank(), panel.grid.major=element_blank(), panel.border=element_blank())
    }
}

#' @title
#' Computes the maximum width of terminal window.
#'
#' @description
#' \code{\link{ncols}} detects the maximum number of columns of the current terminal window.
#' Note that columns are normally the same as characters except in CJK languages.
#'
#' @param     set_option    whether to automatically set the R terminal width to the system terminal maximum number of columns [default \code{TRUE}]
#' @return    The number of terminal window columns.
#' @export
ncols <- function(set_option = TRUE) {
    sysname <- Sys.info()['sysname']
    if ((ncol <- Sys.getenv('COLUMNS')) != '') {
    ncol <- as.integer(ncol)
    if (set_option) {
    options(width = ncol)
    }
    return(ncol)
    } else if ((sysname == 'Darwin' || sysname == 'Linux') && Sys.getenv('TERM') != '') {
    output <- tryCatch(system('tput cols', intern = TRUE), error = I)
    if (length(output) > 0) {
    ncol <- as.integer(sub('([0-9]+)', '\\1', output[1]))
    if (is.finite(ncol) && ncol > 0 && set_option) {
    options(width = ncol)
    }
    }
    rm(output)
    return(ncol)
    } else if (sysname == 'Windows') {
    return(getOption('width') - 1)
    }
    # fallback, should work also for Windows and various IDE (e.g. RStudio)
    return(getOption('width'))
}

options(width=as.integer(ncols()))
