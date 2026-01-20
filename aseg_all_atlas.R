#creating new atlas based on aseg to plot global tissue phenotypes
#code based on https://ggseg.github.io/ggsegExtra/articles/createaseg.html

if(!require('pacman')) {
  install.packages('pacman')
}
pacman::p_load(tidyverse, dplyr, sf, freesurfer) #ggseg, ggseg3d

pkgFile <- "rgdal_1.6-7.tar.gz"
download.file(url = "https://cran.r-project.org/src/contrib/Archive/rgdal/rgdal_1.6-7.tar.gz", destfile = pkgFile)
# Install package
install.packages(pkgs=pkgFile, type="source", repos=NULL)

# Delete package tarball
unlink(pkgFile)

# Enable this universe
options(repos = c(
  ggseg = 'https://ggseg.r-universe.dev',
  CRAN = 'https://cloud.r-project.org'))

#trying to install archived freesurfer
require(devtools)
#install_version("freesurfer", version = "1.6.8", repos = "http://cran.us.r-project.org") #install from cran archive if needed
library(freesurfer)

# get ggesgExtra (should also include ggseg, ggseg3d)
# Install some packages
install.packages('ggsegExtra')
library(ggsegExtra)


# install.packages("remotes")
# remotes::install_github("ggseg/ggseg3d", build_vignettes = TRUE)


# make atlas ----
Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1") #point to freesurfer install
aseg_all <- ggsegExtra::make_volumetric_ggseg(subject = "fsaverage5",
                               steps = 1:8,
                               output_dir = "~/Desktop/BGD_Repos/ggseg_atlas",
                               vertex_size_limits = c(10, NA),
                               label_file = file.path("/Applications/freesurfer/7.4.1/subjects/fsaverage5/mri/aseg.mgz"))

aseg_all$data <- filter(aseg_all$data,
                     !grepl("Unknown", label, ignore.case = TRUE)) #drop "unknown" region

#add col for tissue class
aseg_all$data <- aseg_all$data %>%
  mutate(tissue_class = as.factor(case_when(grepl("ventricle", label, ignore.case = TRUE) ~ "CSF",
                                            grepl("choroid", label, ignore.case = TRUE) ~ "CSF",
                                            grepl("cerebellum", label, ignore.case = TRUE) ~ "Cerebellum",
                                            grepl("white", label, ignore.case = TRUE) ~ "WM",
                                            grepl("CSF", label, ignore.case = TRUE) ~ "CSF",
                                            grepl("cerebral", label, ignore.case = TRUE) ~ "cGM",
                                            grepl("stem", label, ignore.case = TRUE) ~ "Brainstem",
                                            TRUE ~ "sGM"))) %>%
  st_make_valid() %>%
  # Apply a small buffer to close tiny gaps
  st_buffer(0.5) %>%  # Adjust this value if needed (0.5 is a starting point)
  group_by(tissue_class, side, hemi) %>%
  summarise(
    geometry = st_union(geometry),
    .groups = 'drop'
  ) %>%
  # Shrink back by the same amount to maintain original size
  st_buffer(-0.5) %>%
  # Clean up any remaining topology issues
  st_make_valid() %>%
  mutate(
    roi = as.character(tissue_class),
    label = as.character(tissue_class),
    region = as.character(tissue_class)
  ) %>%
  select(side, hemi, roi, geometry, label, region, tissue_class)

plot(aseg_all, alpha = .8)

saveRDS(aseg_all, file="aseg_all_atlas.RDS")

ggplot() +
  ggseg::geom_brain(atlas=aseg_all, aes(fill = tissue_class))

#make reduced version that doesn't include cerebellum and brainstem
aseg_cerebrum <- aseg_all
aseg_cerebrum$data <- aseg_cerebrum$data %>%
  dplyr::filter(tissue_class != "Cerebellum" & tissue_class != "Brainstem")

saveRDS(aseg_cerebrum, file="aseg_cerebrum_atlas.RDS")

ggplot() +
  ggseg::geom_brain(atlas=aseg_cerebrum, aes(fill = tissue_class))
