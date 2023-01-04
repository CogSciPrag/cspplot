#' ggplot2 theme colors for the "Cognitive Science of Pragmatics" Research Group, Department of Linguistics, University of Tübingen, Germany.
#' Chair: Prof. Dr. Michael Franke
#'
#' @import tibble
#' @import ggplot2
#' @import cspplot
#' @export

##################################################
## CSP-colors
##################################################
display_colors<-function(...){
  CSP_colors = c(
    "#7581B3", "#99C2C2", "#C65353", "#E2BA78", "#5C7457", "#575463",
             "#B0B7D4", "#66A3A3", "#DB9494", "#D49735", "#9BB096", "#D4D3D9",
             "#414C76", "#993333"
  )

  CSP_color_names = c("glaucous", "opal", "shimmer", "crayola", "fern", "independence",
                      "glaucous light 2", "opal dark 2", "shimmer light 2", "crayola dark 2", "fern light 3", "independence light 4",
                      "glaucous dark 3", "shimmer dark 2"
  )
  data <- tibble::tibble(
    name = factor(CSP_color_names, levels = CSP_color_names),
    value = 3 + runif(length(name))
    )
  data
  library(ggplot2)

  plot <- ggplot(data, aes(x = name, y = value, fill = name)) +
    geom_col(show.legend = FALSE) +
    theme_csp() +
    coord_flip()

  plot
}

list_colors<-function(...){
  CSP_colors = c(
    "#7581B3", "#99C2C2", "#C65353", "#E2BA78", "#5C7457", "#575463",
             "#B0B7D4", "#66A3A3", "#DB9494", "#D49735", "#9BB096", "#D4D3D9",
             "#414C76", "#993333"
  )

  CSP_color_names = c("glaucous", "opal", "shimmer", "crayola", "fern", "independence",
                      "glaucous light 2", "opal dark 2", "shimmer light 2", "crayola dark 2", "fern light 3", "independence light 4",
                      "glaucous dark 3", "shimmer dark 2"
  )


  print <- tibble::tibble(
    name = factor(CSP_color_names, levels = CSP_color_names),
    hex = CSP_colors
  )
  print
}
