# Richiamo la libreria raster
library(raster)

#set working directory - impostiamo la cartella lab come ambiente di lavoro
setwd("D:/lab") #Windows

#Importo RasterBrick
im2011 <- brick("p224r63_2011.grd") 
im2011 #Visualizziamo i dati importati

#Effettuo il plot (visualizzazione immagine) dei dati importati
plot(im2011)

#Cambiamo la leggenda dei colori
c1 <- colorRampPalette(c("black", "grey", "light grey")) (100) #Indico il range di colore, il valore finale indica il numero di passaggi
plot(im2011, col = cl) #Effettuo nuovamente il plot specificando il range di colori

#Plote della banda del blu - B1_sre
plot(im2011 $ B1_sre)
#or
plot(im2011[[1]]) #È la stessa cosa

#Cambio il colore del grafico
clbw <- colorRampPalette(c("black", "grey", "light grey")) (100)

#Colore in scala di blue
clbl <- colorRampPalette(c("dark blue", "cyan", "azure")) (100)
plot(im2011 $ B1_sre, col = clbl)

#Esportiamo l'immagine e la salviamo nella cartella lab
pdf("b1_sre.pdf") #La cartella lab settata come workdir sarà la destinazione del file
plot(im2011 $ B1_sre, col = clbl)
#Chiudiamo i grafici
dev.off()

#Esportiamo l'immagine e la salviamo nella cartella lab
png("b1_sre.png") #La cartella lab settata come workdir sarà la destinazione del file
plot(im2011 $ B1_sre, col = clbl)
#Chiudiamo i grafici
dev.off()

#Plot b2 (banda del verde)
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(im2011 $B2_sre, col = clg)

#Multiframe
par(mfrow = c(1, 2))
plot(im2011 $ B1_sre, col = clbl)
plot(im2011 $B2_sre, col = clg)
dev.off()

#Esportiamo il multiframe plot
pdf("multiframe01.pdf")
par(mfrow = c(1, 2))
plot(im2011 $ B1_sre, col = clbl)
plot(im2011 $B2_sre, col = clg)
dev.off()

#Esercizio: Inverti i frame da righe a colonna
pdf("multiframe02.pdf")
par(mfrow = c(2, 1))
plot(im2011 $ B1_sre, col = clbl)
plot(im2011 $B2_sre, col = clg)
dev.off()

#Plottiamo le prime quattro bande
#Esercizio: Inverti i frame da righe a colonna
pdf("multiframe03.pdf")
par(mfrow = c(2, 2))
#Banda blu
plot(im2011 $ B1_sre, col = clbl)
#Banda verde
plot(im2011 $B2_sre, col = clg)
#Banda rossa
clr <- colorRampPalette(c("violet", "red", "pink")) (100)
plot(im2011 $B3_sre, col = clr)
#Banda infrarossa
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(im2011 $B4_sre, col = clir)
#Disattivo il salvataggio dei grafici
dev.off()
