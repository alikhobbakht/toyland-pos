import 'package:fluent_ui/fluent_ui.dart';

import '../services/repository.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = Repository();
    return ScaffoldPage(
      header: const PageHeader(title: Text('Inventory')),
      content: ValueListenableBuilder(
        valueListenable: repo.products,
        builder: (context, products, _) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('${product.brand} • ${product.sku}'),
                trailing: Text('\$${product.price.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}
