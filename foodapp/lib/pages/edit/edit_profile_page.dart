import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
import 'package:foodapp/models/userInfor.dart';
import 'package:foodapp/pages/profile/widgets/image_profile.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/const.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/input_custom/input_custom.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.user});
  final UserInfor user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String imageUrl = '';

  @override
  void initState() {
    // TODO: implement initState
    nameController.setText(widget.user.name);
    phoneController.setText(widget.user.phone);
    addressController.setText(widget.user.address);
    birthController.setText(widget.user.birth);
    descriptonController.setText(widget.user.description);
    super.initState();
  }

  File? _image;

  // This is the image picker
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  DateTime selectedDate = DateTime.now();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptonController = TextEditingController();

  void presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        selectedDate = pickedDate;

        final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
        birthController.setText(formattedDate.toString());
      });
    });
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      emailController.dispose();
      nameController.dispose();
      phoneController.dispose();
      addressController.dispose();
      descriptonController.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _openImagePicker,
                  child: Stack(children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      height: Dimensions.height140,
                      width: Dimensions.height140,
                      child: _image == null
                          ? Image.network(widget.user.image, fit: BoxFit.cover)
                          : Image.file(_image!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _openImagePicker,
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(0, 245, 6, 6)
                                  .withOpacity(0.8),
                            ),
                            height: Dimensions.height40,
                            width: Dimensions.height40,
                            child: const Icon(
                              Icons.camera_enhance,
                              color: AppColors.brightColor,
                            )),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                InputCustom(
                    controller: nameController,
                    label: "Name",
                    icon: Icons.person),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InputCustom(
                    controller: phoneController,
                    label: "Phone",
                    icon: Icons.phone),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InputCustom(
                    controller: addressController,
                    label: "Address",
                    icon: Icons.location_city),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  onTap: presentDatePicker,
                  controller: birthController,
                  style: TextStyle(
                      color: AppColors.modeColor,
                      fontSize: Dimensions.font20,
                      decoration: TextDecoration.none,
                      decorationThickness: 0),
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: AppColors.textGrayColor,
                    ),
                    focusColor: AppColors.brightColor,
                    enabledBorder: outlineCustom(),
                    focusedBorder: outlineCustom(),
                    border: const OutlineInputBorder(),
                    labelText: "Birth",
                    suffixIcon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InputCustom(
                    controller: descriptonController,
                    label: "Description",
                    icon: Icons.description),
                SizedBox(
                  height: Dimensions.height30,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      check = true;
                    });
                    if (_image != null) {
                      String fileName =
                          DateTime.now().microsecondsSinceEpoch.toString();
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDireImages =
                          referenceRoot.child("images");
                      Reference referenceImageToUpload =
                          referenceDireImages.child(fileName);
                      try {
                        await FirebaseStorage.instance
                            .refFromURL(widget.user.image)
                            .delete();
                        await referenceImageToUpload.putFile(_image!,
                            SettableMetadata(contentType: 'image/jpeg'));
                        imageUrl =
                            await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        return;
                      }
                    }
                    UserInfor user = UserInfor(
                        name: nameController.text,
                        phone: phoneController.text,
                        address: addressController.text,
                        description: descriptonController.text,
                        email: widget.user.email,
                        image: _image == null ? widget.user.image : imageUrl,
                        birth: birthController.text);
                    // ignore: use_build_context_synchronously
                    await context
                        .read<userProvider>()
                        .putUserInfor(user)
                        .then((value) async {
                      if (value == "Success") {
                        if (_image != null) {
                          final SharedPreferences prefs = await Const.prefs;
                          prefs.setString("image", imageUrl);
                        }
                        setState(() {
                          check = false;
                        });
                        Dimensions.pageActive = 0;
                        context.goNamed("home");
                        // ignore: use_build_context_synchronously
                      }
                    });
                  },
                  child: check == false
                      ? ButtonCustom(text: "Chỉnh sửa")
                      : const CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineCustom() => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
    );
