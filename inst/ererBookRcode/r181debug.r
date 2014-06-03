# A. Two bugs in a function: x has to be numeric; w is missing
miss <- function(x) {
  y <- x * 2
  lost <- function(y) {z <- y + w; return(z)}
  m <- lost(y)
  return(m + 100)
}
ua <- miss(x = "abc")
ub <- miss(x = 10)

# B. Special tools: need to change source codes
# browser(): unconditional or conditional
miss2 <- function(x) {
  browser(expr = inherits(x, "character"))
  y <- x * 2
  if (inherits(x, "numeric")) browser()
  lost <- function(y) {z <- y + w; return(z)}
  m <- lost(y); return(m + 100)
}
uc <- miss2(x = "abc") # Invoked the 1st conditional browser()
ud <- miss2(x = 10)  # Invoked the 2nd conditional browser()

# C. Special tools: no need to change source codes
# C1. debug(), undebug(), debugonce(), isdebugged()
debug(fun = miss, text = "me"); isdebugged(miss)
ue <- miss(x = "abc")
undebug(miss); isdebugged(miss)

debugonce(miss) 
uf <- miss(x = 10) # can debug(lost) in the middle of single-stepping
isdebugged(miss) 

# C2. trace(), untrace()
trace(what = miss, tracer = browser, at = c(4, 5))
ug <- miss(x = 10)
untrace(miss)

# C3. setBreakpoint(), unrace()
source("c:/aErer/aBookRcode/miss.r")
setBreakpoint(srcfile = "miss.r", line = 3, clear = F)
ug <- miss(x = 10)
untrace(miss)

# C4: Post-morten debugging: traceback()
uf <- miss(x = 10)
traceback()

# C5: Post-morten debugging: debugger()
options(error = dump.frames)
miss(x = 10)
debugger()

# C6: Post-morten debugging: recover
options(error = recover)
miss(x = 10)