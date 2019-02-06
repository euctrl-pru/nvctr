n_EA_E_and_n_EB_E2p_AB_E <- function(n_EA_E, n_EB_E, z_EA = 0, z_EB = 0,
  a = 6378137, f = 1.0 / 298.257223563) {
  p_EA_E <- n_EB_E2p_EB_E(n_EA_E, z_EA, a, f)
  p_EB_E <- n_EB_E2p_EB_E(n_EB_E, z_EB, a, f)
  p_AB_E <-  p_EB_E - p_EA_E
  p_AB_E
}