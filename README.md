# ggplot themes for the Cognitive Science of Pragmatics (CogSciPrag) Group (Department of Linguistics, University of Tübingen)

R package containing two versions of ggplot themes (light and dark) for the CSP group.

## Usage

The package should be imported after ggplot2, as it overwrites its default color scales:

	library(ggplot2)
    library(cspplot)
  
### Default use for discrete and continuous scales 
Apply the theme after creating the ggplot object:

	discrete_plot<-ggplot(data.frame(x=c("x1","x2"), y=c(1:2), aes (x = x, y = y))
          +geom_point()
      
    discrete_plot+theme_csp  *(light theme)*
    discrete_plot+theme_csp_dark *(dark theme)*


For continuous data, the theme offers a range of gradient options, in line with default ggplot options for continuous scales:

	- Default: *scale_fill_continuous() / scale_colo(u)r_continuous() / scale_fill_gradient() / scale_colo(u)r_gradient()* 
		- Gradient from a lighter ("independence light 4") to a darker ("glaucous dark 3") blue-grey shade of the palette
	- Diverging gradient: *scale_fill_gradient2() / scale_colo(u)r_gradient2()*
		- Gradient from a blue-ish ("glaucous dark 2") to a red-ish ("shimmer dark 2") shade of the palette
	- n-numbered gradient: *scale_fill_gradientn() / scale_colo(u)r_gradientn()*
		- Gradient using up to 6 shades of the palette, depending on the amount of categories on the x- or y-axis

### Manually selecting colors from the palette

The package contains two convenience functions for manual color selection:

	- *display_colors()*: Returns a plot that shows all colors in the palette together with their name and Hex color code
	- *list_colors()*: Returns a tibble of the color names and Hex color codes. The latter can be supplied as values for manual color selections
	
**Example**:

	palette<-list_colors()[,"hex", drop = TRUE]

	plot_bars<-ggplot(data.frame(x=c("x1","x2"), y=c(1:2), aes (x = x, y = y))+
	  theme_csp()+
	  geom_bar(stat ="identity", width=0.8)+
	  labs(x = "x", y = "y", title = "")+
	  scale_y_continuous(limits=c(0,2),breaks=c(0,1,2))+
	  scale_fill_manual(values = c(palette[11,14]))+
	  theme(legend.position = "none")


### Further examples

Exemplary uses of the theme can be found in the "doc" folder of the package.