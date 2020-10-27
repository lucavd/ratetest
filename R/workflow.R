
# setup -----------------------------------------------------------

library(devtools)
library(fs)
library(tidyverse)

create_package('~/Documents/GitHub/ratetest')

use_git()


# function --------------------------------------------------------

use_r('rate_test') # create one for every function and put the function in it

load_all()
