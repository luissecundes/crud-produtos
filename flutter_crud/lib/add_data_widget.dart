import 'package:flutter/material.dart';
import 'models/cases_model.dart';

class AddDataWidget extends StatefulWidget {
  final Function(Cases) onSave;

  AddDataWidget({required this.onSave});

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _expirationController = TextEditingController();
  final _acquisitionController = TextEditingController();
  final _consumptionController = TextEditingController();

  get description => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produtos'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
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
                          Text('Nome do Produto'),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Nome do Produto',
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, coloque o nome do produto';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Descrição do Produto'),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                              hintText: 'Descrição do Produto',
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, descreva o produto';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Data de Expiração'),
                          TextFormField(
                            controller: _expirationController,
                            decoration: const InputDecoration(
                              hintText: 'yyyy-mm-dd',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, adicione uma data.';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Data de Aquisição'),
                          TextFormField(
                            controller: _acquisitionController,
                            decoration: const InputDecoration(
                              hintText: 'yyyy-mm-dd',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, adicione uma data.';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Data de Consumo'),
                          TextFormField(
                            controller: _consumptionController,
                            decoration: const InputDecoration(
                              hintText: 'yyyy-mm-dd',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, adicione uma data.';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              if (_addFormKey.currentState?.validate() ??
                                  false) {
                                _addFormKey.currentState?.save();
                                widget.onSave(
                                  Cases(
                                    id: 0,
                                    name: _nameController.text,
                                    description: _descriptionController.text,
                                    expiration: DateTime.parse(
                                        _expirationController.text),
                                    acquisition: DateTime.parse(
                                        _acquisitionController.text),
                                    consumption: DateTime.parse(
                                        _consumptionController.text),
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Salvar',
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
      ),
    );
  }
}
