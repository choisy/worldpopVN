# NOTE: in order to save space, the data-raw/dropbox directory is not tracked by
# Git and thus not saved on GitHub. Instead, the directory is accessible from
# the URLs that are specified below in the urls object.

library(raster) # for "raster"

# Reading raw data from data-raw -----------------------------------------------
# the raw are downloaded manually from WorldPop website, contrary to GADM
# website from which data can be download from the command line.
VNM_ppp_v2b_2009 <- raster("data-raw/dropbox/data-raw/VNM_ppp_v2b_2009.tif")
VNM_ppp_v2b_2010 <- raster("data-raw/dropbox/data-raw/VNM_ppp_v2b_2010.tif")
VNM_ppp_v2b_2015 <- raster("data-raw/dropbox/data-raw/VNM_ppp_v2b_2015.tif")
VNM_ppp_v2b_2010_UNadj <- raster("data-raw/dropbox/data-raw/VNM_ppp_v2b_2010_UNadj.tif")
VNM_ppp_v2b_2015_UNadj <- raster("data-raw/dropbox/data-raw/VNM_ppp_v2b_2015_UNadj.tif")
VNM_ppp_v2b_2020_UNadj <- raster("data-raw/dropbox/data-raw/VNM_ppp_v2b_2020_UNadj.tif")

# Converting to integer format in order to save space --------------------------
rescale <- 1e4
datatype <- "INT2U"
values(VNM_ppp_v2b_2009) <- as.integer(rescale * values(VNM_ppp_v2b_2009))
values(VNM_ppp_v2b_2010) <- as.integer(rescale * values(VNM_ppp_v2b_2010))
values(VNM_ppp_v2b_2015) <- as.integer(rescale * values(VNM_ppp_v2b_2015))
values(VNM_ppp_v2b_2010_UNadj) <- as.integer(rescale * values(VNM_ppp_v2b_2010_UNadj))
values(VNM_ppp_v2b_2015_UNadj) <- as.integer(rescale * values(VNM_ppp_v2b_2015_UNadj))
values(VNM_ppp_v2b_2020_UNadj) <- as.integer(rescale * values(VNM_ppp_v2b_2020_UNadj))
dataType(VNM_ppp_v2b_2009) <- datatype
dataType(VNM_ppp_v2b_2010) <- datatype
dataType(VNM_ppp_v2b_2015) <- datatype
dataType(VNM_ppp_v2b_2010_UNadj) <- datatype
dataType(VNM_ppp_v2b_2015_UNadj) <- datatype
dataType(VNM_ppp_v2b_2020_UNadj) <- datatype

# Writting to files ------------------------------------------------------------
destdir <- "data-raw/dropbox/extdata"
if (!dir.exists(destdir)) dir.create(destdir)
VNM_ppp_v2b_2009 <- writeRaster(VNM_ppp_v2b_2009, "data-raw/dropbox/extdata/VNM_ppp_v2b_2009.tif", "GTiff", datatype="INT4U", overwrite = TRUE)
VNM_ppp_v2b_2010 <- writeRaster(VNM_ppp_v2b_2010, "data-raw/dropbox/extdata/VNM_ppp_v2b_2010.tif", "GTiff", datatype="INT4U", overwrite = TRUE)
VNM_ppp_v2b_2015 <- writeRaster(VNM_ppp_v2b_2015, "data-raw/dropbox/extdata/VNM_ppp_v2b_2015.tif", "GTiff", datatype="INT4U", overwrite = TRUE)
VNM_ppp_v2b_2010_UNadj <- writeRaster(VNM_ppp_v2b_2010_UNadj, "data-raw/dropbox/extdata/VNM_ppp_v2b_2010_UNadj.tif", "GTiff", datatype="INT4U", overwrite = TRUE)
VNM_ppp_v2b_2015_UNadj <- writeRaster(VNM_ppp_v2b_2015_UNadj, "data-raw/dropbox/extdata/VNM_ppp_v2b_2015_UNadj.tif", "GTiff", datatype="INT4U", overwrite = TRUE)
VNM_ppp_v2b_2020_UNadj <- writeRaster(VNM_ppp_v2b_2020_UNadj, "data-raw/dropbox/extdata/VNM_ppp_v2b_2020_UNadj.tif", "GTiff", datatype="INT4U", overwrite = TRUE)

# URLs -------------------------------------------------------------------------
# These URL are from data-raw/dropbox/data-raw, that's why we don't need the
# rescale in the in the getpop function:
urlso <- c("www.dropbox.com/s/t86uzrxc5mivegu/VNM_ppp_v2b_2009.tif?raw=1",
           "www.dropbox.com/s/0u6itmwex8i27fi/VNM_ppp_v2b_2010_UNadj.tif?raw=1",
           "www.dropbox.com/s/ds37tbig8wxlyo7/VNM_ppp_v2b_2010.tif?raw=1",
           "www.dropbox.com/s/m6aw27hdz9flmch/VNM_ppp_v2b_2015_UNadj.tif?raw=1",
           "www.dropbox.com/s/tsuqj33662hv3pd/VNM_ppp_v2b_2015.tif?raw=1",
           "www.dropbox.com/s/qc5yzdxflefbljx/VNM_ppp_v2b_2020_UNadj.tif?raw=1")

urlsc <- c("www.dropbox.com/s/qn1agzkbcdb4lr7/VNM_ppp_v2b_2009.tif?raw=1",
           "www.dropbox.com/s/hmcehhhxv9lguah/VNM_ppp_v2b_2010_UNadj.tif?raw=1",
           "www.dropbox.com/s/qsolker2k4xr7qq/VNM_ppp_v2b_2010.tif?raw=1",
           "www.dropbox.com/s/njwfaxq28ivr16o/VNM_ppp_v2b_2015_UNadj.tif?raw=1",
           "www.dropbox.com/s/w81rwt6uwnqf16s/VNM_ppp_v2b_2015.tif?raw=1",
           "www.dropbox.com/s/d7u50gb410qkung/VNM_ppp_v2b_2020_UNadj.tif?raw=1")

sizes <- c(VNM_ppp_v2b_2009.tif       = 123.2,
           VNM_ppp_v2b_2010_UNadj.tif = 123.4,
           VNM_ppp_v2b_2010.tif       = 123.2,
           VNM_ppp_v2b_2015_UNadj.tif = 123.6,
           VNM_ppp_v2b_2015.tif       = 123.3,
           VNM_ppp_v2b_2020_UNadj.tif = 123.8)

# Saving objects ---------------------------------------------------------------
devtools::use_data(VNM_ppp_v2b_2009,
                   VNM_ppp_v2b_2010,
                   VNM_ppp_v2b_2015,
                   VNM_ppp_v2b_2010_UNadj,
                   VNM_ppp_v2b_2015_UNadj,
                   VNM_ppp_v2b_2020_UNadj,
                   urlso, urlsc, sizes,
                   internal = TRUE, overwrite = TRUE)

# Personal installation (not run) ----------------------------------------------
if (FALSE) {
  origin_dir <- "data-raw/dropbox/extdata/"
  dest_dir <- paste0(path.package("worldpopVN"), "/extdata/")
  for(i in dir(origin_dir)) file.copy(paste0(origin_dir, i), paste0(dest_dir, i))
}
