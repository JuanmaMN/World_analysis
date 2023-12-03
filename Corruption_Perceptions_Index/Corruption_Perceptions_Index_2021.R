
# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)

# Code for previous version

# Grap --------------------------------------------------------------------

graph <- ggplot() + 
  geom_map(data = world, map = world,
           aes(long, lat, group = group,  map_id = region),
           fill = "#525252", color = "#525252") +
  geom_map(data =CPI_trends_2012, map = world,
           aes(fill = color, map_id = Country),
           color = "#525252", size = 0.15, alpha = .8) +
  scale_fill_manual(values = c(  
    "< 10" = "#7f0f03",
    "11 - 20" = "#ae151a",
    "21 - 30" = "#df1a22",
    "31 - 40" = "#ef4123",
    "41 - 50" = "#f36c21",
    "51 - 60" = "#f58220",
    "61 - 70" = "#f99d1c",
    "71 - 80" = "#fdb913",
    "81 - 90" = "#ffd400",
    ">90" = "#fff200",
    "No value"= "#c3c3c3"
  ))  +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "",y = "",
       title = "Corruption Perceptions Index",
       subtitle = "Corruption Perceptions Index analysis by Transparency International in 2021",
       caption = "Source: https://www.transparency.org/en/cpi\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
  theme(
    plot.title = element_text(margin = margin(b = 8), 
                              color = "#22222b",face = "bold",size = 14,
                              hjust = 0.5,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10,family = font_labels,
                                 hjust = 0.95),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.title = element_text(size=8, color = "#525252",family = font_labels),
    legend.title.align = 0,
    axis.text.x    = element_blank(),
    axis.text.y    = element_blank(),
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#b9cad4"),
    panel.border = element_blank(),
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    legend.position = "bottom",
    legend.text=element_text(size=8, color = "#525252", family = font_labels),
    legend.key.size = unit(0.2, "cm"),
    legend.key = element_blank(),
    legend.background=element_blank(),
    axis.ticks = element_blank(),
    legend.margin=margin(b = 0.1, unit='cm')
  ) +
  guides(fill = guide_legend(
    title="Highly corrupt                                                                                                                           Very clean",
    title.position = "top",
    label.position = "bottom",
    nrow = 1,
    family = font_labels, 
    color = "black",
    keywidth = 3, keyheight = 0.5))

graph
