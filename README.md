
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nvctr <img src="man/figures/logo.svg" align="right" height="139" />

[![Travis build
status](https://travis-ci.org/euctrl-pru/nvctr.svg?branch=master)](https://travis-ci.org/euctrl-pru/nvctr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/euctrl-pru/nvctr?branch=master&svg=true)](https://ci.appveyor.com/project/euctrl-pru/nvctr)
[![Coverage
Status](https://codecov.io/gh/euctrl-pru/nvctr/branch/master/graph/badge.svg)](https://codecov.io/gh/euctrl-pru/nvctr)
[![CRAN
version](http://www.r-pkg.org/badges/version/nvctr)](https://cran.r-project.org/package=nvctr)

## Overview

The `nvctr` package implements the n-vector approach to geographical
position calculations using an ellipsoidal model of Earth as described
in (Gade [2010](#ref-gade_2010)).

Implementations in various computer languages can be found at the
[n-vector page](https://www.navlab.net/nvector/) (Navigation Group
[2010](#ref-navigationgroupatffi_2010)).

## Installation

You can install the development version of `nvctr` from
[GitHub](https://github.com/euctrl-pru/nvctr) with:

``` r
devtools::install_github("euctrl-pru/nvctr")
```

or the CRAN version (when this package will land to CRAN):

``` r
install.packages("nvctr")
```

## Usage

`nvctr` can be used to solve geographical position calculation like
(example numbers refer to the ones in the
[vignette](http://ansperformance.eu/nvctr/articles/position-calculations.html "nvctr vignette")):

  - Calculate the surface distance between two geographical positions
    ([Example
    5](http://ansperformance.eu/nvctr/articles/position-calculations.html#example-05 "Example 5: Surface distance")).
  - Find the destination point given start point, azimuth/bearing and
    distance ([Example
    8](http://ansperformance.eu/nvctr/articles/position-calculations.html#example-8-a-and-azimuthdistance-to-b "Example 8: A and azimuth/distance to B")).
  - Find the mean position (center/midpoint) of several geographical
    positions ([Example
    6](http://ansperformance.eu/nvctr/articles/position-calculations.html#example-6-interpolated-position "Example 6: Interpolated position")).
  - Find the intersection between two paths ([Example
    9](http://ansperformance.eu/nvctr/articles/position-calculations.html#example-9-intersection-of-two-paths "Example 9: Intersection of two paths")).
  - Find the cross track distance between a path and a position
    ([Example
    10](http://ansperformance.eu/nvctr/articles/position-calculations.html#example-10-cross-track-distance-cross-track-error "Example 10: Cross track distance (cross track error)")).

## References

<div id="refs" class="references">

<div id="ref-gade_2010">

Gade, Kenneth. 2010. “A Non-Singular Horizontal Position
Representation.” *Journal of Navigation*.
<https://doi.org/10.1017/S0373463309990415>.

</div>

<div id="ref-navigationgroupatffi_2010">

Navigation Group, FFI. 2010. “The N-Vector Page.”
<https://www.navlab.net/nvector/>.

</div>

</div>
