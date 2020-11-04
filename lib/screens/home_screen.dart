import 'package:OrganizeMe/helpers/drawer_navigation.dart';
import 'package:OrganizeMe/models/todo.dart';
import 'package:OrganizeMe/screens/todo_screen.dart';
import 'package:OrganizeMe/services/todo_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoService _todoService;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  List<Todo> _todoList = List<Todo>();

  @override
  initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService = TodoService();
    _todoList = List<Todo>();

    var todos = await _todoService.readTodo();

    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoDate = todo['todoDate'];
        model.isFinished = todo['isFinished'];
        _todoList.add(model);
      });
    });
  }

  _showSucessSnackBar(message) {
    var _snackBar = SnackBar(content: message,);
    _globalKey.currentState.showSnackBar(_snackBar);
  }

  _deleteFormDialog(BuildContext context, todoId) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: <Widget>[
            FlatButton(
              color: Colors.green,
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            FlatButton(
              color: Colors.red,
              onPressed: () async {

                var result = await _todoService.deleteTodo(todoId);
                if (result > 0) {
                  Navigator.pop(context);
                  getAllTodos();
                  _showSucessSnackBar(Text('Deleted'));
                }
              },
              child: Text('Delete'),
            ),
          ],
          title: Text('Are you sure you want to delete this?'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrganizeMe'),
      ),
      drawer: DrawerNavigation(),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_todoList[index].title.isEmpty ? 'No title' : _todoList[index].title),
                      Text(_todoList[index].todoDate.isEmpty ? 'No date' : _todoList[index].todoDate),
                    ],
                  ),
                  subtitle: Text(_todoList[index].category.isEmpty ? 'No Category' : _todoList[index].category),
                  trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _deleteFormDialog(context, _todoList[index].id);
                        },
                      ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TodoScreen(),
            ),
          );
          getAllTodos();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
