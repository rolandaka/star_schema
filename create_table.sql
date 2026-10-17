CREATE TABLE customers (
customer_id VARCHAR(50) PRIMARY KEY,
customers_unique_id VARCHAR(50),
customer_zip_code_prefix VARCHAR(10),
customer_city TEXT,
customer_state TEXT
)


CREATE TABLE orders (
order_id VARCHAR(50) PRIMARY KEY,
customer_id VARCHAR(50) REFERENCES customers(customer_id),
order_status TEXT,
order_purchase_timestamp TIMESTAMP,
order_approved_at TIMESTAMP,
order_delivered_carrier_date TIMESTAMP,
order_delivered_customer_date TIMESTAMP,
order_estimated_delivery_date TIMESTAMP
)


CREATE TABLE sellers (
seller_id VARCHAR(50) PRIMARY KEY,
seller_zip_code_prefix VARCHAR(10),
seller_city TEXT,
seller_state TEXT
)

CREATE TABLE products (
product_id VARCHAR(50) PRIMARY KEY,
product_category_name TEXT,
product_name_length INT,
product_description_length INT,
product_photos_qty INT,
product_weight_g INT,
product_length_cm INT,
product_height_cm INT,
product_width_cm INT
)

CREATE TABLE order_items (
order_item_id VARCHAR(50) PRIMARY KEY,
order_id VARCHAR(50) REFERENCES orders(order_id),
product_id VARCHAR(50) REFERENCES products(product_id),
seller_id VARCHAR(50) REFERENCES sellers(seller_id),
shipping_limit_date TIMESTAMP,
price FLOAT,
freight_value FLOAT
)

CREATE TABLE order_reviews (
review_id VARCHAR(50) PRIMARY KEY,
order_id VARCHAR(50) REFERENCES orders(order_id),
review_score INT,
review_comment_title TEXT,
review_comment_message TEXT,
review_creation_date TIMESTAMP,
review_answer_timestamp TIMESTAMP
)

CREATE TABLE order_payments (
order_id VARCHAR(50) REFERENCES orders(order_id),
payment_sequential INT,
payment_type TEXT,
payment_installments INT,
payment_value FLOAT
)
