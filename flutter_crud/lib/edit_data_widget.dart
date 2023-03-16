import 'package:flutter/material.dart';
import 'models/cases_model.dart';

class EditDataWidget extends StatefulWidget {
  final Function(Cases) onEdit;
  EditDataWidget({required this.cases, required this.onEdit});

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _expirationController = TextEditingController();
  final _acquisitionController = TextEditingController();
  final _consumptionController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.cases.name;
    _descriptionController.text = widget.cases.description.toString();
    _expirationController.text = widget.cases.expiration.toString();
    _acquisitionController.text = widget.cases.acquisition.toString();
    _consumptionController.text = widget.cases.consumption.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Produtos'),
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
                          Text('Nome completo'),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Nome completo',
                            ),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor coloque o nome.';
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
                          Text('Descrição'),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                              hintText: 'Descrição',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Insira a descrição.';
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
                              hintText: 'Data de Expiração',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, insira uma data.';
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
                              hintText: 'data de Aquisição',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, insira uma data.';
                              }
                              setState(() {});
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
                              hintText: 'Data de Consumo',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Por favor, insira uma data.';
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
                                widget.onEdit(
                                  Cases(
                                    id: widget.cases.id,
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
                                Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                  Navigator.defaultRouteName),
                                );
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
