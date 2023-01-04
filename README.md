# ggplot themes for the Cognitive Science of Pragmatics (CogSciPrag) Group (Department of Linguistics, University of Tübingen)

R package containing two versions (light and dark) of ggplot themes for the CSP group.

## Usage

To use the themes, first load the package:

    library(cspplot)
  
Once you have created a ggplot2 object, you can then change its theme as follows:

    plot<-ggplot(data_frame, aes (x = x, y = y))
          +geom_point()
      
    plot+theme_csp
    
    plot+theme_csp_dark

