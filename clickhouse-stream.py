import clickhouse_connect
import time
import random
from datetime import datetime, timedelta

# Connect to ClickHouse
try:
    client = clickhouse_connect.get_client(
        host='localhost',
        port=8123,
        username='default',
        password='',
        database='sales_db'  
    )
    print("Connected to ClickHouse successfully.")
except Exception as e:
    print(f"Failed to connect to ClickHouse: {e}")
    exit()

# Create a sample table if it doesn't already exist
client.command('''
CREATE TABLE IF NOT EXISTS sales (
    date Date,
    product_category String,
    product_name String,
    quantity UInt32,
    price Float32,
    total_revenue Float32,
    region String
) ENGINE = MergeTree()
ORDER BY date
''')

# Define possible values for each field
product_categories = {
    "Electronics": ["Laptop", "Smartphone", "Tablet", "Smartwatch"],
    "Clothing": ["T-Shirt", "Jeans", "Jacket", "Sneakers"],
    "Home Appliances": ["Refrigerator", "Microwave", "Washer", "Dryer"],
}
regions = ["North", "South", "East", "West"]

start_date = datetime(2024, 10, 1)
        
# Function to generate random sales record
def generate_sales_record():
    date = start_date + timedelta(days=random.randint(0, 30))  
    product_category = random.choice(list(product_categories.keys()))
    product_name = random.choice(product_categories[product_category])
    quantity = random.randint(1, 20)
    price = round(random.uniform(20, 2000), 2)
    total_revenue = round(quantity * price, 2)
    region = random.choice(regions)
    
    return (date, product_category, product_name, quantity, price, total_revenue, region)

# Simulate data streaming
while True:
    # Generate a sales record
    date, product_category, product_name, quantity, price, total_revenue, region = generate_sales_record()
    
    # Insert data into ClickHouse
    client.command(f"""
        INSERT INTO sales (date, product_category, product_name, quantity, price, total_revenue, region)
        VALUES ('{date}', '{product_category}', '{product_name}', {quantity}, {price}, {total_revenue}, '{region}')
    """)
    
    print(f"Inserted data: {date}, {product_category}, {product_name}, {quantity}, {price}, {total_revenue}, {region}")
    time.sleep(1)  # Adjust the frequency as needed
