import 'package:fluent_ui/fluent_ui.dart';
import 'models/product.dart';
import 'models/order.dart';
import 'pages/inventory_page.dart';
import 'pages/orders_page.dart';
import 'pages/order_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Product> products = [
    const Product(
      name: 'Toy Car',
      brand: 'FunBrand',
      sku: 'TC001',
      uniqueCode: 'UNIQ001',
      serialNumber: 'SN123',
      vendor: 'ToyVendor',
      price: 10.0,
      location: 'A1',
      skuPlus: 'TC001-PLUS',
    ),
    const Product(
      name: 'Doll',
      brand: 'PlayCo',
      sku: 'DL002',
      uniqueCode: 'UNIQ002',
      serialNumber: 'SN456',
      vendor: 'ToyVendor',
      price: 15.5,
      location: 'B2',
      skuPlus: 'DL002-PLUS',
    ),
  ];

  final List<Order> orders = [];
  int nextOrderNumber = 1;
  int index = 0;

  void _addOrder(Order order) {
    setState(() {
      orders.add(order);
      nextOrderNumber++;
      index = 1; // switch to orders page after creation
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Toyland POS',
      home: NavigationView(
        pane: NavigationPane(
          selected: index,
          onChanged: (i) => setState(() => index = i),
          displayMode: PaneDisplayMode.top,
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.cube),
              title: const Text('Inventory'),
              body: InventoryPage(products: products),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.box),
              title: const Text('Orders'),
              body: OrdersPage(orders: orders),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.add),
              title: const Text('New Order'),
              body: OrderFormPage(
                products: products,
                onCreate: _addOrder,
                nextOrderNumber: nextOrderNumber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
