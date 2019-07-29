# worldpopVN 

This package contains local human population sizes per geographical pixel for
Vietnam. Data are from the [WorldPop](http://www.worldpop.org.uk).

**Note that in order to minimize the size of the TIFF files, the data actually
contains the populations sizes multiplied by 10,000.**

## Installation and loading

You can install `worldpopVN` from [GitHub](https://github.com/choisy/worldpopVN)

```{r eval = FALSE}
# install.packages("devtools")
devtools::install_github("choisy/worldpopVN", build_vignettes = TRUE)
```

Once installed, you can load the package:

```{r}
library(worldpopVN)
```

## Usage examples

The `RasterLayer` containing the local human density per pixel can be retrieved
with the `getpop` function:

```{r}
wpop <- getpop()
```

It's a `RasterLayer` object:

```{r}
wpop
```

that can be plotted with the `plot` method:

```{r}
plot(wpop)
```

Note that the `getpop` has 2 arguments `year` and `adjusted`. The first one is
the year for which we want the population density and can be 2009 (actual 
census), 2010, 2015 or 2020. By default the year is 2009. The second argument is
a logical value and says whether we want the data to be adjusted to match the UN
population divisions estimates. This argument cannot be set to `TRUE` if the
year is 2009. Only UN-adjsuted population sizes are available for 2020:

|      |  adjusted  |  non-adjusted  |
|------|:----------:|:--------------:|
| 2009 |            |        x       |
| 2010 |      x     |        x       |
| 2015 |      x     |        x       |
| 2020 |      x     |                |
