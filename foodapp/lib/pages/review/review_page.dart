import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/pages/cart/widgets/header_cart.dart';
import 'package:foodapp/pages/detail/widgets/header_detail.dart';
import 'package:foodapp/pages/detail/widgets/infor_detail.dart';
import 'package:foodapp/pages/review/widget/rate_review_page.dart';
import 'package:foodapp/utils/dimensions.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.dish});
  final Dish dish;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderDetailPage(image: dish.image),
          SizedBox(
            height: Dimensions.height20,
          ),
          InforDetail(
              name: dish.name,
              address: dish.provider.address,
              price: dish.price,
              rate: dish.rate),
          SizedBox(
            height: Dimensions.height20,
          ),
          RateReviewPage(
            dish: dish,
          ),
        ],
      ),
    );
  }
}
