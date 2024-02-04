import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/pages/detail/widgets/button_detail.dart';
import 'package:foodapp/pages/detail/widgets/header_detail.dart';
import 'package:foodapp/pages/detail/widgets/infor_detail.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/ExpandText/expand_text.dart';
import 'package:foodapp/widgets/iconstar/Icon_star.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.item,
  });
  final Dish item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigatinCustom(),
      body: Column(
        children: [
          HeaderDetailPage(
            image: item.image,
          ),
          Container(
            margin: EdgeInsets.all(Dimensions.height10),
            child: Column(children: [
              SizedBox(
                height: Dimensions.height10,
              ),
              InforDetail(
                  address: item.position,
                  name: item.name,
                  price: item.price,
                  rate: item.provider.rate),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height20,
                    bottom: Dimensions.height20),
                child: ExpandText(
                  text: item.description,
                )),
          ),
          ButtonDetail(
            price: item.price,
            dish: item,
          ),
        ],
      ),
    );
  }
}
