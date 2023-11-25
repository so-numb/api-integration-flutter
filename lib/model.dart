import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(


    json.decode(str).map((x) => UserModel.fromJson(x)));

// String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


///
///
///
///
class UserModel {
  String bookId;
  String name;
  String edition;
  String regNum;
  String author;

  UserModel({
    required this.bookId,
    required this.name,
    required this.edition,
    required this.regNum,
    required this.author,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    bookId: json["bookId"],
    name: json["name"],
    edition: json["edition"],
    regNum: json["regNum"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "bookId": bookId,
    "name": name,
    "edition": edition,
    "regNum": regNum,
    "author": author,
  };
}
