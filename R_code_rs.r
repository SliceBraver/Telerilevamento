# Richiamo la libreria raster
library(raster)

#set working directory - impostiamo la cartella lab come ambiente di lavoro
setwd("C:/lab") #Windows

#Importo RasterBrick
im2011 <- brick("p224r63_2011.grd") 
im2011 #Visualizziamo i dati importati

#Effettuo il plot (visualizzazione immagine) dei dati importati
plot(im2011)

#Cambiamo la leggenda dei colori
c1 <- colorRampPalette(c("black", "grey", "light grey")) (100) #Indico il range di colore, il valore finale indica il numero di passaggi
plot(im2011, col = cl) #Effettuo nuovamente il plot specificando il range di colori
