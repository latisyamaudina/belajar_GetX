// // detail_pasien_view.dart
// import 'package:belajar_getx/app/data/models/employe_model.dart';
// import 'package:flutter/material.dart';
// import 'package:example/app/data/models/employ_model.dart';

// class DetailEmployeView extends StatelessWidget {
//   final Employe employe;

//   DetailEmployeView(required this.employe);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Pasien'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Nama: ${employe.employe_name}'),
//             Text('Jenis Kelamin: ${employe.employe_role}'),
//             Text('Alamat: ${employe.employe_phone_number}'),
//             Text('Tanggal Lahir: ${employe.employe_address}'),
//           ],
//         ),
//       ),
//     );
//   }
// }