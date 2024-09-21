import 'package:flutter/material.dart';
import 'package:form_test/model/gender.dart';
import 'package:form_test/service/profile_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(Icons.account_circle_outlined,
                    size: 80, color: Colors.blue),
              ),
              const SizedBox(height: 20),
              const Text("Personal Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                "Email Address",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                  controller: controller.emailController,
                  onChanged: (value) => controller.validateEmailOnChange(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  )),
              Obx(() {
                return controller.emailError.isNotEmpty
                    ? Text(
                        controller.emailError.value,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox.shrink();
              }),
              const SizedBox(height: 10),
              const Text(
                "Password",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.passwordController,
                onChanged: (value) =>
                    controller.validatePasswordOnChange(value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                obscureText: true,
              ),
              Obx(() {
                return controller.passwordError.isNotEmpty
                    ? Text(
                        controller.passwordError.value,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox.shrink();
              }),
              const SizedBox(height: 10),
              const Text(
                "Sex",
                style: TextStyle(fontSize: 14),
              ),
              Obx(() {
                return DropdownButtonFormField<Gender>(
                  value: controller.selectedGender.value,
                  items: Gender.values.map((Gender gender) {
                    return DropdownMenuItem<Gender>(
                      value: gender,
                      child:
                          Text(gender.name), // Display the name using extension
                    );
                  }).toList(),
                  onChanged: (Gender? newValue) {
                    controller.selectedGender.value = newValue!;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                );
              }),
              const SizedBox(height: 20),
              const Text("Address Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                "Pincode",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.pincodeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Address",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "City",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.cityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "State",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.stateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Country",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.countryController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Bank Account Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                "Bank Accunt Number",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.accountNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Account Holder's Name",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.accountHolderController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "IFSC Code",
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: controller.ifscCodeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Rectangular shape
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Text color
                    ),
                    onPressed: controller.saveProfile,
                    child: const Text("Save"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
