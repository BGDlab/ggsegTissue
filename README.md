# ggsegTissue Atlases
This repo contains two 2D ggseg atlases for plotting based on brain tissue type. Both atlases are based on the FreeSurfer aseg atlas segmentations and were created by adapting the example code [here](https://ggseg.github.io/ggsegExtra/articles/createaseg.html).

## aseg_all
`aseg_all` contains all of the regions included in FreeSurfer's aseg output, grouped by `tissue_class`.

![aseg_all_plot](https://github.com/BGDlab/ggseg-tissueclass-atlas/assets/90057023/99c3d01d-1d14-4f92-ba2a-53990f766649)

## aseg_cerebrum
`aseg_cerebrum` is the same as `aseg_all` except that the cerebellum and brainstem have been removed.

![aseg_cerebrum_plot](https://github.com/BGDlab/ggseg-tissueclass-atlas/assets/90057023/d4bf3508-3f39-4683-90f1-e2807f55a329)

## Installation & Use 
You can install the released version of [ggsegTissue](https://github.com/) from GitHub with:

```
# install.packages("remotes")
remotes::install_github("BGDlab/ggsegTissue")
```
To plot your data:

```
library(ggsegTissue)

#make dataframe
df <- data.frame(my_variable = c(1, 3, 7, 4),
                 tissue_class = c("cGM", "CSF", "sGM", "WM"))

#plot
ggplot(df) +
  ggseg::geom_brain(atlas = aseg_cerebrum, 
                    aes(fill = my_variable)) +
  ggtitle("This is my brain plot!")
```

![aseg_cerebrum_sample](https://github.com/BGDlab/ggseg-tissueclass-atlas/assets/90057023/9ef99023-f203-4774-a30f-dab2da5a99db)

