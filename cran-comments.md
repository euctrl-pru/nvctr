## Resubmission
This is a resubmission.
As request by the CRAN maintainer in this version I have:

* I tried to fix a CSS style attribute from
  >  \figure{FILENAME}{options: width="25\%"}
  to
  >  \figure{FILENAME}{options: style="width: 25\%;"}
  as suggested by CRAN mainteiner but
  `devtools::check_win_devel()` still reports this as a NOTE
  and resubmission failed due to getting again a NOTE.
  So I resorted to use pixels.


## Test environments

* local Windows 11 x64 , R version 4.5.0 (2025-04-11 ucrt)
* local macOS Tahoe 26.1, R version 4.5.2 (2025-10-31)


## R CMD check results
There were no ERRORs nor WARNINGs nor NOTEs.


## Downstream dependencies
No problems with these.
