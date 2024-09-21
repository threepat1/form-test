import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_test/constant/constants.dart';
import 'package:form_test/model/gender.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  //validate
  var emailError = ''.obs;
  var passwordError = ''.obs;
  //Form
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var pincodeController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  var accountNumberController = TextEditingController();
  var accountHolderController = TextEditingController();
  var ifscCodeController = TextEditingController();
  var selectedGender = Gender.male.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    pincodeController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    accountNumberController = TextEditingController();
    accountHolderController = TextEditingController();
    ifscCodeController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    pincodeController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    accountNumberController.dispose();
    accountHolderController.dispose();
    ifscCodeController.dispose();
    super.onClose();
  }

  //email valid
  String? validEmail(String email) {
    if (email.isEmpty) {
      return "Email cannot be empty";
    } else if (!GetUtils.isEmail(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  //password valid
  String? validPassword(String password) {
    if (password.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null; // No error
  }

  // Validate Email on Change
  void validateEmailOnChange(String email) {
    emailError.value = validEmail(email) ?? '';
    update(); // Trigger UI update for GetBuilder
  }

  // Validate Password on Change
  void validatePasswordOnChange(String password) {
    passwordError.value = validPassword(password) ?? '';
    update(); // Trigger UI update for GetBuilder
  }

  //save function
  void saveProfile() async {
    emailError.value = validEmail(emailController.text) ?? '';

    // Validate password
    passwordError.value = validPassword(passwordController.text) ?? '';

    if (emailError.value.isEmpty && passwordError.value.isEmpty) {
      final url = Uri.parse('${base_url}save-profile');
      final Map<String, dynamic> profile = {
        "email": emailController.text,
        "password": passwordController.text,
        "gender": selectedGender.value.name,
        "pincode": pincodeController.text,
        "address": addressController.text,
        "city": cityController.text,
        "state": stateController.text,
        "country": countryController.text,
        "accountNo": accountNumberController.text,
        "accountHolder": accountHolderController.text,
        "ifsccode": ifscCodeController.text,
      };

      try {
        final res = await http.post(url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode(profile));

        if (res.statusCode == 201) {
          Get.snackbar('Success', 'Saved Successfully');

          clearForm();
        } else {
          Get.snackbar('Error', 'Failed: ${res.body}');
        }
      } catch (e) {
        Get.snackbar('Error', 'Error: $e');
      }
    }
  }

  void clearForm() {
    emailController.clear();
    passwordController.clear();
    pincodeController.clear();
    addressController.clear();
    cityController.clear();
    stateController.clear();
    countryController.clear();
    accountNumberController.clear();
    accountHolderController.clear();
    ifscCodeController.clear();
    selectedGender.value = Gender.male;
  }
}
