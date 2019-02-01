context("Conversion to/from n-vector")
library(nvctr)

test_that("basic conversion checks: lat, lon to n-vector", {
  expect_equal(
    lat_lon2n_E(0, 0),
    c(1, 0, 0))

  expect_equal(
    lat_lon2n_E(rad(1), rad(2)),
    c(0.99923861, 0.03489418, 0.01745241))

  expect_equal(
    lat_lon2n_E(rad(4), rad(5)),
    c(0.99376802, 0.08694344, 0.06975647))
})


test_that("basic conversion checks: n-vector to lat, lon", {
  expect_equal(
    n_E2lat_lon(c(1, 0, 0)),
    c(0, 0))

  expect_equal(
    n_E2lat_lon(c(0.99923861, 0.03489418, 0.01745241)),
    c(rad(1), rad(2)))

  expect_equal(
    n_E2lat_lon(c(0.99376802, 0.08694344, 0.06975647)),
    c(rad(4), rad(5)))

})


test_that("Find R_EN", {
  n_EA_E <- lat_lon2n_E(rad(1), rad(2))
  result <- matrix(c(
    -1.74417749e-02, -3.48994967e-02, -9.99238615e-01,
    -6.09080201e-04,  9.99390827e-01, -3.48941813e-02,
     9.99847695e-01,  0.00000000e+00, -1.74524064e-02),
    nrow = 3, ncol = 3, byrow = TRUE)

  expect_equal(n_E2R_EN(n_EA_E), result)

})
