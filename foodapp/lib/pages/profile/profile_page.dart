import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/userInfor.dart';
import 'package:foodapp/pages/navigationcustom/navigation_custom.dart';
import 'package:foodapp/pages/profile/widgets/header_profile.dart';
import 'package:foodapp/pages/profile/widgets/image_profile.dart';
import 'package:foodapp/pages/profile/widgets/list_profile.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/profileitem/profile_item.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigatinCustom(),
      body: FutureBuilder(
        future: context.read<userProvider>().getUserInfor(),
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

          UserInfor user = snapshot.data;

          return SizedBox(
            child: Column(
              children: [
                const HeaderProfile(),
                SizedBox(
                  height: Dimensions.height20,
                ),
                ImageProfile(
                  image: user.image,
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: ListProfile(
                  address: user.address,
                  email: user.email,
                  name: user.name,
                  phone: user.phone,
                ))),
              ],
            ),
          );
        },
      ),
    );
  }
}
