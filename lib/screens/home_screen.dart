import 'package:OrganizeMe/helpers/draw_navigation.dart';
import 'package:OrganizeMe/screens/todo_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrganizeMe'),
      ),
      drawer: DrawerNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoScreen(),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
