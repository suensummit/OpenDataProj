load("Documents//OpenDataProj//sc_tables.RData")
load("Documents//OpenDataProj//hr_tables.RData")

win_pc <- function(RS, RA) {
  perc <- RS^2 / (RS^2 + RA^2) 
  return(perc)
}

first_half_expd_wp <- win_pc(RS = sc_2014_1half$RS, RA = sc_2014_1half$RA)
first_half_real_wp <- sc_2014_1half$WIN / (sc_2014_1half$WIN + sc_2014_1half$TIE + sc_2014_1half$LOSS)

second_half_expd_wp <- win_pc(RS = sc_2014_2half$RS, RA = sc_2014_2half$RA)
second_half_real_wp <- sc_2014_2half$WIN / (sc_2014_2half$WIN + sc_2014_2half$TIE + sc_2014_2half$LOSS)

expd_wp <- win_pc(RS = sc_2014_full$RS, RA = sc_2014_full$RA)
real_wp <- sc_2014_full$WIN / (sc_2014_full$WIN + sc_2014_full$TIE + sc_2014_full$LOSS)

library(ggplot2)
win_prob <- data.frame(expd = c(first_half_expd_wp, second_half_expd_wp, expd_wp), real = c(first_half_real_wp, second_half_real_wp, real_wp), half = c("first half", "first half", "first half", "first half", "second half", "second half", "second half", "second half", "full season", "full season", "full season", "full season"), team = c(sc_2014_1half$TEAM, sc_2014_2half$TEAM, sc_2014_full$TEAM))
levels(win_prob$team) <- levels(sc_2014_full$TEAM)
fig <- ggplot(data = win_prob, aes(x = expd, y = real, color = factor(half)))
fig <- ggplot(data = win_prob, aes(x = expd, y = real, color = factor(team)))
fig + stat_smooth() + geom_point()
fig <- ggplot(data = win_prob, aes(x = team, y = real, fill = factor(half)))
fig + geom_bar(stat = "identity", position="dodge")
ggplot(data = win_prob, aes(x = expd, y = real, color = factor(team)) + geom_freqpoly(aes(group = team)))
