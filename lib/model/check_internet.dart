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
// CheckInternet.checkInternet();
// if (CheckInternet.isInternet == false) {
// SnackBar snackBar = SnackBar(
// content: Text('No Internet'), duration: Duration(seconds: 4));
// _scaffoldKey.currentState.removeCurrentSnackBar();
// _scaffoldKey.currentState.showSnackBar(snackBar);
// }
