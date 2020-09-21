import 'package:OrganizeMe/screens/categories_screen.dart';
import 'package:OrganizeMe/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext) {
    return Container(
      child: Drawer(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars1.githubusercontent.com/u/38538503?s=460&u=0e7ff0373f1e29396dc084eeeb66d973a28dd016&v=4'),
                ),
                accountName: Text('Felipe Gabriel'),
                accountEmail: Text('admin@ofelipegabriel'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              ),
              ListTile(
                leading: Icon(Icons.view_list),
                title: Text('Categories'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CategoriesScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
