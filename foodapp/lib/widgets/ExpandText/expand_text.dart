// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class ExpandText extends StatefulWidget {
  const ExpandText({
    Key? key,
    required this.text,
    required this.textHeight,
  }) : super(key: key);
  final String text;
  final double textHeight;
  @override
  State<ExpandText> createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  late String firstString;
  late String secondString;

  bool checked = true;
  @override
  void initState() {
    if (widget.text.length > widget.textHeight) {
      firstString = widget.text.substring(0, widget.textHeight.toInt());
      secondString = widget.text
          .substring(widget.textHeight.toInt() + 1, widget.text.length);
    } else {
      firstString = widget.text;
      secondString = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondString.isEmpty
        ? TextNormal(
            text: firstString,
            color: AppColors.textGrayColor,
            overflow: TextOverflow.visible,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextNormal(
                text: checked ? "$firstString..." : firstString + secondString,
                color: AppColors.textGrayColor,
                overflow: TextOverflow.visible,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    checked = !checked;
                  });
                },
                child: TextNormal(
                  text: checked ? "See more" : "See less",
                  color: AppColors.successTextColor,
                ),
              )
            ],
          );
  }
}
