import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poc_mobx_leonardo/app/screens/login_screen.dart';
import 'package:poc_mobx_leonardo/app/stores/list_store.dart';
import 'package:poc_mobx_leonardo/app/stores/login_store.dart';
import 'package:poc_mobx_leonardo/app/widgets/custom_icon_button.dart';
import 'package:poc_mobx_leonardo/app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final listStore = ListStore();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Provider.of<LoginStore>(context, listen: false).logout();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          )
        ],
      ),
      body: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return CustomTextField(
                      hint: 'Tarefas',
                      controller: controller,
                      onChanged: listStore.setNewTodoTitle,
                      suffix: listStore.isFormValid
                          ? CustomIconButton(
                              radius: 32,
                              iconData: Icons.add,
                              onTap: () {
                                listStore.addTodo();
                                controller.clear();
                              },
                            )
                          : listStore.setError(),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Observer(
                  builder: (_) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: listStore.todoList.length,
                        itemBuilder: (_, index) => ListTile(
                          title: Text(
                            listStore.todoList[index].title,
                            style: TextStyle(
                                decoration: listStore.todoList[index].done
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: listStore.todoList[index].done
                                    ? Colors.grey
                                    : Colors.black87),
                          ),
                          onTap: listStore.todoList[index].setToggleDone,
                        ),
                        separatorBuilder: (_, index) =>
                            const Divider(height: 1, color: Colors.black45),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
