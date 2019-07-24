# Download file
# insipired from function download of the package mcdev on github
# "choisy/mcdev"
download <- function(url, package, file, ...) {
  path <- find.package(package)
  destdir <- paste0(path, "/extdata")
  if (!dir.exists(destdir)) dir.create(destdir)
  utils::download.file(url, paste0(destdir, "/", file), ...)
  invisible(url)
}

# ------------------------------------------------------------------------------
#' Get local human population density
#'
#' Retrieves a raster file containing the local human population density of
#' Vietnam.
#'
#' @param year A numeric reflecting the year to retrieve the data. Could be
#' 2009, 2010, 2015 or 2020. 2009 is incompatible with adjusted = TRUE.
#' @param adjusted A logical indicating whether the data should be adjusted to
#' match UN population divisions estimates. TRUE is incompatible with
#' year = 2009.
#'
#' @export
#' @importFrom raster writeRaster values values<-
#' @importFrom utils installed.packages
#'
#' @examples
#' popvn_2009 <- getpop()
#'
#' # Or for 2020 with ajusted value to match UN population divisions estimates :
#'popvn_a2020 <- getpop(2020, adjusted = TRUE)
getpop <- function(year = 2009, adjusted = FALSE) {
  object <- paste0("VNM_ppp_v2b_", year, ifelse(adjusted, "_UNadj", ""))
  if (object %in% c("VNM_ppp_v2b_2009", "VNM_ppp_v2b_2010_UNadj",
                    "VNM_ppp_v2b_2010", "VNM_ppp_v2b_2015_UNadj",
                    "VNM_ppp_v2b_2015", "VNM_ppp_v2b_2020_UNadj")) {
    x <- get(object)
    filename <- paste0(installed.packages()["worldpopVN", "LibPath"],
                       "/worldpopVN/extdata/", object, ".tif")
    x@file@name <- filename
    if (!file.exists(filename)) {
      message("WorldPop data are not on disk.")
      message("Do you want to download them from the internet? y (default) / n")
      ans <- readline()
      if (ans %in% c("y", "")) {
        fname <- basename(filename)
        message(paste0(
          "Do you want to download the original file (603.8 MB) or a ",
          "compressed version (", mget("sizes", inherits = TRUE)[[1]][fname],
          " MB)? o / c (default)"))
        message(
          "Note: a compressed version will require additional compututing ",
          "(< 60'') for uncompressing.")
        ans <- readline()
        if (ans == "o") #nocov start
          download(
            grep(fname, mget("urlso", inherits = TRUE)[[1]], value = TRUE),
            "worldpopVN", fname, mode = "wb")
        else { #nocov end
          download(
            grep(fname,mget("urlsc", inherits = TRUE)[[1]], value = TRUE),
            "worldpopVN", fname, mode = "wb")
          message("Rescaling the data...")
          values(x) <- values(x) / 1e4
          message("Writing rescaled data to disk...")
          writeRaster(x, filename, "GTiff", overwrite = TRUE)
        }
      }
    }
    return(x)
  } else stop("'year' and 'adjusted' values do not fit.")
}
