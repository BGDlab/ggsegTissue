library(devtools)

create("/mnt/isilon/bgdlab_processing/Ben/ggsegTissue")

setwd("/mnt/isilon/bgdlab_processing/Ben/ggsegTissue")

# Save aseg_all to data
aseg_all_rds <- "~/Documents/ggseg-tissueclass-atlas/aseg_all_atlas.RDS"
aseg_all <- readRDS(aseg_all_rds)

use_data(aseg_all, overwrite = T)

# Save aseg_cerebrum to data
aseg_cerebrum_rds <- "~/Documents/ggseg-tissueclass-atlas/aseg_cerebrum_atlas.RDS"
aseg_cerebrum <- readRDS(aseg_cerebrum_rds)

use_data(aseg_cerebrum, overwrite = T)

document()

install()

# Test
library(ggsegTissue)
help(aseg_all)

#make dataframe
df <- data.frame(my_variable = c(1, 3, 7, 4),
                 tissue_class = c("cGM", "CSF", "sGM", "WM"))

#plot
ggplot(df) +
  ggseg::geom_brain(atlas = aseg_cerebrum, 
                    aes(fill = my_variable)) +
  ggtitle("This is my brain plot!")
