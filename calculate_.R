load("Documents//OpenDataProj//sc_tables.RData")
load("Documents//OpenDataProj//hr_tables.RData")

win_pc <- function(RS, RA) {
  perc <- RS^2 / (RS^2 + RA^2) 
  return(perc)
}

first_half_expd_wp <- win_pc(RS = sc_2014_1half$RS, RA = sc_2014_1half$RA)
first_half_real_wp <- sc_2014_1half$WIN / (sc_2014_1half$WIN + sc_2014_1half$TIE + sc_2014_1half$LOSS)
