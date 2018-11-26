library(dplyr)
library(sf)

vn <- sptools::gadm("vietnam", "sp", 1)
wp <- VNM_ppp_v2b_2009

popcenters2009 <- vn %>%
  sptools::as_list() %>%  # working by province
  parallel::mclapply(sptools::crop_on_poly, rstr = wp) %>%
  lapply(raster::rasterToPoints, spatial = TRUE) %>%  # weighted_centroid works on sp
  lapply(sptools::weighted_centroid) %>%
  purrr::reduce(dplyr::bind_rows) %>%
  mutate(province = vn@data$VARNAME_1) %>%
  st_as_sf(coords = c("x", "y"), crs = 4326)

