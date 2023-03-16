import 'package:flutter/material.dart';
import 'package:flutter_restapi/add_data_widget.dart';
import 'package:flutter_restapi/cases_list.dart';
import 'cases_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      title: 'API de Produtos',
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
            primary: Color.fromARGB(255, 103, 53, 188),
            secondary: Color.fromARGB(255, 159, 132, 211),
            tertiary: Colors.deepPurple[300]),
      ),
      home: MyHomePage(title: 'Lista de Produtos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CasesController casesController = CasesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 225, 240),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: AnimatedBuilder(
            animation: casesController,
            builder: (context, child) {
              return casesController.cases.isNotEmpty
                  ? CasesList(
                      cases: casesController.cases.values.toList(),
                      casesController: casesController,
                    )
                  : Center(
                      child: Text(
                        'Clique abaixo para adicionar produtos!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ), //
    );
  }

  _navigateToAddScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddDataWidget(
          onSave: casesController.onSave,
        ),
      ),
    );
  }
}
