# Analisis_de_riesgos_Huaraz
VISIÓN GENERAL

FUNCIONES
"Pacman" es un paquete R que combina la funcionalidad de las funciones 
relacionadas con la biblioteca base en funciones con nombres intuitivos. 
Mediante "pacman::p_load" nos permite instalar varios paquetes en una línea 
de comando de forma simultánea, agilizando el proceso.

INSTALACIÓN 
# Para instalar desde CRAN
#install.packages("raster", dependencies = T)
library(pacman)
pacman::p_load(raster, rgdal, rgeos, tidyverse, string, sf)

FUNCIONES
"Raster" proporciona funciones para manipular datos ráster:

"sf" permite acceder a funciones simples:
- "st_read" es para leer características simples de un archivo
 o base de datos, o recuperar nombres de capas y su tipo de geometría.
- "read.csv" es para importar archivos .csv que están separadas con , o ;
y que se vean como dataframes.

"tidyverse" incluye paquetes que permitirán el análisis de datos:
- "mutate" del paquete "dplyr", permite crear, modificar y eliminar columnas.

"str" es una función que permite mostrar la estructura de un objeto
 R.
"string"
Estos constructores de tipo base permiten un mayor control 
sobre la creación de cadenas en R.

"rgdal" proporciona enlaces a la biblioteca de abstracción de datos 
'geoespacial' ('GDAL') (> = 1.11.4) y acceso a las operaciones de 
proyección / transformación desde la biblioteca 'PROJ'.
Se utilizan clases definidas en el paquete 'sp' 

"rgeos" Interfaz al motor de geometría: código abierto ('GEOS') 
utilizando la 'API' de C para operaciones de topología en geometrías

#PARA LA ELABORACION  DEL MAPA DE RIESGOS

Primero creamos la columna de riesgos,la es el resultado de la multiplicacion de las columnas
                             PRECIPITACION * VULNERABILIDAD
,para ello usamos la funcion mutate que es obtenida de la libreria "DPLYR".
mutate nos permite añadir nuevas variables o transformar las que ya existen.

##Para unir el shape y el csv.
ahora unimos los datos que tenemos,el shapefile y el csv,para esto usamos 
inner_join que es parte de la libreria "Dplyr",esta funcion nos permite unir
 dos tablas de datos a traves de una columna en comun,osea que tengan una columna igual.

##PARA PLOTEARLO
usamos la funcion select para sacar los datos que vamos a plotear,usamos geom_sf para ver las caracteristicas mas simples como lineas,puntos,etc.
aes: son asignaciones esteticas que se añaden a las variables de nuestros datos.
- scale_fills_viridis nos sirve para poder acceder a la escala de colores 



