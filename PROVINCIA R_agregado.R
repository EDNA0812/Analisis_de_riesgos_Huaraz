#PARA DESCARGAR VARIAS LIBRERIAS Y PAQUETES
install.packages("pacman")
library(pacman) 
pacman::p_load(raster, rgdal, rgeos, tidyverse, string, sf)

#PARA DIRECCIONAR DONDE SE VA A TRABAJAR
setwd("C:/Users/Wendy/Documents/PROGRAMACIÓN/huaraz")
getwd()

#ESTO PARA LIMPIAR LA MEMORIA
g <- gc(reset=TRUE)
rm(list = ls())
options(scipen=999)

#LEER EL SHAPEFILE Y EL EXCEL(DATAFRAME)
shp <- st_read("limites.shp")
tbl <- read.csv("VUL_PREC.csv", sep = ";")

#PARA VER LOS COMPONENTES QUE TIENEN
str(tbl)
str(shp)

#PARA CREAR LA COLUMNA DE RIESGOS
tbl<-mutate(tbl,"RIESGOS"= PRECIPITAC*VULNERAB)

#LLEVAR A NUMERICO LAS COLUMNAS QUE COINCIDAN
tbl <- tbl %>%
  mutate(UBIGEO = as.numeric (as.character(UBIGEO)))
shp <- shp %>%
  mutate(IDDIST = as.numeric (IDDIST))

#PARA PROBAR SI REALMENTE YA ESTA EN NUMERICO
str(tbl)
str(shp)

#HACIENDO EL JOIN DEL EXCEL (DATAFRAME) Y SHAPE
fnl <- inner_join(x = shp, y = tbl, 
                  by = c('IDDIST' = 'UBIGEO'))

#PARA DAR COLOR Y CARACTERISTICAS AL MAPA
ejm<- ggplot(data = fnl)+geom_sf(aes(fill= RIESGOS,colour="PuBu"))+
  scale_fill_viridis_b(option = "magma")+ ggtitle("MAPA DE RIESGOS")+
  theme_bw()

#PARA PLOTEAR EL MAPA DE RIESGOS CON LAS CARACTERISTICAS ANTERIORES
plot(ejm,multicore=TRUE,width=5,height=5,scale=200,
     windowsixe=c(1280,720),zoom=0.60,phi=50,sunangle=120,theta=45)













