import 'package:fluent_ui/fluent_ui.dart';
import '../models/order.dart';
import '../models/product.dart';

class OrderFormPage extends StatefulWidget {
  final List<Product> products;
  final void Function(Order order) onCreate;
  final int nextOrderNumber;

  const OrderFormPage({
    super.key,
    required this.products,
    required this.onCreate,
    required this.nextOrderNumber,
  });

  @override
  State<OrderFormPage> createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final _formKey = GlobalKey<FormState>();
  Product? selectedProduct;
  double discount = 0.0;

  void _submit() {
    if (_formKey.currentState!.validate() && selectedProduct != null) {
      _formKey.currentState!.save();
      final p = selectedProduct!;
      final order = Order(
        orderNumber: widget.nextOrderNumber,
        product: p,
        serialNumber: p.serialNumber,
        createdAt: DateTime.now(),
        price: p.price,
        discountedPrice: p.price - discount,
        location: p.location,
        vendor: p.vendor,
        brand: p.brand,
        uniqueCode: p.uniqueCode,
        skuPlus: p.skuPlus,
      );
      widget.onCreate(order);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text('Register Order')),
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            ComboBox<Product>(
              placeholder: const Text('Select product'),
              items: widget.products
                  .map((p) => ComboBoxItem<Product>(value: p, child: Text(p.name)))
                  .toList(),
              value: selectedProduct,
              onChanged: (p) => setState(() => selectedProduct = p),
            ),
            const SizedBox(height: 12),
            TextFormBox(
              header: 'Discount',
              placeholder: '0',
              onSaved: (v) => discount = double.tryParse(v ?? '0') ?? 0,
              validator: (v) => double.tryParse(v ?? '') != null ? null : 'Enter a number',
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
