import 'package:fluent_ui/fluent_ui.dart';

import 'pages/inventory_page.dart';
import 'pages/order_form_page.dart';
import 'pages/orders_page.dart';

void main() {
  runApp(const ToylandPosApp());
}

class ToylandPosApp extends StatefulWidget {
  const ToylandPosApp({super.key});

  @override
  State<ToylandPosApp> createState() => _ToylandPosAppState();
}

class _ToylandPosAppState extends State<ToylandPosApp> {
  int index = 0;

  final pages = const [
    InventoryPage(),
    OrdersPage(),
    OrderFormPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Toyland POS',
      theme: FluentThemeData(),
      home: NavigationView(
        appBar: const NavigationAppBar(
          title: Text('Toyland POS'),
        ),
        pane: NavigationPane(
          selected: index,
          onChanged: (i) => setState(() => index = i),
          items: const [
            PaneItem(icon: Icon(FluentIcons.product), title: Text('Inventory')),
            PaneItem(icon: Icon(FluentIcons.order_status), title: Text('Orders')),
            PaneItem(icon: Icon(FluentIcons.add), title: Text('New Order')),
          ],
        ),
        content: pages[index],
      ),
    );
  }
}
