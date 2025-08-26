import 'package:fluent_ui/fluent_ui.dart';

import '../services/repository.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = Repository();
    return ScaffoldPage(
      header: const PageHeader(title: Text('Orders')),
      content: ValueListenableBuilder(
        valueListenable: repo.orders,
        builder: (context, orders, _) {
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                title: Text(order.productName),
                subtitle: Text('Order: ${order.orderNumber} • ${order.sku}'),
                trailing: Text(order.canceled
                    ? 'Canceled'
                    : '\$${order.discountedPrice.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}
