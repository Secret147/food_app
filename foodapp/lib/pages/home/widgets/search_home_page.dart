import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/providers/test.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:provider/provider.dart';

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key});

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {
  @override
  Widget build(BuildContext context) {
    Color darkmode =
        Dimensions.darkmode ? AppColors.brightColor : AppColors.textColor;
    return SizedBox(
      height: Dimensions.height60,
      child: Row(children: [
        Expanded(
          child: TextField(
            style: TextStyle(
              color: darkmode,
              fontSize: Dimensions.font18,
            ),
            decoration: InputDecoration(
              focusColor: darkmode,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
              ),
              hintText: "Enter Search",
              hintStyle: TextStyle(
                color: darkmode,
                fontSize: Dimensions.font16,
              ),
              prefixIcon: Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                child: Icon(
                  Icons.search,
                  color: darkmode,
                  size: Dimensions.font32,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              context.read<TestProvider>().changeMode();
              print(Dimensions.darkmode);
            });
          },
          child: Container(
            width: Dimensions.height60,
            margin: EdgeInsets.only(left: Dimensions.height20),
            height: Dimensions.height60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
              color: AppColors.mainColor,
            ),
            child: const Icon(
              Icons.menu,
              color: AppColors.brightColor,
            ),
          ),
        )
      ]),
    );
  }
}
