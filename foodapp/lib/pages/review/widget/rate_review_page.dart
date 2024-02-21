import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/models/rate.dart';
import 'package:foodapp/providers/userProvider.dart';

import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/input_custom/input_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RateReviewPage extends StatefulWidget {
  const RateReviewPage({super.key, required this.dish});
  final Dish dish;
  @override
  State<RateReviewPage> createState() => _RateReviewPageState();
}

class _RateReviewPageState extends State<RateReviewPage> {
  final TextEditingController reviewController = TextEditingController();
  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double rate = 5.0;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: Dimensions.height400,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextDarkMode(
                text: "Đánh giá cho món ăn",
                textSize: Dimensions.font20,
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height5),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.buttonStartColor,
                    size: Dimensions.height40,
                  ),
                  itemSize: Dimensions.height50,
                  onRatingUpdate: (rating) {
                    rate = rating.toDouble();
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDarkMode(
                    text: "Đánh giá",
                    textSize: Dimensions.font20,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  SizedBox(
                    height: Dimensions.height140,
                    child: TextField(
                      controller: reviewController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      style: TextStyle(
                        decorationThickness: 0,
                        color: AppColors.textColor,
                        fontSize: Dimensions.font20,
                      ),
                      textAlignVertical: const TextAlignVertical(y: -1),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        enabledBorder: outlineCustom(),
                        focusedBorder: outlineCustom(),
                        hintText: 'Write a review',
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () async {
                    final rates = Rate(
                        rate: rate,
                        evalute: reviewController.text,
                        dish: widget.dish);
                    await context
                        .read<userProvider>()
                        .postNewEvalutes(rates)
                        .then((value) {
                      if (value == "Success") {
                        context.goNamed("listreview", extra: widget.dish);
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              content: Text("Fail to send review"),
                            );
                          },
                        );
                      }
                    });
                  },
                  child: ButtonCustom(text: "Submit Review"))
            ],
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineCustom() => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
    );
