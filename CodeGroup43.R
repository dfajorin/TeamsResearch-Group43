library(readr)
library(ggplot2)
library(scales)

data <- read_csv("data.csv")
View(data)


ggplot(data, aes(x = Gender, fill = factor(y))) +
  geom_bar(position = "fill") +
  geom_text(
    aes(label = after_stat(percent(count / tapply(count, x, sum)[x], accuracy = 0.1))),
    stat = "count",
    position = position_fill(vjust = 0.5),
    color = "white",
    fontface = "bold"
  ) +
  scale_y_continuous(labels = percent) +
  scale_fill_manual(
    values = c("0" = "#E76F51", "1" = "#2A9D8F"),
    labels = c("0" = "No Intent (0)", "1" = "Entrepreneurial Intent (1)")
  ) +
  labs(
    title = "Entrepreneurial Intent by Gender (India, 2019)",
    x = "Gender",
    y = "Percentage of Students",
    fill = "Entrepreneurial Intent (y)"
  ) +
  theme_minimal()

