library(raster)

install.packages("RStoolbox") #Installo il pacchetto RStoolbox
library(RStoolbox) #Lo carico

setwd("D:/lab/") #Setto la working directory

#Importiamo il primo file - name -> l1992
l1992 <- brick("defor1_.jpg") 
l1992

plotRGB(l1992, r=1, g=2, b=3, stretch="lin") #Il NIR è la 1, in quanto la vegetazione è diventata rossa (veg che riflette l'infrarosso).
#Suddivisione bande:
# layer 1: NIR
# layer 2: Red
# layer 3: Green

l2006 <- brick("defor2_.jpg")
l2006
plotRGB(l2006, r=1, g=2, b=3, stretch="lin") #suddivisione layer uguale alla prima immagine

#Calcolo DVI Difference Vegetation Index
par(mfrow=c(2,1)) #Creo il multiframe delle due immagini
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

dvi1992 = l1992[[1]] - l1992[[2]] #Per calcolare il DVI facciamo il layer 1 dell'immagine (NIR) - il layer 2 (RED)
dvi1992 = l1992$defor1_.1 - l1992$defor1_.2 #Altro modo per effettuare il calcolo del DVI, ovvero tramite nome dei layer.
dvi1992

cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black'))(100) #creiamo una color ramp palette specifica
par(mfrow=c(2,1)) #Creo il multiframe delle due immagini
plot(dvi1992, col = cl) #Tutto ciò che è rosso è in salute

dvi2006 = l2006[[1]] - l2006[[2]] #Per calcolare il DVI facciamo il layer 1 dell'immagine (NIR) - il layer 2 (RED)
dvi2006

plot(dvi2006, col = cl) #Tutto ciò che è rosso è in salute, notare che il rosso è diminuito

#DVI differenza nel tempo
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue', 'white', 'red'))(100) #Cambio la palette dei colori
dev.off() #Chiudo il plot precedente
plot(dvi_dif, col = cld) #Effettuo il plot della differenza


