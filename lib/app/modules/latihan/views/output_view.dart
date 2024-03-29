import 'package:belajar_getx/app/modules/latihan/controllers/latihan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatihanOutput extends StatelessWidget {
  // InvoiceOutput({super.key});

  final LatihanController dataController = Get.put(LatihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output Latihan'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Nama Lengkap: ${dataController.fullname}"),
              Text("Tempat Lahir: ${dataController.placeOfBirth}"),
              Text("Tanggal Lahir: ${dataController.dateOfBirth}"),
              Text("Umur: ${dataController.getAge()}"),
              Text("Gender: ${dataController.gender}"),
              Text("Email: ${dataController.email}"),
              Text("Kebangsaan: ${dataController.nationality}"),
              Text("Jenis Keanggotaan: ${dataController.typeOfMember}"),
              Text("Nomor Kartu: ${dataController.cardNumber}"),
              Text("Harga: ${dataController.payment}"),
              Text("Benefit: ${dataController.benefits}"),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: Text("Kembali"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}