import 'package:belajar_getx/app/modules/employe/controllers/employe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahEmployeView extends StatelessWidget {
  final EmployeController controller = Get.find<EmployeController>();
  final TextEditingController name = TextEditingController();
  final RxString role = 'hrd'.obs;
  final TextEditingController phone_number = TextEditingController();
  final TextEditingController address = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah employe'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to('/EmployeView');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Obx(
              () => DropdownButtonFormField<String>(
                value: role.value,
                items: ['hrd', 'analis']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  role.value = newValue!;
                },
                decoration: InputDecoration(labelText: 'Role'),
              ),
            ),
            TextFormField(
              controller: phone_number,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: address,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  controller.tambahEmploye(
                    name.text,
                    role.value,
                    phone_number.text,
                    address.text,
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

 bool _validateInput() {
    if (name.text.isEmpty ||
        role.value.isEmpty ||
        phone_number.text.isEmpty ||
        address.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}