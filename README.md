# IPSUR: Introduction to Probability and Statistics Using R

Copyright (C) 2022 G. Jay Kerns

Version 3.0

This package is the source code to generate `IPSUR`, a free textbook on Probability and Statistics.  

## Install

This package is not distributed on CRAN. The easiest/quickest way to get `IPSUR` (which at the moment doesn't do what it is supposed to do) is to install the `devtools` package if you don't have it already and run

```{r, eval=FALSE}
devtools::install_github("gjkerns/prob")
devtools::install_github("gjkerns/IPSUR")
```

You will get lots of errs due to missing dependencies.  See the file `renv.lock` to understand which packages you need to run `IPSUR`---there are quite a few. 

The source code for IPSUR is released under the GNU General Public License, version 3. See the file COPYING for details.


# Load

Once IPSUR is downloaded and installed, it must be loaded into R. Load the package with the library function:

```{r, eval=FALSE}
library(IPSUR)
```

and finally launch your PDF viewer with

```{r, eval=FALSE}
read(IPSUR)
```

