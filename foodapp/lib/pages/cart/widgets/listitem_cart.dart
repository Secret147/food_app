import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/responseordered.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/item_cart/item_cart.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListItemCart extends StatefulWidget {
  const ListItemCart({super.key, required this.orders});
  final List<ResponseOrdered> orders;

  @override
  State<ListItemCart> createState() => _ListItemCartState();
}

class _ListItemCartState extends State<ListItemCart> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 1);
    dynamic itemTotal = 0;
    dynamic delivery = 0;
    dynamic grandTotal = 0;
    dynamic discount = 100;
    for (ResponseOrdered x in widget.orders) {
      itemTotal += x.dish.price * x.quantity;
    }
    grandTotal = itemTotal + delivery - discount;

    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
        height: Dimensions.height320,
        child: ListView.builder(
          itemCount: widget.orders.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: Dimensions.height140,
              width: double.infinity,
              child: PageView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.borderRadius15),
                        border: Border.all(
                          color: AppColors.modeColorBorder,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(Dimensions.height10),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.borderRadius15),
                                  ),
                                  width: Dimensions.height110,
                                  height: Dimensions.height110,
                                  child: Image.network(
                                      widget.orders[index].dish.image,
                                      fit: BoxFit.cover),
                                ),
                                Container(
                                  width: Dimensions.height100,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Dimensions.height10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextDarkMode(
                                              text: widget
                                                  .orders[index].dish.name),
                                          TextNormal(
                                            text: widget.orders[index].dish
                                                .provider.address,
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
                                            text:
                                                "${widget.orders[index].timedelivery} min",
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.height5),
                                  decoration: BoxDecoration(
                                    color: AppColors.borderColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.borderRadius10),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (widget.orders[index].quantity >
                                                1) {
                                              context
                                                  .read<userProvider>()
                                                  .removeQuantity(
                                                      widget.orders[index]);
                                              widget.orders[index].quantity--;
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
                                      TextNormal(
                                          text:
                                              "${widget.orders[index].quantity}"),
                                      SizedBox(
                                        width: Dimensions.height5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<userProvider>()
                                                .addQuantity(
                                                    widget.orders[index]);
                                            widget.orders[index].quantity++;
                                          });
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
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        context
                            .read<userProvider>()
                            .deleteOdered(widget.orders[index].id);
                        widget.orders.remove(widget.orders[index]);
                      });
                    },
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.height30,
                            bottom: Dimensions.height40,
                            left: Dimensions.height20),
                        width: Dimensions.height40,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius10),
                          border: Border.all(color: AppColors.mainColor),
                        ),
                        child: Icon(
                          CupertinoIcons.delete,
                          color: AppColors.mainColor,
                          size: Dimensions.font32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      Column(children: [
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.height20,
              right: Dimensions.height20,
              top: Dimensions.height20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: AppColors.mainColor),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDarkMode(text: "Item Total"),
                  TextDarkMode(
                    text: "\$$itemTotal",
                    textSize: Dimensions.font18,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDarkMode(text: "Discount"),
                  TextDarkMode(
                    text: itemTotal > discount ? "\$$discount" : "0",
                    textSize: Dimensions.font18,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextNormal(
                    text: "Delivery",
                    color: AppColors.successTextColor,
                  ),
                  TextNormal(
                    text: delivery == 0 ? "Free" : "$delivery",
                    textSize: Dimensions.font18,
                    color: AppColors.successTextColor,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.height20,
              right: Dimensions.height20,
              top: Dimensions.height20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: AppColors.mainColor),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDarkMode(
                    text: "Grand Total",
                    textSize: Dimensions.font20,
                  ),
                  TextDarkMode(
                    text: grandTotal > 0 ? "\$$grandTotal" : "0",
                    textSize: Dimensions.font20,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.height20, vertical: Dimensions.height20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: AppColors.mainColor),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDarkMode(
                    text: "Delivery to: Home",
                    textSize: Dimensions.font18,
                  ),
                  TextNormal(
                    text: "Change",
                    textSize: Dimensions.font18,
                    color: AppColors.mainColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
            child: ButtonCustom(text: "Checkout")),
      ]),
    ]);
  }
}
