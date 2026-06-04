Shoe Store App

A simple Flutter application that demonstrates a basic shopping cart system for a shoe store.

Features

Display a list of available shoes

Add shoes to the shopping cart

Increase quantity when adding the same shoe again

Remove shoes from the cart

Automatically calculate the total price

Responsive Flutter UI

Project Structure

lib/

├── ShoeStoreShop/
│   ├── Shoe.dart
│   ├── ShoeData.dart
│   └── ShopStore.dart
└── main.dart

Data Model

Shoe

Each shoe contains:

name

price

quantity

imageUrl

How It Works

Products are loaded from ShoeData.

Users can add products to the cart.

If a product already exists in the cart, its quantity is increased.

Users can remove items from the cart.

The total amount is calculated dynamically.

Technologies Used

Flutter

Dart

Material Design