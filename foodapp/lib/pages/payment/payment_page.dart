import 'package:flutter/material.dart';
import 'package:foodapp/models/bill.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';
import 'package:foodapp/pages/payment/widget/item_payment.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.bill});
  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const HeaderCart(name: "Payment Method"),
          ItemPaymentMethod(
            bill: bill,
          ),
        ],
      )),
    );
  }
}
