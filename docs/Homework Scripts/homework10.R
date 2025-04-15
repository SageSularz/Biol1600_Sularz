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
                      colour = "white",
                      title = "color") +
  scale_fill_manual(name = "Color Code",
                    values = my_cols)+
  coord_equal() +
  theme_void()
p8

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


















