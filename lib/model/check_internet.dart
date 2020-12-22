// import 'dart:io';
//
// class CheckInternet {
//   static bool isInternet = true;
//   static checkInternet() async {
//     try {
//       final response = await InternetAddress.lookup('example.com');
//       if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
//         isInternet = true;
//         print(isInternet);
//       } else {
//         isInternet = false;
//         print(isInternet);
//       }
//     } on Exception catch (_) {
//       isInternet = false;
//       print(isInternet);
//       return Future.value(false);
//     }
//   }
// }
