import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/itemcustomv2/item_custom_v2.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TypePage extends StatelessWidget {
  const TypePage({super.key, required this.type});
  final dynamic type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderCart(name: type["name"]),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(Dimensions.height20),
                child: FutureBuilder(
                  future:
                      context.read<userProvider>().getDishByType(type["type"]),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                    List<Dish> listItem = snapshot.data as List<Dish>;
                    return Column(children: [
                      SizedBox(
                        height: 720,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listItem.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    context.goNamed("detail",
                                        extra: listItem[index]);
                                  },
                                  child: ItemCustomV2(item: listItem[index]));
                            },
                          ),
                        ),
                      ),
                    ]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
