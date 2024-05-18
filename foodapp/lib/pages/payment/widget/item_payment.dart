import 'package:flutter/material.dart';
import 'package:foodapp/local_notifications.dart';
import 'package:foodapp/models/bill.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemPaymentMethod extends StatefulWidget {
  const ItemPaymentMethod({super.key, required this.bill});
  final Bill bill;
  @override
  State<ItemPaymentMethod> createState() => _ItemPaymentMethodState();
}

class _ItemPaymentMethodState extends State<ItemPaymentMethod> {
  @override
  void initState() {
    // TODO: implement initState
    listenToNotifications(context) {
      print("Listening to notification");
      LocalNotifications.onClickNotification.stream.listen((event) {
        print(event);
        Navigator.pushNamed(context, '/order', arguments: event);
      });
    }

    super.initState();
  }

  bool value = false;
  bool valueCash = false;
  String method = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.height480,
          margin: EdgeInsets.all(Dimensions.height20),
          decoration: BoxDecoration(
            border: Border.all(
                width: Dimensions.height2, color: AppColors.textGrayColor),
            borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
          ),
          child: Container(
            margin: EdgeInsets.all(Dimensions.height20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextDarkMode(text: "Debit/Credit Card"),
                    Checkbox(
                      shape: const CircleBorder(),
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          valueCash = false;
                          this.value = value!;
                          if (value) {
                            method = "credit";
                          } else {
                            method = "";
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: Dimensions.height10),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height10)),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: Dimensions.height260,
                              child: Image.asset("assets/images/card.png",
                                  fit: BoxFit.cover),
                            ),
                            Positioned(
                              top: Dimensions.height20,
                              left: Dimensions.height20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextNormal(
                                    weight: FontWeight.w100,
                                    text: "Master Card",
                                    textSize: Dimensions.font20,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  TextNormal(text: "**** **** **** 5678"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  TextNormal(
                                    weight: FontWeight.w100,
                                    text: "Card Name",
                                    textSize: Dimensions.font20,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  TextNormal(text: "Nguyen Thanh Chung"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  TextNormal(
                                    text: "Expires Date",
                                    weight: FontWeight.w100,
                                    textSize: Dimensions.font20,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  TextNormal(text: "08/28"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child:
                                        Image.asset("assets/icons/Frame.png"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.mainColor,
                    ),
                    TextNormal(
                      text: "Thêm thẻ mới",
                      color: AppColors.mainColor,
                      weight: FontWeight.w700,
                      textSize: Dimensions.font18,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(Dimensions.height20),
          decoration: BoxDecoration(
            border: Border.all(
                width: Dimensions.height2, color: AppColors.textGrayColor),
            borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
          ),
          child: Container(
            margin: EdgeInsets.all(Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDarkMode(text: "Cash on Delivery"),
                Checkbox(
                  shape: const CircleBorder(),
                  value: valueCash,
                  onChanged: (valueCash) {
                    setState(() {
                      this.valueCash = valueCash!;
                      if (valueCash) {
                        value = false;
                        method = "cash";
                      } else {
                        method = "";
                      }
                    });
                    print(method);
                  },
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            widget.bill.paymentmethod = method;
            await context.read<userProvider>().postNewBill(widget.bill);
            LocalNotifications.showSimpleNotification(
                title: "Tình trạng đơn hàng",
                body:
                    "Đơn hàng của bạn đã được tạo thành công. Tổng hóa đơn ${widget.bill.totalprice}\$. Vui lòng kiểm tra lại thông tin đơn hàng",
                payload: "This is simple data");
            Dimensions.pageActive = 2;
            context.goNamed("order");
          },
          child: Container(
            margin: EdgeInsets.all(Dimensions.height20),
            decoration: BoxDecoration(
              border: Border.all(
                  width: Dimensions.height2, color: AppColors.textGrayColor),
              borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
            ),
            child: ButtonCustom(text: "Confirm Order"),
          ),
        ),
      ],
    );
  }
}
