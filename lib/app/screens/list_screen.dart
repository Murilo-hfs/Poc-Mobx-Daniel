import 'package:flutter/material.dart';
import 'package:poc_mobx_leonardo/app/widgets/custom_text_field.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                  hint: 'Tarefas',
                  suffix: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                  onChanged: (todo) {},
                ),
              ),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item $index'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
