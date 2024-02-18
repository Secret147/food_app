import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';

class ListReviewPage extends StatelessWidget {
  const ListReviewPage({super.key, required this.dish});
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeaderCart(name: "Reviews"),
        ],
      ),
    );
  }
}
