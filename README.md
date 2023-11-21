# ggseg Tissueclass Atlases
This repo contains two 2D ggseg atlases for plotting based on brain tissue type. Both atlases are based on the FreeSurfer aseg atlas segmentations and were created with `aseg_all_atlas.Rmd` based on the example code [here](https://ggseg.github.io/ggsegExtra/articles/createaseg.html).

## aseg_all
`aseg_all_atlas.RDS` contains all of the regions included in FreeSurfer's aseg output, grouped by `tissue_class`.

![aseg_all_plot](https://github.com/BGDlab/ggseg-tissueclass-atlas/assets/90057023/99c3d01d-1d14-4f92-ba2a-53990f766649)

## aseg_cerebrum
`aseg_cerebrum_atlas.RDS` is the same as `aseg_all_atlas.RDS` except that the cerebellum and brainstem have been removed.

![aseg_cerebrum_plot](https://github.com/BGDlab/ggseg-tissueclass-atlas/assets/90057023/d4bf3508-3f39-4683-90f1-e2807f55a329)

## Installation & Use - SECTION UNDER DEVELOPMENT
You must have the [ggsegExtra](https://github.com/ggseg/ggsegExtra) package installed to use these atlases. If the install gives you any issues with the `freesurfer` package dependency, which has been arcived from cran, you can get it as follows:

```
require(devtools)
install_version("freesurfer", version = "1.6.8", repos = "http://cran.us.r-project.org")
```

Once you have the packages installed and loaded, you can fork this repo (or just download the raw atlas .RDS). Load the object into your script and plot!

```
aseg_cerebrum <- readRDS(file="./ggseg_atlas/aseg_cerebrum_atlas.RDS")

#plot data in df
ggplot(df) +
  ggseg::geom_brain(atlas = aseg_cerebrum, 
             aes(fill = my_variable),
             side = c("coronal")) +
  ggtitle("This is my brain plot!")
```
