
# Upload data -------------------------------------------------------------

# I have downloaded the data from freedomhouse.org

library(readxl)
freedom <- read_excel("freedom_status.xlsx") 

# Upload packages ---------------------------------------------------------

pacman::p_load(lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, hrbrthemes, scales,ggtext, ggpubr,
               grid, gridtext,hrbrthemes,scales,ggtext, ggpubr, biscale, cowplot,sysfonts, showtext,ggflags,usmap)


# Graph -------------------------------------------------------------------

freedom_graph_2022 <- ggplot() + 
  geom_map(data = world, map = world,
           aes(long, lat, group = group,  map_id = region),
           fill = "#525252", color = "#525252") +
  geom_map(data =freedom_3, map = world,
           aes(fill = Status, map_id = Country),
           color = "#525252", size = 0.15, alpha = .8) +
  scale_fill_manual(values = c(  
    "Not Free" = "#6a71a7",
    "Free" = "#00aa83",
    "Partly Free" = "#e7b80a",
    "No value"= "#525252"
  )) +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "",y = "",
       title = "Freedom in the World - 2022",
       subtitle = "",
       caption = "Source: https://freedomhouse.org/\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
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
    plot.background = element_rect(fill = "#d9e2e7"),
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
    title="",
    title.position = "top",
    label.position = "bottom",
    nrow = 1,
    family = font_labels, 
    color = "black",
    keywidth = 3, keyheight = 0.5))



freedom_graph_2022

