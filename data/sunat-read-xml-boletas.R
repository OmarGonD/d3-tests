
library(xml2)
library(dplyr)

data <- read_xml("data\\Boletas\\20338570041-03-B999-00013.xml",
                 encoding = "utf-8")





AdditionalMonetaryTotalID <- data %>% xml_find_all("//sac:AdditionalMonetaryTotal/cbc:ID") %>%
  xml_text()

AdditionalMonetaryTotalPayableAmount <- data %>% xml_find_all("//sac:AdditionalMonetaryTotal/cbc:PayableAmount") %>%
  xml_text()


AdditionalMonetaryTotalPayableAmount


####################


SAC_AdditionalPropertyID <- data %>% 
                            xml_find_all("//sac:AdditionalProperty/cbc:ID") %>%
                            xml_text()




SAC_AdditionalPropertyValue <- data %>% 
                              xml_find_all("//sac:AdditionalProperty/cbc:Value") %>%
                              xml_text()


#############################









#############################
#### BOLETA OK ##############
#############################





fecha <- data %>% xml_find_all("//cbc:IssueDate") %>%
  xml_text()

fecha


DocumentCurrencyCode <- data %>% xml_find_all("//cbc:DocumentCurrencyCode") %>%
                         xml_text()

InvoiceTypeCode <- data %>% xml_find_all("//cbc:InvoiceTypeCode") %>%
                    xml_text()



#################################
#### AccountingSupplierParty ####
#################################



CustomerAssignedAccountID <- data %>%
                xml_find_all("//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID") %>%
                xml_text()   


CustomerAssignedAccountID



AdditionalAccountID <- data %>%
                       xml_find_all("//cac:AccountingSupplierParty/cbc:AdditionalAccountID") %>%
                       xml_text()


## Postal Adress

cacPartyPostalAdressID  <- data %>%
                          xml_find_all("//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:ID") %>%
                          xml_text()


cacPartyPostalAdressStreetName  <- data %>%
  xml_find_all("//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName") %>%
  xml_text()



cacPartyPostalAdressCity  <- data %>%
  xml_find_all("//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName") %>%
  xml_text()


cacPartyPostalAdressCityCountrySubEntity  <- data %>%
  xml_find_all("//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity") %>%
  xml_text()



cacPartyPostalAdressCityDistrict  <- data %>%
  xml_find_all("//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:District") %>%
  xml_text()



cacPartyPostalAdressCountry  <- data %>%
              xml_find_all("//cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode") %>%
              xml_text()



### cac:PartyLegalEntity



cacPartyPostalAdressCountry  <- data %>%
  xml_find_all("//cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName") %>%
  xml_text()




########## Termina party ###############
## Termina: AccountingSupplierParty ###
#######################################



####################################
#### Accounting Customer Party #####
####################################





CustomerAssignedAccountID  <- data %>%
  xml_find_all("//cac:AccountingCustomerParty/cbc:CustomerAssignedAccountID") %>%
  xml_text()


CustomerAditionalAccountID  <- data %>%
  xml_find_all("//cac:AccountingCustomerParty/cbc:AdditionalAccountID") %>%
  xml_text()


CustomerAditionalAccountID  <- data %>%
  xml_find_all("//cac:AccountingCustomerParty/cbc:AdditionalAccountID") %>%
  xml_text()

CustomerParty <- data %>%
  xml_find_all("//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName") %>%
  xml_text()



CustomerRegistrationNameStreetName <- data %>% 
  xml_find_all("//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName") %>%
  xml_text()


CustomerRegistrationNameCountry <- data %>% 
  xml_find_all("//cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Country/cbc:IdentificationCode") %>%
  xml_text()



######################################


###### AllowanceCharge ###############




AllowanceChargeIndicator <- data %>% 
                xml_find_all("//cac:AllowanceCharge/cbc:ChargeIndicator") %>%
                xml_text()



AllowanceChargeReasonCode <- data %>% 
  xml_find_all("//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode") %>%
  xml_text()



AllowanceChargeReasonCode <- data %>% 
  xml_find_all("//cac:AllowanceCharge/cbc:AllowanceChargeReasonCode") %>%
  xml_text()



AllowanceChargeAmount <- data %>% 
  xml_find_all("//cac:AllowanceCharge/cbc:Amount") %>%
  xml_text()



TaxCategoryID <- data %>% 
               xml_find_all("//cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID") %>%
               xml_text()


TaxCategoryName <- data %>% 
  xml_find_all("//cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:Name") %>%
  xml_text()



TaxCategoryTaxTypeCode <- data %>% 
  xml_find_all("//cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode") %>%
  xml_text()



### Termina Allowance Charge ###


### TAX TOTAL ###



TaxTotalTaxAmount <- data %>% 
  xml_find_all("//cac:TaxTotal/cbc:TaxAmount") %>%
  xml_text()



TaxTotalTaxSubTotal_Amount <- data %>% 
  xml_find_all("//cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount") %>%
  xml_text()




TaxTotal_Tax_Scheme_id <- data %>% 
  xml_find_all("//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID") %>%
  xml_text()


TaxTotal_Tax_Scheme_name <- data %>% 
  xml_find_all("//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:Name") %>%
  xml_text()



TaxTotal_Tax_Scheme_type_code <- data %>% 
  xml_find_all("//cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode") %>%
  xml_text()


### Acaba Tax Total


### cac:LegalMonetaryTotal


LegalMonetaryTotal_LineExtensionAmount <- data %>% 
  xml_find_all("//cac:LegalMonetaryTotal/cbc:LineExtensionAmount") %>%
  xml_text()



LegalMonetaryTotal_TaxExclusiveAmount <- data %>% 
  xml_find_all("//cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount") %>%
  xml_text()


LegalMonetaryTotal_AllowanceTotalAmount <- data %>% 
  xml_find_all("//cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount") %>%
  xml_text()



LegalMonetaryTotal_PayableAmount <- data %>% 
  xml_find_all("//cac:LegalMonetaryTotal/cbc:PayableAmount") %>%
  xml_text()




LegalMonetaryTotal_PayableAmount <- data %>% 
  xml_find_all("//cac:LegalMonetaryTotal/cbc:PayableAmount") %>%
  xml_text()


#############################################
#############################################
############# Invoice Line ##################
#############################################
#############################################


InvoiceLine_ID <- data %>% 
  xml_find_all("//cac:InvoiceLine/cbc:ID") %>%
  xml_text()



InvoiceLine_ID <- data %>% 
  xml_find_all("//cac:InvoiceLine/cbc:ID") %>%
  xml_text()



InvoiceLine_InvoicedQuantity <- data %>% 
  xml_find_all("//cac:InvoiceLine/cbc:InvoicedQuantity") %>%
  xml_text()




InvoiceLine_LineExtensionAmount <- data %>% 
  xml_find_all("//cac:InvoiceLine/cbc:LineExtensionAmount") %>%
  xml_text()


InvoiceLine_LineExtensionAmount_PricingReference_PriceAmount <- data %>% 
  xml_find_all("//cac:InvoiceLine/cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount") %>%
  xml_text()


InvoiceLine_LineExtensionAmount_PricingReference_PriceTypeCode <- data %>% 
  xml_find_all("//cac:InvoiceLine/cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceTypeCode") %>%
  xml_text()


InvoiceLine_LineExtensionAmount_PricingReference_PriceTypeCode <- data %>% 
  xml_find_all("//cac:InvoiceLine/cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceTypeCode") %>%
  xml_text()



#### TAX TOTAL #######




TaxTotal_TaxAmount <- data %>% 
  xml_find_all("//cac:InvoiceLine/cac:TaxTotal/cbc:TaxAmount") %>%
  xml_text()



TaxTotal_TaxSubTotal_TaxSubtotal_TaxableAmount <- data %>% 
  xml_find_all("//cac:InvoiceLine/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount") %>%
  xml_text()



TaxTotal_TaxSubTotal_TaxPercentt <- data %>% 
  xml_find_all("//cac:InvoiceLine/cac:TaxTotal/cbc:TaxAmoun") %>%
  xml_text()


####################






productos <-  data %>% xml_find_all("//cac:Item/cbc:Description") %>%
             xml_text() 

producto


precios <-  data %>% xml_find_all("//cac:InvoiceLine/cbc:InvoicedQuantity") %>%
            xml_text() 

precios



