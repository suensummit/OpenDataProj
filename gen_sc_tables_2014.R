sc_2014_1half <- data.frame(TEAM = c("Lamigo", "統一7-ELEVEn", "義大", "中信兄弟"),
                            GP = c(60, 60, 60, 60),
                            WIN = c(39, 32, 26, 19),
                            TIE = c(2, 4, 1, 1),
                            LOSS = c(19, 24, 33, 40),
                            RS = c(284, 266, 268, 211),
                            RA = c(226, 272, 267, 264))

sc_2014_2half <- data.frame(TEAM = c("Lamigo", "統一7-ELEVEn", "義大", "中信兄弟"), 
                        GP = c(60, 60, 60, 60), 
                        WIN = c(27, 26, 32, 31), 
                        TIE = c(1, 3, 1, 3), 
                        LOSS = c(32, 31, 27, 26),
                        RS = c(238, 254, 297, 265),
                        RA = c(296, 265, 266, 227))

sc_2014_full <- data.frame(TEAM = c("Lamigo", "統一7-ELEVEn", "義大", "中信兄弟"), 
                        GP = c(120, 120, 120, 120), 
                        WIN = c(66, 58, 58, 50), 
                        TIE = c(3, 7, 2, 4), 
                        LOSS = c(51, 55, 60, 66),
                        RS = c(522, 520, 565, 476),
                        RA = c(522, 537, 533, 491))

save("sc_2014_1half", "sc_2014_2half", "sc_2014_full", file = "Documents//OpenDataProj//sc_tables.RData")
