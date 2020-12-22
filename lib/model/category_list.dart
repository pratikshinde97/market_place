import 'dart:convert';
import 'dart:typed_data';

class CategoryList {
  String categoryName;
  Uint8List img;
  String categoryId;

  CategoryList.fromJson(obj) {
    this.categoryName = obj['categoryName'];
    this.categoryId = obj['id'];
    this.img = base64Decode(obj['data']);
  }

  static List<CategoryList> fromJsonList(jsonList) {
    return jsonList
        .map<CategoryList>((obj) => CategoryList.fromJson(obj))
        .toList();
  }
}

