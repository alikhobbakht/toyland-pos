import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import '../models/order.dart';
import '../models/product.dart';
import '../services/repository.dart';

class OrderFormPage extends StatefulWidget {
  const OrderFormPage({super.key});

  @override
  State<OrderFormPage> createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final orderNumberController = TextEditingController();
  final discountController = TextEditingController();
  Product? selectedProduct;

  @override
  Widget build(BuildContext context) {
    final repo = Repository();
    return ScaffoldPage(
      header: const PageHeader(title: Text('New Order')),
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBox(
              header: 'Order Number',
              controller: orderNumberController,
            ),
            const SizedBox(height: 10),
            ComboBox<Product>(
              placeholder: const Text('Select Product'),
              value: selectedProduct,
              items: repo.products.value
                  .map((p) => ComboBoxItem(value: p, child: Text(p.name)))
                  .toList(),
              onChanged: (p) => setState(() => selectedProduct = p),
            ),
            const SizedBox(height: 10),
            TextBox(
              header: 'Discounted Price',
              controller: discountController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*')),
              ],
            ),
            const SizedBox(height: 10),
            FilledButton(
              child: const Text('Submit'),
              onPressed: () {
                if (selectedProduct == null || orderNumberController.text.isEmpty) {
                  return;
                }
                final order = Order(
                  orderNumber: orderNumberController.text,
                  product: selectedProduct!,
                  createdAt: DateTime.now(),
                  discountedPrice:
                      double.tryParse(discountController.text) ?? selectedProduct!.price,
                );
                repo.addOrder(order);
                orderNumberController.clear();
                discountController.clear();
                setState(() => selectedProduct = null);
                showSnackbar(context, const Snackbar(content: Text('Order added')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
