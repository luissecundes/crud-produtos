import 'package:flutter/material.dart';
import 'package:flutter_restapi/services/api_service.dart';

import 'models/cases_model.dart';

class CasesController extends ChangeNotifier {
  Map<int, Cases> cases = {};

  CasesController() {
    fetchCaseList();
  }

  void fetchCaseList() {
    ApiService api = ApiService();
    api.getCases().then((value) {
      cases.clear();
      this.cases = Map.fromIterable(value, key: (e) => e.id, value: (e) => e);
      notifyListeners();
    });
  }

  onSave(Cases value) {
    ApiService api = ApiService();
    api.createCase(value);
    cases[value.id] = value;
    notifyListeners();
  }

  onEdit(Cases value) {
    ApiService api = ApiService();
    api.updateCases(value);
    cases[value.id] = value;
    notifyListeners();
  }

  onDelete(Cases value) {
    ApiService api = ApiService();
    api.deleteCase(value);
    cases.remove(value.id);
    notifyListeners();
  }
}
