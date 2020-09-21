import 'package:OrganizeMe/models/category.dart';
import 'package:OrganizeMe/screens/home_screen.dart';
import 'package:OrganizeMe/services/category_service.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();
  
  var _category = Category();
  var _categoryService = CategoryService();
  
  _showFormDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: <Widget>[
            FlatButton(
              color: Colors.red,
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () async {
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;
                
                var result = await _categoryService.saveCategory(_category);
                print(result);
              },
              child: Text('Save'),
            ),
          ],
          title: Text('Categories Form'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                    hintText: 'Write a category',
                    labelText: 'Category',
                  ),
                ),
                TextField(
                  controller: _categoryDescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Write a description',
                    labelText: 'Description',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.blue,
        ),
        title: Text('Categories'),
      ),
      body: Center(child: Text('Welcome to Categories Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
