#' @export

##################################################
## CSP-colors
##################################################
#JS: change (16/02/2023) - moved "#99C2C2" from position 2 to position 5
CSP_colors = c(
  "#7581B3", "#C65353", "#E2BA78","#5C7457", "#99C2C2", "#575463",
           "#B0B7D4", "#66A3A3", "#DB9494", "#D49735", "#9BB096", "#D4D3D9",
           "#414C76", "#993333"
)

csp_pal <- function() {
  scales::manual_pal(CSP_colors)
}
csp_pal_cont <- function() {
  scales::gradient_n_pal(c("#EEEEEE", CSP_colors[2]))
}
csp_pal_diverg <- function() {
  scales::gradient_n_pal(c(CSP_colors[13],"#EEEEEE",CSP_colors[14]))
}
csp_pal_cont_n <- function() {
  scales::gradient_n_pal(CSP_colors[c(13,1,7,12,2,8)])
}
#' @export
scale_color_discrete <- function(...) { discrete_scale("colour", "csp", csp_pal(), ...) }
#' @export
scale_colour_discrete <- function(...) { discrete_scale("colour", "csp", csp_pal(), ...) }
#' @export
scale_fill_discrete <- function(...) { discrete_scale("fill", "csp", csp_pal(), ...) }

#' @export
scale_color_continuous <- function(...) { continuous_scale("colour", "csp", csp_pal_cont(), ...) }
#' @export
scale_colour_continuous <- function(...) { continuous_scale("colour", "csp", csp_pal_cont(), ...) }
#' @export
scale_fill_continuous <- function(...) { continuous_scale("fill", "csp", csp_pal_cont(), ...) }
#scale_fill_continuous <- function(low = 13, high = 12, ...) { continuous_scale("fill", "csp", csp_pal_cont(low = low, high = high), ...) }

#' @export
scale_color_gradient <- function(...) { continuous_scale("colour", "csp", csp_pal_cont(), ...) }
#' @export
scale_colour_gradient <- function(...) { continuous_scale("colour", "csp", csp_pal_cont(), ...) }
#' @export
scale_fill_gradient <- function(...) { continuous_scale("fill", "csp", csp_pal_cont(), ...) }

#' @export
scale_color_gradient2 <- function(...) { continuous_scale("colour", "csp", csp_pal_diverg(), ...) }
#' @export
scale_colour_gradient2 <- function(...) { continuous_scale("colour", "csp", csp_pal_diverg(), ...) }
#' @export
scale_fill_gradient2 <- function(...) { continuous_scale("fill", "csp", csp_pal_diverg(), ...) }

#' @export
scale_color_gradientn <- function(...) { continuous_scale("colour", "csp", csp_pal_cont_n(), ...) }
#' @export
scale_colour_gradientn <- function(...) { continuous_scale("colour", "csp", csp_pal_cont_n(), ...) }
#' @export
scale_fill_gradientn <- function(...) { continuous_scale("fill", "csp", csp_pal_cont_n(), ...) }

#----------------------------------------------------------------
#' light version of the CSP ggplot2 theme
#'
#' Theme for the "Cognitive Science of Pragmatics" Research Group, Department of Linguistics, University of Tübingen, Germany.
#' Based on the Aida theme (https://github.com/michael-franke/aida-package)
#'
#' @param title.size title element size in pts
#' @param text.size text element size in pts
#' @param legend.position either one of "none", "left", "right", "bottom", "top"
#' @param show.axis boolean or "x", "y"; should axis be drawn? Which?
#' @param show.grid boolean; should grid lines be drawn?
#' @param plot.margin margin around entire plot (unit with the sizes of the top, right, bottom, and left margins)
#'
#' @import ggplot2
#' @import scales
#' @returns ggplot theme
#' @export
theme_csp <- function(title.size = 16, text.size = 14, legend.position = "top",
                       show.axis = FALSE, show.grid = TRUE,
                       plot.margin = c(.2, .1, .2, .1)){

  ############# baseline plot style ###########################
  layout <- theme_classic()
  layout <- layout + theme(text = element_text(size = text.size),
                           title = element_text(size = title.size,
                                                face = "bold"),
                           line = element_line(size = .5))

  # axis
  if (inherits(show.axis, "character") | show.axis == FALSE){
    if (inherits(show.axis, "character")){
      show.axis <- tolower(show.axis)
      if (show.axis == "x"){
        layout <- layout + theme(axis.line.y = element_blank())
      }
      if (show.axis == "y"){
        layout <- layout + theme(axis.line.x = element_blank())
      }
    } else {
      layout <- layout + theme(axis.line.x = element_blank(),
                               axis.line.y = element_blank())
    }
  }

  # grid lines
  if (show.grid == TRUE){
    layout <- layout + theme(panel.grid.major = element_line(size = .2,
                                                             color = "#333333",
                                                             linetype = "dotted"))
  }

  # axis titles
  layout <- layout + theme(axis.title.x = element_text(margin = margin(t = 8)))

  # axis labels
  layout <- layout + theme(axis.text = element_text(face = "plain"))

  # subtitle
  layout <- layout + theme(plot.subtitle = element_text(face = "plain",
                                                        color = "#4d4d4d"))

  # legend
  layout <- layout + theme(legend.position = legend.position,
                           legend.background = element_blank(),
                           legend.key.height = unit(2, "line"))

  # facets
  layout <- layout + theme(strip.background = element_blank(),
                           strip.text = element_text(size = title.size,
                                                     face = "bold"))


  # misc
  layout <- layout + theme(panel.background = element_rect(fill = "white"),
                           plot.background = element_rect(fill = "white"),
                           plot.margin = unit(plot.margin, "cm"))

  layout
}

