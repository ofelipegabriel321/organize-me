import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todoTitleController = TextEditingController();

  var todoDescriptionController = TextEditingController();

  var todoDateController = TextEditingController();

  var _selectedValue;

  var _categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: todoTitleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Write Todo Title',
              ),
            ),
            TextField(
              controller: todoDescriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Write Todo Description',
              ),
            ),
            TextField(
              controller: todoDateController,
              decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'Pick a Date',
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Icon(Icons.calendar_today),
                  )),
            ),
            DropdownButtonFormField(
              value: _selectedValue,
              items: _categories,
              hint: Text('Category'),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text('Save', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
