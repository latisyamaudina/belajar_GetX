// import 'package:belajar_getx/app/data/models/employe_model.dart';
import 'package:belajar_getx/app/modules/employe/controllers/employe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:example/app/data/models/employe_model.dart';
// import 'edit_employe.dart';
// import 'show_employe.dart';
// import 'package:example/app/modules/employe/controllers/employe_controller.dart';

class EmployeView extends StatelessWidget {
  final EmployeController controller = Get.put(EmployeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Employe'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/employe/create');
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.employeList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.employeList.length,
                itemBuilder: (context, index) {
                  var employe = controller.employeList[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(employe.employe_name),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Get.to(() => EditEmployeView(employe: employe));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            // Get.to(() => DetailEmployeView(employe: employe));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Show a confirmation dialog before deleting
                            // showDeleteConfirmation(context, employe);
                          },
                        ),
                      ],
                    ),
                    subtitle: Text(employe.employe_role),
                    onTap: () {
                      // Pass the 'isEditable' flag to indicate whether it's for editing or viewing
                      employe.isEditable =
                          true; // Set to false for 'Lihat Detail'
                      controller.showEmployeDetails(employe);
                    },
                  );
                },
              ),
      ),
    );
  }

  // void showDeleteConfirmation(BuildContext context, Employe emplye) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Delete Employe'),
  //         content: Text('Apakah kamu akan menghapusnya? ${employe.employe_name}?'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Call the deletePasien method from the controller
  //               controller.deleteEmploye(employe);
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //             child: Text('Delete'),
  //           ),
  //         ],
  //       );
      }
//     );
//   }
// }