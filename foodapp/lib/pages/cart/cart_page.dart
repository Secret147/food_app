import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/ordered.dart';
import 'package:foodapp/models/responseordered.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';
import 'package:foodapp/pages/cart/widgets/listitem_cart.dart';
import 'package:foodapp/pages/cart/widgets/price_cart.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/item_cart/item_cart.dart';
import 'package:foodapp/widgets/itemcustomv2/item_custom_v2.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 1);

    return Scaffold(
      bottomNavigationBar: const NavigatinCustom(),
      body: SafeArea(
        child: Column(children: [
          const HeaderCart(),
          SizedBox(
            height: Dimensions.height10,
          ),
          FutureBuilder(
            future: context.read<userProvider>().getOrdered(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Container(
                  child: const Text("Not connecting"),
                );
              }
              List<ResponseOrdered> orders =
                  snapshot.data as List<ResponseOrdered>;

              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListItemCart(orders: orders),
                    ],
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
