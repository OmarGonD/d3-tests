library(tools)
library(xml2)


setwd("D:\\D3\\data\\Boletas")

#page<-read_xml('<?xml version="1.0" encoding="UTF-8"?>
#               <car id="id1">
#               <point time="1272686841" lon="-122.40648" lat="37.79778" status="E" unit="id1"/>
#               <point time="1272686781" lon="-122.40544" lat="37.79714" status="M" unit="id1"/>
#               <point time="1272686722" lon="-122.40714" lat="37.79774" status="M" unit="id1"/>
#               <point time="1272686661" lon="-122.40704" lat="37.7976" status="M" unit="id1"/>
#               <point lon="-122.40616" time="1272686619"  lat="37.79698" status="E" unit="id1"/>
#               </car>')

readfile<-function(nextfile) {
  #read files and extract the desired nodes
  data <- read_xml(nextfile)
  #nodes<-xml_find_all(page, "point")
  #results<-xml_attrs(nodes)  #test list if all attrs are in the same order
  
  
  
  productos <-  data %>% xml_find_all("//cac:Item/cbc:Description") %>%
                xml_text() 
  
  
  
  precios <-  data %>% xml_find_all("//cac:InvoiceLine/cbc:InvoicedQuantity") %>%
    xml_text() %>%
    as.integer()
  
  
  LineExtensionAmount <-  data %>% xml_find_all("//cac:InvoiceLine/cbc:LineExtensionAmount") %>%
    xml_text() 
  
  
  
  df <- data.frame(productos, precios, LineExtensionAmount)
}

#get list of files and filter out xml files
all.files <- list.files("D:\\D3\\data\\Boletas")
all.files<- all.files[tolower(file_ext(all.files)) == "xml"]
#call function, returns list of data frames then merge together
results<-lapply(all.files, readfile)
aa <- do.call(rbind, results)
