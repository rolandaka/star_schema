# E-Commerce Star Schema

A star schema built from a flat e-commerce orders dataset, with scripts to create and load it in PostgreSQL and a set of analytical queries.

## Dataset
random data set from kaggle.
## Grain
One row in `order_details` = **one product on one order**.

## Tables

| Table | Type | Description |
|-------|------|-------------|
| `order_details` | Fact | Order line ID, order ID, product ID for each item on an order |
| `customers` | Dimension | Customer ID, customer name, city, state, postal code, region  |
| `products` | Dimension | Product ID, product name, category, sub category, and dimensions |
| `orders` | Dimension | Order ID, customer ID, order date, ship_date, ship mode |
| `sales` | Dimension | Sale ID, product ID, price |

![Schema diagram](star_schema)

## How to run

1. Install PostgreSQL and create a database:
```bash
   createdb ecommerce_star
```
2. Load the raw CSV into a staging table [describe or link your staging step].
3. Create the schema:
```bash
   psql -d ecommerce_star -f create_tables.sql
```
4. Populate the tables (dimensions first, then the fact table):
```bash
   psql -d ecommerce_star -f populate_tables.sql
```
5. Run the example queries:
```bash
   psql -d ecommerce_star -f queries.sql
```

## What I learned about indexes
- **Before:** My query for [revenue by category by month] used a [sequential scan] on `fact_order_items` and took [X ms].
- **Change:** I added an index on [column name].
- **After:** The plan switched to a [index scan] and the time dropped to [Y ms].
- **Takeaway:** [Indexes help most on columns used in joins and filters, but they cost extra storage and slow down writes. On a small table, the planner may ignore them anyway.]
