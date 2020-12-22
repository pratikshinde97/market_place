// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// class UsersList extends StatefulWidget {
//   @override
//   _UsersListState createState() => _UsersListState();
// }
//
// class _UsersListState extends State<UsersList> {
//   var data1;
//   int index;
//   List<UserModel> _users = List<UserModel>();
//   List<UserModel> _searchUsers = List<UserModel>();
//   List<UserModel> usersdata;
//   List<UserModel> dataList = new List();
//   int count;
//   bool isLoading = false;
//   @override
//   void initState() {
//     count = 1;
//     _loadData(count++);
//     super.initState();
//   }
//
//   Future _loadData(int i) async {
//     await new Future.delayed(new Duration(seconds: 2));
//     getUsers(i).then((value) {
//       setState(() {
//         _users.addAll(value);
//         _searchUsers = _users;
//         this._searchUsers;
//         isLoading = false;
//       });
//     });
//     print("load more");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Users List"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: NotificationListener<ScrollNotification>(
//               onNotification: (ScrollNotification scrollInfo) {
//                 if (!isLoading &&
//                     scrollInfo.metrics.pixels ==
//                         scrollInfo.metrics.maxScrollExtent) {
//                   _loadData(count++);
//
//                   setState(() {
//                     isLoading = true;
//                   });
//                 }
//               },
//               child: ListView.builder(
//                 itemCount: _searchUsers.length,
//                 itemBuilder: (context, i) {
//                   return Container(
//                     height: 60,
//                     child: GestureDetector(
//                       child: Card(
//                         child: Row(
//                           children: [
//                             Container(
//                               child: CircleAvatar(
//                                 radius: 20,
//                                 child: Image.network(_searchUsers[i].avatar),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Expanded(
//                               flex: 3,
//                               child: Text(_searchUsers[i].email,
//                                   style: TextStyle(
//                                       fontSize: 13, color: Color(0xff212121))),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Text(
//                                   _searchUsers[i].first_name +
//                                       " " +
//                                       _searchUsers[i].last_name,
//                                   style: TextStyle(
//                                       fontSize: 13, color: Color(0xff212121))),
//                             ),
//                           ],
//                         ),
//                       ),
//                       onTap: () {
//                         String avatar = _searchUsers[i].avatar;
//                         String email = _searchUsers[i].email;
//                         String name = _searchUsers[i].first_name +
//                             " " +
//                             _searchUsers[i].last_name;
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) =>
//                         //             ProfileScreen(avatar, email, name)));
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Container(
//             height: isLoading ? 50.0 : 0,
//             color: Colors.transparent,
//             child: Center(
//               child: new CircularProgressIndicator(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<List<UserModel>> getUsers(index) async {
//     final res = await http.get("https://reqres.in/api/users?page=$index");
//     if (res.statusCode == 200) {
//       var data = json.decode(res.body);
//       data1 = data['data'];
//       print(data1);
//       var rest = data['data'] as List;
//       usersdata =
//           rest.map<UserModel>((json) => UserModel.fromJson(json)).toList();
//       print(usersdata);
//       return usersdata;
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }
// }
//
// class BackendService {
//   static Future<List<UserModel>> getImages(index) async {
//     final responseBody =
//         (await http.get('https://reqres.in/api/users?page=$index')).body;
//     print(responseBody);
//     // The response body is an array of items.
//     return UserModel.fromJsonList(json.decode(responseBody));
//   }
// }
//
// class UserModel {
//   String email;
//   String first_name;
//   String last_name;
//   String avatar;
//
//   UserModel.fromJson(obj) {
//     this.email = obj['email'];
//     this.first_name = obj['first_name'];
//     this.last_name = obj['last_name'];
//     this.avatar = obj['avatar'];
//   }
//   static List<UserModel> fromJsonList(jsonList) {
//     return jsonList.map<UserModel>((obj) => UserModel.fromJson(obj)).toList();
//   }
// }
