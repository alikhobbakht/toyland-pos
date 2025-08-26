import 'package:fluent_ui/fluent_ui.dart';
import '../models/order.dart';

class OrdersPage extends StatelessWidget {
  final List<Order> orders;
  const OrdersPage({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text('Orders')),
      content: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            child: ListTile(
              title: Text('Order #${order.orderNumber} - ${order.product.name}'),
              subtitle: Text(
                'SKU: ${order.product.sku}\nSerial: ${order.serialNumber}\nTime: ${order.createdAt}\nPrice: ${order.price}\nDiscounted: ${order.discountedPrice}\nLocation: ${order.location}\nVendor: ${order.vendor}\nBrand: ${order.brand}\nUnique: ${order.uniqueCode}\nCanceled: ${order.canceled}\nSKU+: ${order.skuPlus}',
              ),
            ),
          );
        },
      ),
    );
  }
}
