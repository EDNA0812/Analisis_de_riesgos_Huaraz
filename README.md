# Analisis_de_riesgos_Huaraz

El objetivo principal del proyecto se sintetiza en: La representación del riesgo en sus distitas cualidades como resultado de los peligros de carácter hidrometereológico y la vulnerabilidad de la Provincia de Huaraz, mediante mapas temáticos.
 **Pacman** es un paquete R que combina la funcionalidad de las funciones relacionadas con la biblioteca base en funciones con nombres intuitivos. Mediante **pacman::p_load** nos permite instalar varios paquetes en una línea de comando de forma simultánea, agilizando el proceso.

## Integrantes
|NOMBRES Y APELLIDOS                |CÓDIGOS                     |                      
|----------------|-------------------------------|
|Lissette Angelica Diaz Ramírez           |19160022            |
|Wendy Jimena Espinoza Bustos       |19160187            |
|Wilder Jorch Estrella Condezo|  19160173    |
|Maria Emilia Tenorio Borda |19160035 |
|Consepcion Edna Zegarra Tello| 19160041|



# Instalación
`#Para instalar varias librerías/paquetes en una línea de comando:`

`install.packages("pacman", dependencies = T)`

`library(pacman)`

`pacman::p_load(raster, rgdal, rgeos, tidyverse, string, sf)`

# Funciones
- **raster** proporciona funciones para manipular datos ráster:
- **sf** permite acceder a funciones simples:
> **st_read** es para leer características simples de un archivo
 o base de datos, o recuperar nombres de capas y su tipo de geometría.
>**read.csv** es para importar archivos .csv que están separadas con , o ;
y que se vean como dataframes.
- **tidyverse** incluye paquetes que permitirán el análisis de datos:
> **mutate** del paquete "dplyr", permite crear, modificar y eliminar columnas.
- **string**  nos da constructores de tipo base que permiten un mayor control 
sobre la creación de cadenas en R.
- **rgdal** proporciona enlaces a la biblioteca de abstracción de datos 
geoespacial y acceso a las operaciones de proyección / transformación de bibliotecas. Además se utilizan clases definidas en el paquete **sp**.
- **rgeos** Interfaz al motor de geometría: código abierto ('GEOS') 
utilizando la 'API' de C para operaciones de topología en geometrías.

# Elaboración del mapa

`library(pacman)`

- Para leer el shapefile y el csv.

`shp <- st_read("D:/universidad/CICLO 4/PROGRAMACION/LIMITES")`

`tbl <- read.csv("VUL_PREC.csv", sep = ";")`

- Llevando a numérico las columnas que coincidan.

`tbl <- tbl %>%
  mutate(UBIGEO = as.numeric (as.character(UBIGEO)))`
  
`shp <- shp %>%
  mutate(IDDIST = as.numeric (IDDIST))`

- La columna de riesgos se obtiene de la siguiente manera:
> **PRECIPITACION * VULNERABILIDAD = RIESGOS**

Con el comando **mutate** se realiza la multiplicación de columnas

`tbl <- mutate(tbl,"RIESGOS"= PRECIPITAC*VULNERAB)`

- Haciendo el join del shapefile y csv.

`fnl <- inner_join(x = shp, y = tbl, by = c('IDDIST' = 'UBIGEO'))`
    
- Para dar color y características al mapa. 

`ejm<- ggplot(data = fnl)+geom_sf(aes(fill= RIESGOS,colour="PuBu"))+
  scale_fill_viridis_b(option = "magma")+ ggtitle("MAPA DE RIESGOS")+
  theme_bw()`

- Para plotear el mapa de riesgos con las características anteriores.

`plot(ejm,multicore=TRUE,width=5,height=5,scale=200,
     windowsixe=c(1280,720),zoom=0.60,phi=50,sunangle=120,theta=45)`

![Mapa de Riesgos de Desastres en Huaraz ](https://github.com/EDNA0812/Analisis_de_riesgos_Huaraz/blob/master/PLOT.png?raw=true)
