import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../model/model.dart';
import '../../model/model_json.dart';
import '../../utils/urls.dart';

class ContactViewModel with ChangeNotifier {
  int currentIndex = 0;
  Users responseData = Users();
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController initial = TextEditingController();
  String hasilGenerateGambar = '';
  String getGambar = "";
  final Dio _dio = Dio();

  Future addData({required String name, required String job}) async {
    try {
      Map<String, dynamic> userData = {
        "name": name,
        "job": job,
        "createdAt": DateTime.now().toIso8601String()
      };
      Response user = await _dio.post(
        Urls.baseURL,
        data: userData,
      );
      if (user.statusCode == 201) {
        print('Data berhasil dikirim.');
        print('Response data: ${user.data}');
        responseData = Users(
            id: user.data['id'],
            name: user.data['name'],
            job: user.data['job']);
      } else {
        print('Gagal mengirim data. Status code: ${user.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    notifyListeners();
  }

  Future getImage() async {
    try {
      Response respon = await _dio.get(Urls.getImageUrl);
      if (respon.statusCode == 200) {
        print('Berhasil Mengambil foto Foto');
        getGambar = Urls.getImageUrl;
      } else {
        print('Gagal mengirim data. Status code: ${respon.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    notifyListeners();
  }

  Future generateInitial({required String initial}) async {
    try {
      String imageUrl = Urls.generateImageUrl + initial;
      Response respon = await _dio.get(imageUrl);
      if (respon.statusCode == 200) {
        print('Berhasil Create Foto');
        hasilGenerateGambar = imageUrl;
      } else {
        print('Gagal mengirim data. Status code: ${respon.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
    notifyListeners();
  }

  Future updatePost() async {
    Map<String, dynamic> data = {
      "id": 1,
      "title": "foo",
      "body": "bar",
      "userId": 1,
    };

    try {
      Response response = await _dio.put(
        Urls.putData,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data berhasil diperbarui');
        print(response.data);
      } else {
        print('Gagal memperbarui data');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  Future fetchDataJSON() async {
    try {
      final response = await _dio.get(Urls.fetchDataJSON);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        Contact contact = Contact.fromJson(data);

        print('ID: ${contact.id}');
        print('Name: ${contact.name}');
        print('Phone: ${contact.phone}');
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
