library(readxl)
library(plyr)
library(tidyverse)
library(dplyr)
library(magrittr)

p = "data/input/policydetails2.xlsx"
sheets = excel_sheets(p)

xl_list <- lapply(excel_sheets(p), read_excel, path = p)
names(xl_list) <- sheets

str(xl_list$FG)
motorBookings <- rbind.fill(xl_list)


cleanNames = "data/input/cleaned_makeName.xlsx"
sheets = excel_sheets(cleanNames)
dfNames <- read_excel(cleanNames, "cleanNames")

