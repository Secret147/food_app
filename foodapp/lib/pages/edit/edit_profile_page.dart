import 'package:flutter/material.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/input_custom/input_custom.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InputCustom(label: "Name", icon: Icons.person),
          SizedBox(
            height: Dimensions.height10,
          ),
          InputCustom(label: "Phone", icon: Icons.phone),
          SizedBox(
            height: Dimensions.height10,
          ),
          InputCustom(label: "Email", icon: Icons.mail),
        ],
      ),
    );
  }
}
