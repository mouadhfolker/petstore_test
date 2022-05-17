/* /* import 'dart:convert';
import 'package:petstore_test/Models/PetModel.dart';
import 'package:http/http.dart' as http;

class PetApi {
  static Future<List<Pet>> getPet() async {
    var url;
    url = 'https://petstore.swagger.io/#/pet/findPetsByStatus';

    final response = await http.get(Uri.parse(url));
    var responsebody;
    responsebody = jsonDecode(response.body);
    print(responsebody);

    return responsebody;
  }
}
//https://petstore.swagger.io/#/pet/findPetsByStatus
 */

import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchPetList {
  var data = [];
  List<PetList> results = [];
  String urlList = 'https://petstore.swagger.io/#/pet/findPetsByStatus';

  Future<List<PetList>> getpetList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
      
        data = json.decode(response.body);
        results = data.map((e) => PetList.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}

 */
import 'dart:convert';
import 'package:petstore_test/Models/PetModel.dart';
import 'package:http/http.dart' as http;

List listsearchu = [];
List listsearchp = [];
Future getViewhome({listsearchu, listsearchp}) async {
  var url;

  url = "https://petstore.swagger.io/#/pet/findPetsByStatus";

  final response = await http.get(Uri.parse(url));
  var responsebody;

  responsebody = jsonDecode(response.body);

//responsebody= responsebody["username"];
  print(responsebody);

  for (int i = 0; i < responsebody.length; i++) {
    var petList;
    petList.add(responsebody[i]['name']);
    // listsearchp.add(responsebody[i]['photo']);
  }

  return responsebody;
}
