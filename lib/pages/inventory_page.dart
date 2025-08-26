import 'package:fluent_ui/fluent_ui.dart';
import '../models/product.dart';

class InventoryPage extends StatelessWidget {
  final List<Product> products;
  const InventoryPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text('Inventory')),
      content: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(
                'SKU: ${product.sku}\nBrand: ${product.brand}\nVendor: ${product.vendor}\nPrice: ${product.price}\nLocation: ${product.location}\nSerial: ${product.serialNumber}\nUnique: ${product.uniqueCode}\nSKU+: ${product.skuPlus}',
              ),
            ),
          );
        },
      ),
    );
  }
}
