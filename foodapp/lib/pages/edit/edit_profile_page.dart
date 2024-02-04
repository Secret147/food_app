import 'package:flutter/material.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/input_custom/input_custom.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
      nameController.dispose();
      phoneController.dispose();
      addressController.dispose();
    }

    return Scaffold(
      body: Column(
        children: [
          InputCustom(
              controller: nameController, label: "Name", icon: Icons.person),
          SizedBox(
            height: Dimensions.height10,
          ),
          InputCustom(
              controller: phoneController, label: "Phone", icon: Icons.phone),
          SizedBox(
            height: Dimensions.height10,
          ),
          InputCustom(
              controller: addressController,
              label: "Address",
              icon: Icons.location_city),
        ],
      ),
    );
  }
}