#' Display the CSP color palette
#'
#'display_colors() produces a par plot showing the full color palette of the cspplot
#'package together with color names
#' @import tibble
#' @import ggplot2
#' @export
#' @returns A ggplot2 object

##################################################
## Display CSP colors
##################################################
display_colors<-function(...){
  CSP_colors = c(
    "#7581B3", "#C65353", "#E2BA78", "#5C7457", "#99C2C2", "#575463",
             "#B0B7D4", "#66A3A3", "#DB9494", "#D49735", "#9BB096", "#D4D3D9",
             "#414C76", "#993333"
  )

  CSP_color_names = c("glaucous, #7581B3", "shimmer, #C65353", "crayola, #E2BA78", "fern, #5C7457", "opal, #99C2C2", "independence, #575463",
                      "glaucous light 2, #B0B7D4", "opal dark 2, #66A3A3", "shimmer light 2, #DB9494", "crayola dark 2, #D49735", "fern light 3, #9BB096", "independence light 4, #D4D3D9",
                      "glaucous dark 3, #414C76", "shimmer dark 2, #993333"
  )
  data <- tibble::tibble(
    name = factor(CSP_color_names, levels = CSP_color_names),
    value = 3 + runif(length(name))
    )
  data
  library(ggplot2)

  plot <- ggplot(data, aes(x = name, y = value, fill = name)) +
    geom_col(show.legend = FALSE) +
    theme_classic() +
    scale_fill_manual(values=CSP_colors)+
    coord_flip()

  plot
}
