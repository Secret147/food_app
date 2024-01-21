import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/item_cart/item_cart.dart';

class ListItemCart extends StatelessWidget {
  const ListItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 1);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      height: Dimensions.height280,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 140,
            width: double.infinity,
            child: PageView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(child: ItemCart()),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.height30,
                        bottom: Dimensions.height40,
                        left: Dimensions.height20),
                    width: 40,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
