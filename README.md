# Grupo Bimbo Inventory Demand - Kaggle
 
Esse Projeto faz parte dos projetos de aprendizado da Formação Cientista de Dados da Data Science Academy.

##### Esse projeto faz parte do curso Big Data Analytics com R e Microsoft Azure Machine Learning da Formação Cientista de Dados da Data Science Academy


## Project Overview

Currently, daily inventory calculations are performed by direct delivery sales employees who must single-handedly predict the forces of supply, demand, and hunger based on their personal experiences with each store. With some breads carrying a one week shelf life, the acceptable margin for error is small.

In this competition, Grupo Bimbo invites Kagglers to develop a model to accurately forecast inventory demand based on historical sales data. Doing so will make sure consumers of its over 100 bakery products aren’t staring at empty shelves, while also reducing the amount spent on refunds to store owners with surplus product unfit for sale.



### Data Description


The data can be accessed on https://www.kaggle.com/c/grupo-bimbo-inventory-demand/data

In those datasets we have information on the demand per week for a particular product and customer, we also have information about the location of a particular customer.



### Model Selection

I found somehow difficult to train a machine learning model for this project, due to memory issues since the dataset is very huge (billions of rows) and also lack of information.

I tried to create a regression model, first using a simple linear regression model, and then also tried a XGBoost model, on both I wasnt able to achieve a good result, in all my trials the model didn't learn anything.

Then I decided to use  a more simple approach, thate became much more effective. I simply used the past average demand grouping by customer and product. To take into account the case where some customer is ordering a product for the first time I used the average demand by product and regarding the situation where the product is new and has never been sold before I used the average demand by customer.

This approach led me to a very good score on Kaggle and also thaught me that not even always a machine learning approach is the best solution.


## Results

![score](https://user-images.githubusercontent.com/69984472/132924806-0dfa9844-2c21-4dcf-a0f2-f768b472dadc.png)
