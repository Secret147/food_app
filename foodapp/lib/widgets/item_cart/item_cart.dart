import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/responseordered.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({
    super.key,
    required this.ordered,
  });
  final ResponseOrdered ordered;

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  void initState() {
    // TODO: implement initState
    Dimensions.orderQuantity = widget.ordered.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
        border: Border.all(
          color: AppColors.modeColorBorder,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(Dimensions.height10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius15),
                  ),
                  width: Dimensions.height110,
                  height: Dimensions.height110,
                  child: Image.network(widget.ordered.dish.image,
                      fit: BoxFit.cover),
                ),
                Container(
                  width: Dimensions.height100,
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDarkMode(text: widget.ordered.dish.name),
                          TextNormal(
                            text: widget.ordered.dish.provider.address,
                            textSize: Dimensions.font14,
                            color: AppColors.textGrayColor,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.alarm,
                            size: Dimensions.font18,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.height5,
                          ),
                          TextDarkMode(
                            text: "${widget.ordered.timedelivery} min",
                            textSize: Dimensions.font14,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: Dimensions.height30,
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.height5),
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius10),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (Dimensions.orderQuantity > 1) {
                              Dimensions.orderQuantity--;
                            }
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.mainColor,
                          size: Dimensions.font18,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.height5,
                      ),
                      TextNormal(text: "${widget.ordered.quantity}"),
                      SizedBox(
                        width: Dimensions.height5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await context
                              .read<userProvider>()
                              .addQuantity(widget.ordered);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.mainColor,
                          size: Dimensions.font18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
