# A. Multiple pages on a single screen device 
# A1. Pause for multiple pages
windows(); bringToTop(stay = T)
devAskNewPage(ask = TRUE); plot(1:3, col = 'red')
devAskNewPage(ask = TRUE); plot(5:7, col = 'black')

# A2. Save and replay on a screen
windows(); bringToTop(stay = T)
plot(1:10, col = 'red'); aa <- recordPlot() 
plot(20:30, col = 'black'); bb <- recordPlot()
replayPlot(aa); replayPlot(bb)
replayPlot(bb); replayPlot(aa)

# A3. Replay/save as a file
setwd("C:/aErer/aBookRcode")
pdf(file = "test3.pdf") # save two graphs on a single pdf file
replayPlot(aa); replayPlot(bb)
dev.off()

# A4. Manually recording and replaying
windows(); bringToTop(stay = T) 
# use mouse on the window: History > Recording
plot(1:10, col = 'red')
plot(rnorm(30), col = 'black')
# use mouse on the window: History > PageUp, PageDown

# B. Multiple pages on multiple screen devices for comparison
# B1. Initiate multiple windows mannually
windows(); bringToTop(stay = T); plot(1:3, col = 'red')
windows(); bringToTop(stay = T); plot(5:7, col = 'purple')
windows(); bringToTop(stay = T); plot(7:9, col = 'green')

# B2. Initiate multiple windows by loop
data <- list(da = 1:3, db = 5:7, dc = 7:9)
color <- c('red', 'purple', 'green')
for (i in 1:3) {
  windows(); plot(data[[i]], col = color[i])
}

# C. Saving multiple pages as a single file
pdf(file = "mpage.pdf", onefile = TRUE) # 3 graphs in 1 file
plot(rnorm(500)); plot(1:100); plot(3:20)
dev.off()

# D. Saving multiple pages as multiple files
pdf(file = "mpage%01d.pdf", onefile = FALSE) # 3 graphs in 3 files
plot(rnorm(500)); plot(1:100); plot(3:20)
dev.off()

png(file = "npage.png") # 1 file for the last graph
plot(rnorm(500)); plot(1:100); plot(3:20)
dev.off()

png(file = "npage%01d.png") # 3 graphs in 3 files
plot(rnorm(500)); plot(1:100); plot(3:20)
dev.off()

# using a loop statement
dnor <- list(da = rnorm(30), db = rnorm(300), dc = rnorm(1000))
color <- c('red', 'purple', 'green')
for (i in 1:3) {
  png(file = paste("gpage", i, ".png", sep = ""))  
  plot(dnor[[i]], col = color[i])
  dev.off()  
}  