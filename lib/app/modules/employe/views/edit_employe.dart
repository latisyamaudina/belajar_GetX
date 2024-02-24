// // edit_employe_view.dart
// import 'package:example/app/data/models/employe_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:example/app/modules/employe/controllers/employe_controller.dart';

// class EditEmployeView extends StatelessWidget {
//   final Employe employe;
//   final EmployeController controller = Get.find();
//   final TextEditingController namaController = TextEditingController();
//   final RxString jenisKelamin = 'Laki-laki'.obs;
//   final TextEditingController alamatController = TextEditingController();
//   final RxString tglLahir = ''.obs;
//   final TextEditingController noTelpController = TextEditingController();

//   EditemployeView({require this.employe}) {
//     namaController.text = employe.employe_name;
//     jenisKelamin.value = employe.jenisKelamin;
//     alamatController.text = employe.alamat;
//     tglLahir.value = employe.tglLahir;
//     noTelpController.text = employe.noTelp;
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != DateTime.now()) {
//       tglLahir.value = "${picked.year}-${picked.month}-${picked.day}";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit employe'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: namaController,
//               decoration: InputDecoration(labelText: 'Nama'),
//             ),
//             Obx(
//               () => DropdownButtonFormField<String>(
//                 value: jenisKelamin.value,
//                 items: ['Laki-laki', 'Perempuan']
//                     .map((String value) => DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         ))
//                     .toList(),
//                 onChanged: (newValue) {
//                   jenisKelamin.value = newValue!;
//                 },
//                 decoration: InputDecoration(labelText: 'Jenis Kelamin'),
//               ),
//             ),
//             TextFormField(
//               controller: alamatController,
//               decoration: InputDecoration(labelText: 'Alamat'),
//             ),
//             InkWell(
//               onTap: () => _selectDate(context),
//               child: InputDecorator(
//                 decoration: InputDecoration(
//                   labelText: 'Tanggal Lahir',
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Obx(() => Text(tglLahir.value)),
//                     Icon(Icons.calendar_today),
//                   ],
//                 ),
//               ),
//             ),
//             TextFormField(
//               controller: noTelpController,
//               decoration: InputDecoration(labelText: 'No. Telp'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 if (_validateInput()) {
//                   // Always call the editemploye method without any conditional checks
//                   controller.editemploye(
//                     employe,
//                     namaController.text,
//                     jenisKelamin.value,
//                     alamatController.text,
//                     tglLahir.value,
//                     noTelpController.text,
//                   );
//                 }
//               },
//               child: Text('Simpan'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   bool _validateInput() {
//     if (namaController.text.isEmpty ||
//         jenisKelamin.value.isEmpty ||
//         alamatController.text.isEmpty ||
//         tglLahir.value.isEmpty ||
//         noTelpController.text.isEmpty) {
//       Get.snackbar('Error', 'Semua field harus diisi');
//       return false;
//     }
//     return true;
//   }
// }