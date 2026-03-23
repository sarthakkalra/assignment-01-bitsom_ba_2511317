// =========================================
// OP1: insertMany() — insert all 3 documents
// =========================================
db.products.insertMany([
  {
    product_id: "E001",
    name: "Smart LED TV",
    category: "Electronics",
    brand: "Samsung",
    price: 45000,
    specifications: {
      screen_size: "55 inches",
      resolution: "4K",
      voltage: "220V",
      smart_tv: true
    },
    warranty: {
      period: "2 years",
      type: "Manufacturer"
    },
    available_colors: ["Black"],
    ratings: {
      average: 4.5,
      reviews: 1200
    }
  },
  {
    product_id: "C001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    brand: "Levi's",
    price: 1999,
    size_options: ["S", "M", "L", "XL"],
    fabric: "Cotton",
    color_variants: [
      { color: "Blue", stock: 50 },
      { color: "Black", stock: 30 }
    ],
    care_instructions: [
      "Machine wash",
      "Do not bleach",
      "Iron at low temperature"
    ],
    ratings: {
      average: 4.2,
      reviews: 350
    }
  },
  {
    product_id: "G001",
    name: "Organic Milk",
    category: "Groceries",
    brand: "Amul",
    price: 60,
    weight: "1 litre",
    expiry_date: new Date("2024-02-15"),
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "7g"
    },
    storage_instructions: "Keep refrigerated",
    ingredients: ["Milk"],
    supplier: {
      name: "Amul Dairy",
      location: "Gujarat"
    },
    ratings: {
      average: 4.6,
      reviews: 800
    }
  }
]);


// =========================================
// OP2: find() — Electronics with price > 20000
// =========================================
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// =========================================
// OP3: find() — Groceries expiring before 2025-01-01
// =========================================
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// =========================================
// OP4: updateOne() — add discount_percent field
// =========================================
db.products.updateOne(
  { product_id: "E001" },
  { $set: { discount_percent: 10 } }
);


// =========================================
// OP5: createIndex() — index on category field
// =========================================
db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the "category" field improves query performance,
// especially for frequent queries like filtering products by category
// (e.g., Electronics, Clothing, Groceries). It reduces the need for full
// collection scans and speeds up read operations.