import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/pos_icon/pos_icon_text.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({super.key});

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: Dimensions.height10),
                  child: TextDarkMode(
                      text: "Delivery to", textSize: Dimensions.font18)),
              const PosIconText(pos: "Dong Da, Ha Noi"),
            ],
          ),
          GestureDetector(
            onTap: () async {
              context.goNamed("profile");
            },
            child: Container(
              height: Dimensions.height50,
              clipBehavior: Clip.hardEdge,
              width: Dimensions.height50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: FutureBuilder(
                future: context.read<userProvider>().getUserAvatar(),
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
                  String image = snapshot.data as String;
                  return Image.network(
                      image.isEmpty ? image : Dimensions.imageUser,
                      fit: BoxFit.cover);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
