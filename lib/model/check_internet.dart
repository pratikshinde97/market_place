import 'dart:io';

class CheckInternet {
  static bool isInternet = true;
  static checkInternet() async {
    try {
      final response = await InternetAddress.lookup('example.com'); // google
      if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
        isInternet = true;
        print(isInternet);
        // return Future.value(true);;
      } else {
        isInternet = false;
        print(isInternet);
        // return Future.value(false);
      }
    } on Exception catch (_) {
      isInternet = false; // no internet
      print(isInternet);
      //setState(() {});
      return Future.value(false);
    }
  }
}
