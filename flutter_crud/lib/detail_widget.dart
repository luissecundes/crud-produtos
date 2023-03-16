import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cases_controller.dart';
import 'edit_data_widget.dart';
import 'models/cases_model.dart';

class DetailWidget extends StatelessWidget {
  final CasesController casesController;
  final Cases cases;
  DetailWidget({required this.cases, required this.casesController});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: 440,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Nome:',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text(cases.name,
                            style: Theme.of(context).textTheme.titleLarge)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Descrição',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text(cases.description,
                            style: Theme.of(context).textTheme.titleLarge)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Data de Expiração:',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                            DateFormat('dd/MM/yyyy')
                                .format(cases.expiration),
                            style: Theme.of(context).textTheme.titleLarge)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Data de Aquisição',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text(
                            DateFormat('dd/MM/yyyy')
                                .format(cases.acquisition),
                            style: Theme.of(context).textTheme.titleLarge)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Data de Consumo:',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text(
                            DateFormat('dd/MM/yyyy')
                                .format(cases.consumption),
                            style: Theme.of(context).textTheme.titleLarge)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            _navigateToEditScreen(context, cases);
                          },
                          child: Text(
                            'Editar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _confirmDialog(context);
                          },
                          child: Text('Excluir',
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, Cases cases) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDataWidget(
          cases: cases,
          onEdit: casesController.onEdit,
        ),
      ),
    );
  }

  Future<void> _confirmDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cuidado!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Gostaria de excluir este produto?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                casesController.onDelete(cases);
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(Navigator.defaultRouteName),
                );
              },
            ),
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
