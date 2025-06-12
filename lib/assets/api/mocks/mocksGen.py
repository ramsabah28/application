import json
import uuid
import os

def generate_product_data(count=1000):
    base_product = {
        "uuid": str(uuid.uuid4()),
        "name": "Alice Smith",
        "productTitle": "E-Bike Cityrad Elektrofahrrad",
        "producer": "TAB",
        "description": "High-quality wireless headphones with noise cancellation.",
        "quantity": 20,
        "available": True,
        "category": "Electronics",
        "imageUrl": "https://i.otto.de/i/otto/4979f673-e4ee-43eb-a673-abadd857096f?h=1040&w=1102&qlt=40&unsharp=0,1,0.6,7&sm=clamp&upscale=true&fmt=auto"
    }

    products = []
    for _ in range(count):
        product = base_product.copy()
        product["uuid"] = str(uuid.uuid4())
        products.append(product)

    # Save in the same directory as this script
    file_path = os.path.join(os.path.dirname(__file__), "product_mock.json")
    with open(file_path, "w") as f:
        json.dump(products, f, indent=2)

# Call the function
generate_product_data(1000)

print("Done!")
