import 'package:flutter/foundation.dart';

import '../models/order.dart';
import '../models/product.dart';

class Repository {
  Repository._internal();
  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  final ValueNotifier<List<Product>> products = ValueNotifier<List<Product>>([
    const Product(
      name: 'Sample Toy',
      brand: 'Acme',
      sku: 'SKU001',
      uniqueCode: 'UC001',
      serialNumber: 'SN001',
      vendor: 'ToyVendor',
      price: 10.0,
      location: 'Aisle 1',
      skuPlus: 'SKU001-PLUS',
    ),
  ]);

  final ValueNotifier<List<Order>> orders = ValueNotifier<List<Order>>([]);

  void addProduct(Product product) {
    products.value = [...products.value, product];
  }

  void addOrder(Order order) {
    orders.value = [...orders.value, order];
  }
}
