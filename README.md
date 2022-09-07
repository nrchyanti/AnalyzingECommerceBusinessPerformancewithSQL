# Analyzing_eCommerce_Business_Performance_with_SQL
In a company, measuring business performance is very important to track, monitor, and assess the success or failure of various business processes. Therefore, this project will analyze business performance for an eCommerce company based on several business metrics, namely customer growth, product quality, and payment types.

## Data Preparation
- Prepare raw data to be processed
- Create a new database according to the many tables that have been prepared
- Make sure there are no errors in the input data type of each column
- Importing data in csv format into database using PostgreSQL
- Creating an Entity Relationship Diagram (ERD)
- Export the ERD in the form of an image and make sure the naming of the columns between the tables are related and the data types are correct

### Data Relationship
![image](https://user-images.githubusercontent.com/101455281/188842740-5fec8ee4-3c3e-44e0-af83-7cf33b7a0d2a.png)

### Entity Relationship Diagram (ERD)
![image](https://user-images.githubusercontent.com/101455281/188843268-b5e3c696-0974-48a4-97a9-db9ef5df8d71.png)

## Annual Customer Activity Growth Analysis
The following table shows the average monthly active customers, the number of new customers, the number of customers who make purchases more than once, and the average number of orders per customer. The data is divided annually.

![image](https://user-images.githubusercontent.com/101455281/188844943-b1642397-9348-47ba-a9a0-10e90830000f.png)

From the `average order per customer` column, it can be seen that each customer is on average, only makes 1 order per year.

![image](https://user-images.githubusercontent.com/101455281/188853119-abeac95b-b778-4ee2-af9c-96896ec13c16.png)

There is a significant increase in the average monthly active customer every year. This means that monthly active customers continue to grow well every year.

![image](https://user-images.githubusercontent.com/101455281/188855037-33ac7a45-2f2c-4888-ae33-26bee22e6ac6.png)

There are always new customers added every year. The most rapid increase occurred in 2016 to 2017.

![image](https://user-images.githubusercontent.com/101455281/188855092-7c810463-0cd5-4a34-bbfd-be86ff91308e.png)

The number of customers who made purchases more than once increased very rapidly in 2016 to 2017. However, there was a decline in 2017 to 2018. The marketing strategies implemented in 2016 can be reused for 2018 by evaluating the strategies implemented in 2017.

## Annual Product Category Quality Analysis
The following table shows data per year from total revenue, number of cancel orders, product category with the highest revenue, and product category with the most cancellations.

![image](https://user-images.githubusercontent.com/101455281/188905751-df68443f-39b1-465c-a2b4-ed49755d6f8c.png)

![image](https://user-images.githubusercontent.com/101455281/188905859-71f95e50-02be-462f-ac06-993d1e77c817.png)

There is an increase in total revenue every year. Revenue increased the most from 2016 to 2017.

![image](https://user-images.githubusercontent.com/101455281/188912294-1f76f52a-5863-4465-ad09-3966b4511b77.png)

The number of canceled orders also increases every year.

![image](https://user-images.githubusercontent.com/101455281/188912944-2b8b2f29-84de-40c2-a8b4-01a1a854ac2e.png)

The product category with the highest revenue and the product category with the most cancellations can be seen in the image above. In 2018 the health_beauty category was the product with the highest revenue as well as the most cancellations.

## Analysis of Annual Payment Type Usage
The following table shows the number of uses of various types of payments per year.

![image](https://user-images.githubusercontent.com/101455281/188914034-874d6554-56e8-454d-8ba5-98d5447a18c1.png)

![image](https://user-images.githubusercontent.com/101455281/188920143-d5b5b309-64d2-4047-9b4a-01ea4830f381.png)

Credit cards are the most frequently used payment method. The frequency of use reaches about 74%.

![image](https://user-images.githubusercontent.com/101455281/188920312-6948b0bf-ff46-466f-a770-819049888900.png)

Every year, credit cards are always the most widely used payment method.
