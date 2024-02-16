import 'package:flutter/material.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/pages/home/widgets/recommend_home.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:foodapp/widgets/list_item/list_item.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.listItem});
  final List<Dish> listItem;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Dish> _foundDishs = [];
  @override
  initState() {
    _foundDishs = widget.listItem;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Dish> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget.listItem;
    } else {
      results = widget.listItem
          .where((dish) =>
              dish.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundDishs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: Dimensions.height10, horizontal: Dimensions.height10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.goNamed("home"),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: Dimensions.height10),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.mainColor,
                      size: Dimensions.font32,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: Dimensions.height60,
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      autofocus: true,
                      style: TextStyle(
                        color: AppColors.modeColor,
                        fontSize: Dimensions.font18,
                      ),
                      decoration: InputDecoration(
                        focusColor: AppColors.modeColor,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.mainColor,
                          ),
                          borderRadius:
                              BorderRadius.circular(Dimensions.borderRadius10),
                        ),
                        hintText: "Enter Search",
                        hintStyle: TextStyle(
                          color: AppColors.modeColor,
                          fontSize: Dimensions.font16,
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.height10),
                          child: Icon(
                            Icons.search,
                            color: AppColors.modeColor,
                            size: Dimensions.font32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Expanded(
              child: _foundDishs.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundDishs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleChildScrollView(
                          child: GestureDetector(
                            onTap: () {
                              context.goNamed("detail",
                                  extra: _foundDishs[index]);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                              height: Dimensions.height80,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.textGrayColor,
                                      width: Dimensions.height2),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.borderRadius10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Dimensions.height110,
                                        height: Dimensions.height80,
                                        child: Image.network(
                                            _foundDishs[index].image,
                                            fit: BoxFit.cover),
                                      ),
                                      SizedBox(
                                        width: Dimensions.height20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BigTextDark(
                                            text: _foundDishs[index].name,
                                            textSize: Dimensions.font16,
                                          ),
                                          TextDarkMode(
                                            text: _foundDishs[index].position,
                                            textSize: Dimensions.font12,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Dimensions.height10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextDarkMode(
                                            text: widget
                                                .listItem[index].provider.rate),
                                        SizedBox(
                                          width: Dimensions.height5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: Dimensions.font16,
                                          color: AppColors.buttonStartColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
            SizedBox(
              height: Dimensions.height5,
            ),
            const RecommendHomePage(),
          ]),
        ),
      ),
    );
  }
}
