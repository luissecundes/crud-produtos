import 'package:flutter/material.dart';
import 'package:flutter_restapi/cases_controller.dart';

import 'detail_widget.dart';
import 'models/cases_model.dart';

class CaseWidget extends StatelessWidget {
  final Cases mycase;
  final CasesController casesController;
  const CaseWidget({super.key, required this.mycase, required this.casesController});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailWidget(cases: mycase, casesController: casesController,)),
          );
        },
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text(mycase.name),
          subtitle: Text(mycase.description.toString()),
        ),
      ),
    );
  }
}
