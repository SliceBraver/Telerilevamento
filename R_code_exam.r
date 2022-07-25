#R_code_exam.r

#If you do not have the required packages uncomment the code below:
#install.packages("raster")
#install.packages("RSToolbox")
#install.packages(ggplot2)
#install.packages("patchwork")
#install.packages("viridis")

#======================================
# Importing libraries/packages section
#======================================
#Importing raster
library(raster)
#Importing RSToolbox
library(RStoolbox)
#Importing ggplot2
library(ggplot2)
#Importing Patchwork
library(patchwork)
#Importing viridis
library(viridis)
#======================================
#Importing region ends
#======================================

#Setting working directory
setwd("D:/lab/Exam")

#============================================
#Importing and calculating DVI for 2022 Data
#============================================
#Importing RGB image - Bands: R=1, G=2, B=3
sen_sicily_2022 <- brick("SicilyRGB_20220721.jp2") #21/07/2022
sen_sicily_2022
#Importing NIR Band Image
sen_sicily_nir_2022 <- brick("SicilyNir_20220721_B08.jp2")
#Assigning red band to a variable
sen_sicily_2022_red <- sen_sicily_2022$SicilyRGB_20220721.1

#Calculating DVI for 2022 data (NIR - RED)
dvi2022 <- sen_sicily_nir_2022 - sen_sicily_2022_red

#Creating a standard color palette for DVI (and eventually NDVI)
cld_dvi <- colorRampPalette(c('blue', 'white', 'red'))(100)
#Plotting DVI using previous colorRampPalette
plot(dvi2022, col = cld_dvi)
#Saving PDF of the previous image (Creating file -> Insert plot -> Close file)
pdf("dvi2022.pdf")
plot(dvi2022, col = cld_dvi)
dev.off()
#=============================================
#End Import and DVI for 2022 Data
#=============================================

#============================================
#Importing and calculating DVI for 2021 Data
#============================================
#Importing RGB image - Bands: R=1, G=2, B=3
sen_sicily_2021 <- brick("SicilyRGB_20210721.jp2") #21/07/2021
#Importing NIR Band Image
sen_sicily_nir_2021 <- brick("SicilyNir_20210721_B08.jp2")
#Assigning green band to a variable
sen_sicily_2021_red <- sen_sicily_2021$SicilyRGB_20210721.1

#Calculating DVI for 2022 data (NIR - RED)
dvi2021 <- sen_sicily_nir_2021 - sen_sicily_2021_red
#Plotting DVI using previous colorRampPalette
plot(dvi2021, col = cld_dvi)
#Saving PDF of the previous image (Creating file -> Insert plot -> Close file)
pdf("dvi2021.pdf")
plot(dvi2021, col = cld_dvi)
dev.off()
#=============================================
#End Import and DVI for 2021 Data
#=============================================

#============================================
#Importing and calculating DVI for 2020 Data
#============================================
#Importing RGB image - Bands: R=1, G=2, B=3
sen_sicily_2020 <- brick("SicilyRGB_20200731.jp2") #31/07/2020
#Importing NIR Band Image
sen_sicily_nir_2020 <- brick("SicilyNir_20200731_B08.jp2")
#Assigning green band to a variable
sen_sicily_2020_red <- sen_sicily_2020$SicilyRGB_20200731.1

#Calculating DVI for 2020 data (NIR - RED)
dvi2020 <- sen_sicily_nir_2020 - sen_sicily_2020_red
#Plotting NDVI using previous colorRampPalette
plot(dvi2020, col = cld_dvi)
#Saving PDF of the previous image (Creating file -> Insert plot -> Close file)
pdf("dvi2020.pdf")
plot(dvi2020, col = cld_dvi)
dev.off()
#=============================================
#End Import and DVI for 2020 Data
#=============================================

#============================================
#Importing and calculating DVI for 2019 Data
#============================================
#Importing RGB image - Bands: R=1, G=2, B=3
sen_sicily_2019 <- brick("SicilyRGB_20190727.jp2") #27/07/2019
plotRGB(sen_sicily_2019, 1, 2, 3, stretch="lin")
#Importing NIR Band Image
sen_sicily_nir_2019 <- brick("SicilyNir_20190727_B08.jp2")
#Assigning green band to a variable
sen_sicily_2019_red <- sen_sicily_2019$SicilyRGB_20190727.1

#Calculating DVI for 2019 data (NIR - RED)
dvi2019 <- sen_sicily_nir_2019 - sen_sicily_2019_red
#Plotting NDVI using previous colorRampPalette
plot(dvi2019, col = cld_dvi)
#Saving PDF of the previous image (Creating file -> Insert plot -> Close file)
pdf("dvi2019.pdf")
plot(dvi2019, col = cld_dvi)
dev.off()
#=============================================
#End Import and DVI for 2019 Data
#=============================================

#=============================================
#Calculating DVI Differences
#=============================================
#Calculating DVI difference between 2022 and 2021
dvi2022_2021 <- dvi2022 - dvi2021
#Calculating DVI difference between 2021 and 2020
dvi2021_2020 <- dvi2021 - dvi2020
#Calculating DVI difference between 2020 and 2019
dvi2020_2019 <- dvi2020 - dvi2019
#Calculating DVI difference between 2022 and 2019
dvi2022_2019 <- dvi2022 - dvi2019

#Creating plot of the first DVI difference using ggplot and viridis
dvidif2022_2021 <- ggplot() + geom_raster(dvi2022_2021, mapping=aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option="viridis") + ggtitle("DVI difference 2022-2021")
#Creating plot of the second DVI difference using ggplot and viridis
dvidif2021_2020 <- ggplot() + geom_raster(dvi2021_2020, mapping=aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option="viridis") + ggtitle("DVI difference 2021-2020")
#Creating plot of the third DVI difference using ggplot and viridis
dvidif2020_2019 <- ggplot() + geom_raster(dvi2020_2019, mapping=aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option="viridis") + ggtitle("DVI difference 2020-2019")
#Creating plot of the fourth DVI difference using ggplot and viridis
dvidif2022_2019 <- ggplot() + geom_raster(dvi2022_2019, mapping=aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option="viridis") + ggtitle("DVI difference 2022-2019")

#Creating a simple multiframe of dvi differences with ggplot
(dvidif2022_2021 + dvidif2021_2020) / (dvidif2020_2019 + dvidif2022_2019)

#=============================================
#Calculating forest pixel percentage for 2022
#=============================================
#Adding 2022 nir at the associated rgb image
sen_sicily_2022$SicilyRGB_20220721.4 <- sen_sicily_nir_2022
#plotting image with R=NIR, G=Red, B=Green, showing forest cover
plotRGB(sen_sicily_2022, 4, 1, 2, stretch = "lin")
#Saving JPEG of the previous image (Creating file -> Insert plot -> Close file)
jpeg("fcover2022.jpg")
plotRGB(sen_sicily_2022, 4, 1, 2, stretch = "lin")
dev.off()
#Importing the previous image
fcover2022 <- brick("fcover2022.jpg")
#classificating 2022 image in three classes
s2022c <- unsuperClass(fcover2022, nClasses=3)
#Showing image with color associated with classes (color are subjected to changes)
plot(s2022c$map)
#Sea = class 1 (Sea is showed in white)
#Other areas = class 2 (these are showed in yellow)
#Forest = class 3 (Forest are showed in green)

#Calculating pixel frequency for classes
freq(s2022c$map)
#Result - class 1: 176936px - class 2: 21493px - class 3: 31971px
#Assigning total number of pixel to a variable
totpx2022 <- 230400
#Calculating the percentage of forests
sicily_forest_2022 <- 31971/totpx2022
#Showing variable value
sicily_forest_2022
#0,1387 -> 13,87% of pixels are forests
#=============================================
#End calculating forest pixels for 2022
#=============================================

#=============================================
#Calculating forest pixel percentage for 2021
#=============================================
#Adding 2021 nir at the associated rgb image
sen_sicily_2021$SicilyRGB_20210721.4 <- sen_sicily_nir_2021
#plotting image with R=NIR, G=Red, B=Green, showing forest cover
plotRGB(sen_sicily_2021, 4, 1, 2, stretch = "lin")
#Saving JPEG of the previous image (Creating file -> Insert plot -> Close file)
jpeg("fcover2021.jpg")
plotRGB(sen_sicily_2021, 4, 1, 2, stretch = "lin")
dev.off()
#Importing the previous image
fcover2021 <- brick("fcover2021.jpg")
#classificating 2022 image in three classes
s2021c <- unsuperClass(fcover2021, nClasses=3)
#Showing image with color associated with classes (color are subjected to changes)
plot(s2021c$map)
#Sea = class 1 (Sea is showed in white)
#Other areas = class 2 (these are showed in yellow)
#Forest = class 3 (Forest are showed in green)

#Calculating pixel frequency for classes
freq(s2021c$map)
#Result - class 1: 179984px - class 2: 10228px - class 3: 40188px
#Assigning total number of pixel to a variable
totpx2021 <- 230400
#Calculating the percentage of forests
sicily_forest_2021 <- 40188/totpx2021
#Showing variable value
sicily_forest_2021
#0,1744 -> 17,44% of pixels are forests
#=============================================
#End calculating forest pixels for 2021
#=============================================

#=============================================
#Calculating forest pixel percentage for 2020
#=============================================
#Adding 2020 nir at the associated rgb image
sen_sicily_2020$SicilyRGB_20200731.4 <- sen_sicily_nir_2020
#plotting image with R=NIR, G=Red, B=Green, showing forest cover
plotRGB(sen_sicily_2020, 4, 1, 2, stretch = "lin")
#Saving JPEG of the previous image (Creating file -> Insert plot -> Close file)
jpeg("fcover2020.jpg")
plotRGB(sen_sicily_2020, 4, 1, 2, stretch = "lin")
dev.off()
#Importing the previous image
fcover2020 <- brick("fcover2020.jpg")
#classificating 2019 image in three classes
s2020c <- unsuperClass(fcover2020, nClasses=3)
#Showing image with color associated with classes (color are subjected to changes)
plot(s2020c$map)
#Sea = class 1 (Sea is showed in white)
#Other areas = class 2 (these are showed in yellow)
#Forest = class 3 (Forest are showed in green)

#Calculating pixel frequency for classes
freq(s2020c$map)
#Result - class 1: 178491px - class 2: 21007px - class 3: 30902px
#Assigning total number of pixel to a variable
totpx2020 <- 230400
#Calculating the percentage of forests
sicily_forest_2020 <- 30902/totpx2020
#Showing variable value
sicily_forest_2020
#0,1341 -> 13,41% of pixels are forests
#=============================================
#End calculating forest pixels for 2020
#=============================================

#=============================================
#Calculating forest pixel percentage for 2019
#=============================================
#Adding 2019 nir at the associated rgb image
sen_sicily_2019$SicilyRGB_20190727.4 <- sen_sicily_nir_2019
#plotting image with R=NIR, G=Red, B=Green, showing forest cover
plotRGB(sen_sicily_2019, 4, 1, 2, stretch = "lin")
#Saving JPEG of the previous image (Creating file -> Insert plot -> Close file)
jpeg("fcover2019.jpg")
plotRGB(sen_sicily_2019, 4, 1, 2, stretch = "lin")
dev.off()
#Importing the previous image
fcover2019 <- brick("fcover2019.jpg")
#classificating 2019 image in three classes
s2019c <- unsuperClass(fcover2019, nClasses=3)
#Showing image with color associated with classes (color are subjected to changes)
plot(s2019c$map)
#Sea = class 1 (Sea is showed in white)
#Other areas = class 2 (these are showed in yellow)
#Forest = class 3 (Forest are showed in green)

#Calculating pixel frequency for classes
freq(s2019c$map)
#Result - class 1: 178438px - class 2: 21479px - class 3: 29483px
#Assigning total number of pixel to a variable
totpx2019 <- 230400
#Calculating the percentage of forests
sicily_forest_2019 <- 29483/totpx2020
#Showing variable value
sicily_forest_2019
#0,1280 -> 12,80% of pixels are forests
#=============================================
#End calculating forest pixels for 2019
#=============================================
