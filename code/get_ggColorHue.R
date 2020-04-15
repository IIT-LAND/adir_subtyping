# get_ggColorHue.R
# 
# Function will spit out color codes for a given n, just like ggplot2. 
# Helpful when you want to manually set colors in plots.
#

get_ggColorHue <- function(n) {
	hues = seq(15, 375, length = n + 1)
	hcl(h = hues, l = 65, c = 100)[1:n]
} # function get_ggColorHue
