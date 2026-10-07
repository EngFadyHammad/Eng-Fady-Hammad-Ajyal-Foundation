import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../widgets/product_widget.dart';
import '../widgets/store_bottom_nav.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double vatPercent = 0;
  final double shippingFee = 80;

  List<Product> get cartProducts =>
      allProducts.where((product) => product.quantity > 0).toList();

  double get subTotal {
    double total = 0;
    for (final product in cartProducts) {
      total += product.price * product.quantity;
    }
    return total;
  }

  double get vatValue => subTotal * vatPercent / 100;

  double get shipping => cartProducts.isEmpty ? 0 : shippingFee;

  double get total => subTotal + vatValue + shipping;

  String money(double value) {
    return '\$ ${NumberFormat('#,##0', 'en_US').format(value)}';
  }

  Widget summaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = cartProducts;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home_screen');
          },
        ),
        title: Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ProductWidget(
                        product: products[index],
                        onChanged: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Column(
              children: [
                summaryRow('Sub-total', money(subTotal)),
                summaryRow('VAT (%)', '\$ ${vatValue.toStringAsFixed(2)}'),
                summaryRow('Shipping fee', money(shipping)),
                Gap(8),
                Divider(color: Colors.grey.shade300),
                Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      money(total),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap(24),
                GestureDetector(
                  onTap: () {
                    if (products.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Your cart is empty')),
                      );
                      return;
                    }
                    setState(() {
                      for (final product in allProducts) {
                        product.quantity = 0;
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order placed successfully')),
                    );
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff3669C9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Go To Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(8),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: StoreBottomNav(currentIndex: 1),
    );
  }
}
