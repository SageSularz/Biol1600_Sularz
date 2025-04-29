## HMK 10
## 04-09-25
## SMS

library(tidyr)
library(ggplot2)
library(dplyr)
library(waffle)
library(treemap)
# data set:
# parts list for lego MOC
lego <- read.csv("rebrickable_parts_moc-dragon.csv")
head(lego)
str(lego)
# Color freq
by_col <- lego %>% group_by(Color) %>%
  mutate(Count = as.integer(n()))%>%
  ungroup()%>%
  mutate(Color=as.factor(Color))

by_col <- by_col$Color
str(by_col)


tabled_data2 <- as.data.frame(table(Color=lego$Color)) # rip aparently this was important

my_cols <- c("#05131D", "#0055BF", "#237841", "#C91A09", "#9BA19D", "#FFFFFF", "#E4CD9E", "#958A73", "#FF800D", "#582A12", "#A0A5A9", "#6C6E68", "#F6D7B3", "#FFF03A", "#352100", "#720E0F")
# plot 1: waffle plot showing piece color dist.

waffle <- ggplot(data=tabled_data2,
  aes(fill = Color, values = Freq)) +
  waffle::geom_waffle(n_rows = 8,
                      size = 0.33,
                      colour = "white") +
  labs(title="color")+
  scale_fill_manual(name = "Color Code",
                    values = my_cols)+
  coord_equal() +
  theme_void()
waffle

# plot 2: tree map showing color dist
treemap(dtf=tabled_data2,
        index="Color",
        vSize="Freq",
        type="index",
        palette= my_cols,
        title = " Frequency of Brick Colors in Lego MOC
        *Numeric values corrispond to Lego color codes"
        #title.legend = "Numeric values corrispond to Lego color codes",
        #position.legend = "right"
)

# plot 3: parallel coordinates plot comparing price of price per piece and amount required
no_na <- na.omit(lego)

PiecePrice <- GGally::ggparcoord(data=no_na,
                         columns = c(3,5), # c(3,5,8,9)
                         groupColumn = 1,
                         title = "Quantity of Part Required Vs. Price per Piece")
p5





# Isolate the top five colors in set
top5 <- tabled_data2 %>%
  arrange(desc(Freq)) %>%
  slice(1:5)

# Assign names to color codes
color_names <- c(
  "0" = "Black",
  "70" = "Reddish Brown",
  "71" = "Light Bluish Gray",
  "72" = "Dark Bluish Gray",
  "308" = "Dark Brown"
)

# Replace code with color name
top5 <- top5 %>%
  mutate(Color = recode(as.character(Color), !!!color_names))

# Assign correct hex codes (from LEGO.com)
my_cols <- c("#05131D", "#582A12", "#A0A5A9", "#6C6E68", "#352100")


lolli_colors <- ggplot(data=top5) +
  aes(x=Color, y=Freq) +
  geom_segment(aes(x=Color,
                   xend=Color, y=0,
                   yend=Freq),
               color=my_cols,
               linewidth=2) +
  geom_point( color=my_cols, size=7) +
  labs(title="Top Colors",
       x="",
       y="Count") +
  coord_flip() +
  theme_light(base_size=20,base_family=
                "Monaco") +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title.position = "plot",
    plot.title = element_text(hjust = 0))
lolli_colors















