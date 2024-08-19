#' ggseg tissue class atlas
#'
#' 2D ggseg atlas for plotting based on brain tissue type. Atlas is based on the FreeSurfer aseg atlas segmentations and was created with data-raw/aseg_all_atlas.Rmd. Atlas parses the brain into brainstem, cerebellum, cortical GM, CSF, subcortical GM, and WM.  
#' Version 1; 16-08-2024.
#'
#' @docType data
#' @name aseg_all
#' @keywords datasets
#' @family ggseg_atlases
#' @references Fischl et al., (2002). Neuron, 33:341-355 (\href{https://www.pubmed.ncbi.nlm.nih.gov/11832223}{PubMed})
#' 
#' \itemize{
#'  \item{aseg_all}{ - aseg brain tissue class atlas}
#'  \item{aseg_cerebrum}{ - aseg brain tissue class atlas without cerebellum or brainstem}
#'}
#'
#' @import ggseg
#' @rdname aseg_all
#' @examples
#' library(ggsegTissue)
#' #make dataframe
#' df <- data.frame(my_variable = c(1, 3, 7, 4),
#'                  tissue_class = c("cGM", "CSF", "sGM", "WM"))
#' 
#' #plot
#' ggplot(df) +
#'   ggseg::geom_brain(atlas = aseg_all, 
#'              aes(fill = my_variable)) +
#'              ggtitle("This is my brain plot!")
"aseg_all"

#' @rdname aseg_all
"aseg_cerebrum"

