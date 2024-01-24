import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/pages/profile/widgets/header_profile.dart';
import 'package:foodapp/pages/profile/widgets/image_profile.dart';
import 'package:foodapp/pages/profile/widgets/list_profile.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/profileitem/profile_item.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigatinCustom(),
      body: Column(
        children: [
          const HeaderProfile(),
          SizedBox(
            height: Dimensions.height20,
          ),
          const ImageProfile(),
          SizedBox(
            height: Dimensions.height30,
          ),
          const Expanded(child: SingleChildScrollView(child: ListProfile())),
        ],
      ),
    );
  }
}
