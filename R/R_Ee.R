R_Ee <- function(axes = "e") {
  stopifnot(axes == "e" || axes == "E")
  if (axes == "e")
    matrix(
      c( 0, 0, 1,
         0, 1, 0,
        -1, 0, 0),
      nrow = 3, ncol = 3, byrow = TRUE)
  else
    matrix(
      c(1, 0, 0,
        0, 1, 0,
        0, 0, 1),
      nrow = 3, ncol = 3, byrow = TRUE)

}
