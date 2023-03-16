import 'package:flutter/material.dart';
import 'package:flutter_restapi/cases_controller.dart';
import 'package:flutter_restapi/models/cases_model.dart';
import 'case_widget.dart';

class CasesList extends StatelessWidget {
  final CasesController casesController;
  final List<Cases> cases;
  CasesList({super.key, required this.cases, required this.casesController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsetsDirectional.all(25),
        itemCount: cases.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            child: Padding(
              padding: EdgeInsetsDirectional.all(10),
              child: CaseWidget(
                mycase: cases[index],
                casesController: casesController,
              ),
            ),
          );
        });
  }
}
