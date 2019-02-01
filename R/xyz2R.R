xyz2R <- function(x, y, z) {
  cz <- cos(z)
  sz <- sin(z)
  cy <- cos(y)
  sy <- sin(y)
  cx <- cos(x)
  sx <- sin(x)

  R_AB <- matrix(
    c(         cy*cz,          -cy*sz,     sy,
      sy*sx*cz+cx*sz, -sy*sx*sz+cx*cz, -cy*sx,
     -sy*cx*cz+sx*sz,  sy*cx*sz+sx*cz, cy*cx
    ),
    nrow = 3, ncol = 3, byrow = TRUE)
  R_AB
}