#' List the colors in the CSP color palette
#'
#'list_colors() returns a tibble of the CSP color names and their Hex color codes.
#' @import tibble
#' @export
#' @returns a 2 x 14 tibble of the 14 colors in the CSP color palette and their Hex
#' color codes.

##################################################
## List CSP-colors
##################################################
list_colors<-function(){
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
