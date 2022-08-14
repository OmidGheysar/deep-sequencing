

mode(colours())
length(colours())
head(colours())
grep("red", colours())
# [1] 100 372 373 374 375 376 476 503 504 505 506 507 524 525 526
# [16] 527 528 552 553 554 555 556 641 642 643 644 645
colours()[525:528]
# [1] "palevioletred1" "palevioletred2" "palevioletred3"
# [4] "palevioletred4"
grep("red", colours(),value = T)


my_list <- list(l1=c(1,7,3,5),
                l2=c(5,3,9),
                l3=c(9,9,22,5,17,83,105))

my_list

unlist(my_list)

unlist(my_list, use.names = FALSE)

x <- "aaaaaBBBaaaaaaaaaaaBaaaaBaaaakjdsnfjlksdf"
x

gregexpr("B",x)

unlist(gregexpr("B",x))

which(strsplit(x,"")[[1]]=="B")

vec <- c("AAA", "Hello","1234", "X")

"AAA" %in% vec
"A" %in% vec
is.element("AAA",vec)
is.element("134",vec)
is.element("Hello",vec)

seq(5)
seq(5,10)
seq(5,10,.1)

x <- c(12,24,19)
any(x<20)
all(x<20)

# check for github purpose forv












