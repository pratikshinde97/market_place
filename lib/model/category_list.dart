import 'dart:convert';
import 'dart:typed_data';

class CategoryList {
  String categoryName;
  Uint8List img;
  String categoryId;
  // String avatar;

  CategoryList.fromJson(obj) {
    this.categoryName = obj['categoryName'];
    this.categoryId = obj['id'];
    this.img = base64Decode(obj['data']);
    //this.avatar = obj['avatar'];
  }

  static List<CategoryList> fromJsonList(jsonList) {
    return jsonList
        .map<CategoryList>((obj) => CategoryList.fromJson(obj))
        .toList();
  }
}

//
// class CategoryList {
//   final String categoryName;
//   final String imageCategory;
//   CategoryList({this.categoryName,this.imageCategory});
//
//   List<CategoryList> getCategoryList(){
//     List<CategoryList> categoryList = [
//       CategoryList(
//         categoryName: 'cat-1',
//         imageCategory:
//         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//       ),
//       CategoryList(
//         categoryName: 'cat-2',
//         imageCategory:
//         'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//       ),
//       CategoryList(
//         categoryName: 'cat-3',
//         imageCategory:
//         'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//       ),
//       CategoryList(
//         categoryName: 'cat-4',
//         imageCategory:
//         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//       ),
//       CategoryList(
//         categoryName: 'cat-5',
//         imageCategory:
//         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//       ),
//       CategoryList(
//         categoryName: 'cat-6',
//         imageCategory:
//         'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//       ),
//       CategoryList(
//         categoryName: 'cat-7',
//         imageCategory:
//         'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//       ),
//       CategoryList(
//         categoryName: 'cat-8',
//         imageCategory:
//         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//       ),
//
//     ];
//     return categoryList;
//   }
// }
