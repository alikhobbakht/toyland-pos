import 'product.dart';

class Order {
  final int orderNumber;
  final Product product;
  final String serialNumber;
  final DateTime createdAt;
  final double price;
  final double discountedPrice;
  final String location;
  final String vendor;
  final String brand;
  final String uniqueCode;
  final bool canceled;
  final String skuPlus;

  Order({
    required this.orderNumber,
    required this.product,
    required this.serialNumber,
    required this.createdAt,
    required this.price,
    required this.discountedPrice,
    required this.location,
    required this.vendor,
    required this.brand,
    required this.uniqueCode,
    this.canceled = false,
    required this.skuPlus,
  });
}
