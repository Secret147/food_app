import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/detail/widgets/button_detail.dart';
import 'package:foodapp/pages/detail/widgets/header_detail.dart';
import 'package:foodapp/pages/detail/widgets/infor_detail.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/ExpandText/expand_text.dart';
import 'package:foodapp/widgets/iconstar/Icon_star.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigatinCustom(),
      body: Column(
        children: [
          const HeaderDetailPage(),
          Container(
            margin: EdgeInsets.all(Dimensions.height10),
            child: Column(children: [
              SizedBox(
                height: Dimensions.height10,
              ),
              const InforDetail(),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  left: Dimensions.height20,
                  right: Dimensions.height20,
                  bottom: Dimensions.height20),
              child: const ExpandText(
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Sagittis arcu malesuada eu sagittis elementum eget. Mi pellentesque elit sed sed. Elit tristique mi tincidunt tristique lacus elementum tortor sed. Eget amet maecenas dolor eu lectus non est ultrices sit. Ullamcorper quam aliquam nec quis dolor. Etiam cras tortor dui mauris aliquam mattis.Lorem ipsum dolor sit amet consectetur. Sagittis arcu malesuada eu sagittis elementum eget. Mi pellentesque elit sed sed. Elit tristique mi tincidunt tristique lacus elementum tortor sed. Eget amet maecenas dolor eu lectus non est ultrices sit. Ullamcorper quam aliquam nec quis dolor. Etiam cras tortor dui mauris aliquam mattis.Lorem ipsum dolor sit amet consectetur. Sagittis arcu malesuada eu sagittis elementum eget. Mi pellentesque elit sed sed. Elit tristique mi tincidunt tristique lacus elementum tortor sed. Eget amet maecenas dolor eu lectus non est ultrices sit. Ullamcorper quam aliquam nec quis dolor. Etiam cras tortor dui mauris aliquam mattis."),
            ),
          ),
          const ButtonDetail(),
        ],
      ),
    );
  }
}
