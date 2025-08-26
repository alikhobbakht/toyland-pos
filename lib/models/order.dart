import 'product.dart';

class Order {
  final String orderNumber;
  final Product product;
  final DateTime createdAt;
  final double discountedPrice;
  final bool canceled;

  const Order({
    required this.orderNumber,
    required this.product,
    required this.createdAt,
    required this.discountedPrice,
    this.canceled = false,
  });

  double get price => product.price;
  String get productName => product.name;
  String get sku => product.sku;
  String get serialNumber => product.serialNumber;
  String get location => product.location;
  String get vendor => product.vendor;
  String get brand => product.brand;
  String get uniqueCode => product.uniqueCode;
  String get skuPlus => product.skuPlus;
}
