# Mar 20 2025
# Strategic Coding
# SMS

# load libraries ----
library(pracma)
library(pryr)
library(devtools)
library(upscaler)
install_github("ngotelli/upscaler")
help(package="upscaler")

## subheader A ----

## subheader B ----


# Script description
# 2025-03-20
# Sage Mariani Sularz

add_folder()
add_folder(c("specialfolder1", "specialfolder2"))

metadata_template(file="OriginalData/MyData.csv") # embed meta data in your data file

data_table_template(data_frame = NULL, file_name = "Outputs/TableA.csv")

create_padded_labels(n=10, string = "Species", suffix = ".txt")

x <- runif(10) # object to save
saveRDS(object = x,
        file = "DataObjects/x.rds") # save to disk
restored_x <- readRDS(file = "DataObjects/x.rds") # reopen to new name

# Mar 25 ----

y <- rnorm(3)
z <- pi
bundle <- list(x=x, y=y, z=z) # save multiple objects in single list
saveRDS(object=bundle,
        file="DataObjects/bundle.rds")
restored_bundle <- readRDS(file = "DataObjects/bundle.rds")
restored_bundle$y # reference named list items



## Using log files ----

set_up_log()
#generated txt file that tells details about computer you are using
# includes seed to recreate what was done in this program at this time
# includes what libraries are loaded at the time
# if you rerun it will override and update that txt file

set_up_log(user_seed = 100) # dont do think i think

set_up_log()
echo_log_console(TRUE)
l() # plain log entry
l('log message that is echoed to the screen')

echo_log_console(FALSE)
l('log message that is echoed to the screen')

l('load libraries') # use like comment

set_up_log(overwrite_log = FALSE) # 6 digit prefix is day/hour/min file was run

## Using log for loop progress

for (k in 1:100) {
  show_progress_bar(k)
  Sys.sleep(0.075) # slow down enough to see progress bar
}
l('end of loop')


for (k in 1:100) {
  show_progress_bar(k)
  Sys.sleep(0.075)
  if (k==52)print("ghost")
}
l('end of loop')


for (k in 1:1000) {
  show_progress_bar(index=k, counter = 50, dot = 5)
  Sys.sleep(0.075)
  if (k==500)print("ghost")
}
l('end of long loop')

## add timer for long loops (from pracma package)
for (k in 1:10) {
  show_progress_bar(k)
  Sys.sleep(1)
  if (k==52)print("ghost")
}
toc()
l('end of timed loop')
# I think i missed a part of this


library(pryr)
set_up_log(overwrite_log = FALSE)
for (i in 1:100) {
  show_progress_bar()
  l(paste('memory_used=', trunc(mem_used()/10^6),
          "MB;","i=",i,sep = ''))
  z <- runif(n=10^i)
}


## Coding with USer defined functions ----

build_function("fit_regression") # use snake text
# created an R script template for this function

source("Functions/FitRegression.R")
fit_regression()


# Mar 27 ----






