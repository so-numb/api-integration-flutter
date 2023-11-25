import 'dart:developer';
import 'package:api_integration/constants.dart';
import 'package:api_integration/model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<UserModel>?> getUsers() async{
    try{
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.usersEndpoint
      );
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    }
    catch(e){
      log(e.toString());
    }
  }
}