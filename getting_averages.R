##############################################
######### Grupo Bimbo Inventory Demand #######
##############################################


#packages


library(data.table)
library(ggplot2)
library(dplyr)
library(plyr)


############## READING ############## 


# perl -ne "print if (rand() < .10)" train.csv > subset.csv


col_names <- c("semana","Agencia_ID","Canal_ID","Ruta_SAK","Cliente_ID",
              "Producto_ID","Venta_uni_hoy","Venta_hoy","Dev_uni_proxima",
              "Dev_proxima","Demanda_uni_equil")




train <- fread('subset.csv', col.names = col_names) 



str(train)

table(train$semana) 



products = fread("producto_tabla.csv")

# TOP 10 products demand

prod_demand <- train %>% 
  group_by(Producto_ID) %>%
  dplyr::summarise(freq = sum(Demanda_uni_equil)) %>%
  join(products,by="Producto_ID") %>%
  arrange(desc(freq))

head(prod_demand,n=10)




cliente <- fread("cliente_tabla.csv", encoding = 'UTF-8')

# TOP 10 customers demand

cust_demand <- train %>% 
  group_by(Cliente_ID) %>%
  dplyr::summarise(freq = sum(Demanda_uni_equil)) %>%
  join(cliente,by="Cliente_ID") %>%
  arrange(desc(freq))

head(cust_demand,n=10)




town <- fread("town_state.csv", encoding = 'UTF-8')

# TOP 10 Agencias demand

town_demand <- train %>% 
  group_by(Agencia_ID) %>%
  dplyr::summarise(freq = sum(Demanda_uni_equil)) %>%
  join(town,by="Agencia_ID") %>%
  arrange(desc(freq))

head(town_demand,n=10)





# customer/product averages
dem_c_p <- train %>%
  group_by(Cliente_ID,Producto_ID) %>%
  dplyr::summarise(mean = mean(Demanda_uni_equil))



write.csv(dem_c_p,"summary_Cliente-Producto.csv")




# product averages
dem_p <- train %>%
  group_by(Producto_ID) %>%
  dplyr::summarise(mean = mean(Demanda_uni_equil))



write.csv(dem_p,"summary_Producto.csv")




# client averages
dem_c <- train %>%
  group_by(Cliente_ID) %>%
  dplyr::summarise(mean = mean(Demanda_uni_equil))



write.csv(dem_c,"summary_Cliente.csv")








