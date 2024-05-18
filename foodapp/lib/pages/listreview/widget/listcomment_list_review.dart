import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodapp/models/rateList.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/ExpandText/expand_text.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:intl/intl.dart';

class ListCommentListReview extends StatelessWidget {
  const ListCommentListReview({super.key, required this.listRate});
  final List<RateList> listRate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: Dimensions.height220,
        margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
        child: ListView.builder(
          itemCount: listRate.length,
          itemBuilder: (BuildContext context, int index) {
            String dateReivew = listRate[index].created_at;
            DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
            DateFormat outputFormat = DateFormat("dd/MM/yyyy");

            // Chuyển đổi
            DateTime createdAt = inputFormat.parse(dateReivew);
            String formattedDate = outputFormat.format(createdAt);
            return Container(
              margin: EdgeInsets.only(bottom: Dimensions.height20),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: Dimensions.height50,
                  height: Dimensions.height50,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius10),
                  ),
                  child: Image.network(listRate[index].user.image,
                      fit: BoxFit.cover),
                ),
                SizedBox(
                  width: Dimensions.height20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextDarkMode(text: listRate[index].user.name),
                                SizedBox(
                                  height: Dimensions.height5,
                                ),
                                TextNormal(
                                  text: formattedDate,
                                  textSize: Dimensions.font14,
                                  color: AppColors.textGrayColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                      listRate[index].rate.toInt(),
                                      (index) => const Icon(
                                            Icons.star_border,
                                            color: AppColors.buttonStartColor,
                                          )),
                                ),
                                Wrap(
                                  children: List.generate(
                                      5 - listRate[index].rate.toInt(),
                                      (index) => Icon(
                                            Icons.star_border,
                                            color: AppColors.modeColor,
                                          )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      SingleChildScrollView(
                          child: ExpandText(
                        textHeight: Dimensions.height100,
                        text: listRate[index].evalute,
                      )),
                    ],
                  ),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}
