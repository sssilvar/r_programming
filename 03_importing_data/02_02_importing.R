# #########################
# Load Data from WEB
# #########################

library(readr)
library(gdata)

# URLs for a CSV and a delimited file
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"
url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/potatoes.txt"
url_xls <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/latitude.xls"

# Load DataFrames
read_csv(url_csv)
read_tsv(url_delim)
read.xls(url_xls)  # WARN: this is gdata

# read_excel() does not support HTTP requests
# So, you have to download the file
local_xlx <- "/tmp/local_latitude.xls"
download.file(url_csv, destfile = local_xlx)
read_csv(local_xlx)