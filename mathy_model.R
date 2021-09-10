library(data.table)
library(dplyr)
library(plyr)


test <- fread('test.csv') 
head(test)
test$V1 <-NULL

summary <- fread('summary_Cliente-Producto.csv')

test <- test %>%
  join(dem_c_p, by=c("Cliente_ID",'Producto_ID'))



test1 <- test[is.na(test$mean),]
test1$mean <- NULL
test1 <- test1 %>%
  join(dem_p, by=c('Producto_ID'))


test2 <-  test1[is.na(test1$mean),]
test2$mean <- NULL
test2 <- test2 %>%
  join(dem_c, by=c('Cliente_ID'))




test <- na.omit(test)
test1 <- na.omit(test1)



df <- rbind(test,test1,test2)



df <- df %>%
  mutate_if(is.numeric,coalesce,0)




df <- df[,c('id','mean')]

colnames(df)[2] <- 'Demanda_uni_equil'

df <- df %>%
  arrange(id)



df[,2]=round(df[,2],2)
df[,1]=as.integer(unlist(df[,1]))
class(df[,1])='int32'

class(df$id)

str(df)


write.csv(df,'submission.csv',row.names = F)
