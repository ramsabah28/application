import json
import uuid
import os

def generate_product_data(count):
    categorys = {
        "uuid": str(uuid.uuid4()),
        "name": "Alice Smith",
        "description": "Alice Smith",
        "imageUrl": "https://i.otto.de/i/otto/4979f673-e4ee-43eb-a673-abadd857096f?h=1040&w=1102&qlt=40&unsharp=0,1,0.6,7&sm=clamp&upscale=true&fmt=auto"
    }

    products = []
    for _ in range(count):
        product = categorys.copy()
        product["uuid"] = str(uuid.uuid4())
        products.append(product)

    # Save in the same directory as this script
    file_path = os.path.join(os.path.dirname(__file__), "CategoryMocks.json")
    with open(file_path, "w") as f:
        json.dump(products, f, indent=2)

# Call the function
generate_product_data(10)

print("Done!")
