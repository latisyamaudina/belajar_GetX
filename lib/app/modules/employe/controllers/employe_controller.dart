import 'dart:convert';
import 'package:belajar_getx/app/data/models/employe_model.dart';
import 'package:belajar_getx/app/providers/api.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmployeController extends GetxController {
  var employeList = <Employe>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/employe';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['rows'];
        print(jsonResponse.toString());
        print(response.statusCode);
        employeList
            .assignAll(jsonResponse.map((model) => Employe.fromJson(model)));
      } else {
        throw Exception('Failed to load employe');
      }
    } catch (e) {
      print('Error during fetching employe: $e');
    }
  }

  //  fungsi create,
  Future<void> tambahEmploye(
    String employe_name,
    String employe_role,
    String employe_phone_number,
    String employe_address,
  ) async {
    try {
      if (employe_name.isEmpty ||
          employe_role.isEmpty ||
          employe_phone_number.isEmpty ||
          employe_address.isEmpty 
          ) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/employe';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'employe_name': employe_name,
          'employe_role': employe_role,
          'employe_number_phone': employe_phone_number,
          'employe_address': employe_address,
        },
      );

      if (response.statusCode == 204) {
        Get.snackbar('Sukses', 'employe berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.BOTTOM_MENU); // Redirect ke halaman employe
      } else {
        throw Exception('Failed to add employe');
      }
    } catch (e) {
      print('Error during tambah employe: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // edit employe
  Future<void> editEmploye(
    Employe employe,
    String employe_name,
    String employe_role,
    String employe_phone_number,
    String employe_address,
  ) async {
    try {
      if (employe_name.isEmpty ||
          employe_role.isEmpty ||
          employe_phone_number.isEmpty ||
          employe_address.isEmpty
          )
          {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/employe/${employe.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'name': employe_name,
          'role': employe_role,
          'phone number': employe_phone_number,
          'address': employe_address,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Employe berhasil diubah');
        fetchData(); // Refresh the EmployeList
        Get.offAndToNamed(Routes.BOTTOM_MENU);
      } else {
        throw Exception('Failed to edit employe');
      }
    } catch (e) {
      print('Error during edit employe: $e');
    }
  }

  // show employe
  void showEmployeDetails(Employe employe) {
    // Get.to(() => DetailEmployeView(employe: employe));
  }

  // delete employe
  Future<void> deleteemploye(Employe employe) async {
    try {
      var apiUrl = '${Api.baseUrl}/employe/${employe.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Employe berhasil dihapus');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete employe');
      }
    } catch (e) {
      print('Error during delete employe: $e');
    }
  }
}