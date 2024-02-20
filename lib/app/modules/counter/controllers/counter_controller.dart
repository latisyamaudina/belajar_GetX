import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 1.obs;

  void increment() {
    if (count.value < 20) {
      count.value++;
    } else {
      // Menampilkan snackbar jika count melebihi 100
      Get.snackbar(
        'Peringatan !',
        'Nilai tidak dapat lebih dari 20.',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.notifications),
        backgroundColor: Colors.red,
      );
    }
  }

  void decrease() {
    if (count.value > 1) {
      count.value--;
    } else {
      // Menampilkan snackbar jika count kurang dari 1
      Get.snackbar(
        'Peringatan !',
        'Nilai tidak dapat kurang dari 1',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.notifications),
        backgroundColor: Colors.red,
      );
    }
  }
}