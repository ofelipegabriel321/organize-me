import 'package:OrganizeMe/models/category.dart';
import 'package:OrganizeMe/screens/categories_screen.dart';
import 'package:OrganizeMe/screens/home_screen.dart';
import 'package:OrganizeMe/screens/todos_by_category.dart';
import 'package:OrganizeMe/services/category_service.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  List<Widget> _categoryList = List<Widget>();

  CategoryService _categoryService = CategoryService();

  @override
  initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.readCategories();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(
          InkWell(
            onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new TodosByCategory(category: category['name'],),
              ),
            ),
            child: ListTile(
              title: Text(category['name']),
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext) {
    return Container(
      child: Drawer(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              ),
              ListTile(
                leading: Icon(Icons.view_list),
                title: Text('Categories'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoriesScreen())),
              ),
              Divider(),
              Column(
                children: _categoryList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
