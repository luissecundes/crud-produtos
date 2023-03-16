import 'dart:convert';
import 'package:flutter_restapi/models/cases_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ApiService {
  final String apiUrl = "http://192.168.0.108:8080/api/product";

  Future<List<Cases>> getCases() async {
    Response res = await get('$apiUrl/all');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases =
          body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Falha ao carregar a lista";
    }
  }

  Future<Cases> getCaseById(int id) async {
    final response = await get('$apiUrl/$id');
    print('${response.body}response');

    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error ao carregar o produto');
    }
  }

  Future<Cases> createCase(Cases cases) async {
    var formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.mmm");
    print(cases);
    Map data = {
      'name': cases.name,
      'description': cases.description,
      'expiration': formatter.format(DateTime(cases.expiration.year,
          cases.expiration.month, cases.expiration.day, 0, 0, 0, 0, 0)),
      'acquisition': formatter.format(DateTime(cases.acquisition.year,
          cases.acquisition.month, cases.acquisition.day, 0, 0, 0, 0, 0)),
      'consumption': formatter.format(DateTime(cases.consumption.year,
          cases.consumption.month, cases.consumption.day, 0, 0, 0, 0, 0)),
    };

    print(jsonEncode(data));
    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error ao adicionar produto.');
    }
  }

  Future<Cases> updateCases(Cases cases) async {
    var formater = DateFormat("yyyy-MM-ddTHH:mm:ss.mmm");
    Map data = {
      'name': cases.name,
      'description': cases.description,
      'expiration': formater.format(DateTime(cases.expiration.year,
          cases.expiration.month, cases.expiration.day, 0, 0, 0, 0, 0)),
      'acquisition': formater.format(DateTime(cases.acquisition.year,
          cases.acquisition.month, cases.acquisition.day, 0, 0, 0, 0, 0)),
      'consumption': formater.format(DateTime(cases.consumption.year,
          cases.consumption.month, cases.consumption.day, 0, 0, 0, 0, 0)),
    };
    print('$apiUrl/${cases.id}');
    print(jsonEncode(data));

    final Response response = await put(
      '$apiUrl/${cases.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error ao atualizar o produto');
    }
  }

  Future<void> deleteCase(item) async {
    var id = item.id;
    Response res = await delete('$apiUrl/$id');
    if (res.statusCode == 200) {
      print("Produto excluído");
    } else {
      throw "Error ao excluir o produto";
    }
  }
}
