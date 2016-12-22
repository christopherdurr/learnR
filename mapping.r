library(ggmap)
corvallis <- c(lon = -123.2620, lat = 44.5646)

# Get map at zoom level 5: map_5
map_5 <- get_map(location = corvallis, zoom = 5, scale = 1)

# Plot map at zoom level 5
ggmap(map_5)

# Get map at zoom level 13: corvallis_map
corvallis_map <- get_map(location = corvallis, zoom = 13, scale = 1)

# Plot map at zoom level 13
ggmap(corvallis_map)

# Swap out call to ggplot() with call to ggmap()
ggmap(corvallis_map) +
  geom_point(aes(lon, lat), data = sales)

# Map color to year_built
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color=year_built), data = sales)

# Map size to bedrooms
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, size=bedrooms), data = sales)

# Map color to price / finished_squarefeet
ggmap(corvallis_map) +
  geom_point(aes(lon, lat, color=price/finished_squarefeet), data = sales)


corvallis <- c(lon = -123.2620, lat = 44.5646)

# Add a maptype argument to get a satellite map
corvallis_map_sat <- get_map(corvallis, zoom = 13, 
                             maptype = "satellite")

#get display satellite map
ggmap(corvallis_map_sat) +
  geom_point(aes(lon, lat, color = year_built), data = sales)

# Add source and maptype to get toner map from Stamen Maps
corvallis_map_bw <- get_map(corvallis, zoom = 13, 
                            source = "stamen", 
                            maptype = "toner")

# Edit to display toner map
ggmap(corvallis_map_bw) +
  geom_point(aes(lon, lat, color = year_built), data = sales)
