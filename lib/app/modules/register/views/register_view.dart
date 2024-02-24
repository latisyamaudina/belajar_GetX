import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final RegisterController controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('REGISTER'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 4,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(height: 18),
                              TextFormField(
                                  // controller: namaController,
                                  onChanged: controller.onUsernameChanged,
                                  decoration: InputDecoration(
                                      labelText: 'Username',
                                      hintText: 'Username',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Input Username';
                                    }
                                    return null;
                                  }),
                              SizedBox(height: 18),
                              TextFormField(
                                  // controller: namaController,
                                  onChanged: controller.onEmailChanged,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Email',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Input Email';
                                    }
                                    return null;
                                  }),
                              SizedBox(height: 18),
                              TextFormField(
                                // controller: jumlahController,
                                onChanged: controller.onPasswordChanged,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Password',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Input Password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 18),
                              SizedBox(height: 18),
                              SizedBox(
                                // width: displayWidth(context) * 0.8,
                                // height: displayHeight(context) * 0.075,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    controller.register();
                                  },
                                ),
                              ),
                              SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sudah mempunyai akun? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.goToLogin();
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 44, 118, 228),
                                        fontSize: 16.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}