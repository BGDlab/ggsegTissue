# ggsegTissue Atlases
This repo contains two 2D ggseg atlases for plotting based on brain tissue type. Both atlases are based on the FreeSurfer aseg atlas segmentations and were created by adapting the example code [here](https://ggseg.github.io/ggsegExtra/articles/createaseg.html).

## aseg_all
`aseg_all` contains all of the regions included in FreeSurfer's aseg output, grouped by `tissue_class`.
<img width="1166" height="1132" alt="aseg_all" src="https://github.com/user-attachments/assets/affa844e-b223-49e1-83dc-377533f93af9" />

## aseg_cerebrum
`aseg_cerebrum` is the same as `aseg_all` except that the cerebellum and brainstem have been removed.
<img width="1166" height="1132" alt="aseg_cerebrum" src="https://github.com/user-attachments/assets/a5815370-0273-4078-8409-265b500a61a5" />

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
<img width="1166" height="1132" alt="myplot" src="https://github.com/user-attachments/assets/1c0b30bb-6232-4457-b161-040759ca4b48" />
