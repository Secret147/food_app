import 'package:flutter/material.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/pages/order/widget/list_order.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavigatinCustom(),
      body: SafeArea(
        child: Column(
          children: [
            HeaderCart(name: "My Order"),
            ListOrderPage(),
          ],
        ),
      ),
    );
  }
}
