import 'package:flutter/material.dart';
import 'package:foodapp/models/bill.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: context.read<userProvider>().getListBill(),
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
          List<Bill> listItem = snapshot.data as List<Bill>;

          return ListView.builder(
            itemCount: listItem.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius10),
                    color: AppColors.brightColor,
                    border: Border.all(
                        width: Dimensions.height2,
                        color: AppColors.borderColor)),
                child: Container(
                  margin: EdgeInsets.all(Dimensions.height20),
                  child: Column(children: [
                    Wrap(
                      children: List.generate(
                        listItem[index].carts.length,
                        (id) => Container(
                          margin: EdgeInsets.only(top: Dimensions.height20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: Dimensions.height80,
                                    height: Dimensions.height80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.borderRadius10),
                                    ),
                                    child: Image.network(
                                      listItem[index].carts[id].dish.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextDarkMode(
                                          text: listItem[index]
                                              .carts[id]
                                              .dish
                                              .name),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      TextNormal(
                                        text: listItem[index].create_at,
                                        textSize: Dimensions.font14,
                                        color: AppColors.textGrayColor,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.successTextColor,
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              color: AppColors.brightColor,
                                              size: Dimensions.font14,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.height5,
                                          ),
                                          TextNormal(
                                            text: "Order Delivered",
                                            textSize: Dimensions.font14,
                                            color: AppColors.successTextColor,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              TextNormal(
                                text:
                                    "\$${listItem[index].carts[id].dish.price}",
                                color: AppColors.mainColor,
                                textSize: Dimensions.font18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.goNamed("home");
                            Dimensions.pageActive = 0;
                          },
                          child: SizedBox(
                            width: Dimensions.height130,
                            height: Dimensions.height40,
                            child: ButtonCustom(
                              text: "ReOrder",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.height130,
                          height: Dimensions.height40,
                          child: ButtonCustom(
                            text: "Get Help",
                            color: AppColors.textGrayColor,
                            textColor: AppColors.modeColor,
                            background: AppColors.brightColor,
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
