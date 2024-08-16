library(devtools)

create("/mnt/isilon/bgdlab_processing/Ben/ggsegTissue")

setwd("/mnt/isilon/bgdlab_processing/Ben/ggsegTissue")

# Save aseg_all to data
aseg_all_rds <- "~/Documents/ggseg-tissueclass-atlas/aseg_all_atlas.RDS"
aseg_all <- readRDS(aseg_all_rds)

use_data(aseg_all, overwrite = T)
document()

# Save aseg_all to data
aseg_cerebrum_rds <- "~/Documents/ggseg-tissueclass-atlas/aseg_cerebrum_atlas.RDS"
aseg_cerebrum <- readRDS(aseg_cerebrum_rds)

use_data(aseg_cerebrum, overwrite = T)
document()

# Copy remaining files into data-raw

install("/mnt/isilon/bgdlab_processing/Ben/ggsegTissue")