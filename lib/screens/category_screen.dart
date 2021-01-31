import 'package:flutter/material.dart';
import 'package:todo_list/models/category.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/service/category_service.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
   var _categoryNameController = TextEditingController();
   var _categoryDescriptionController = TextEditingController();

   var _category = Category();
   var _categoryService =CategoryService();

  _showFromDialog(BuildContext context){
    return showDialog(context: context , barrierDismissible: true , builder: (parm){

      return AlertDialog(
        title:Text('Category Form') ,
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _categoryNameController,
                decoration: InputDecoration(
                  hintText: 'Input the category',
                  labelText: 'Category'
                ),
              ),

              TextField(
                controller: _categoryDescriptionController,
                decoration: InputDecoration(
                    hintText: 'Input the Description',
                    labelText: 'Description'
                ),
              )
            ],
          ),

        ),
        actions: [
          FlatButton(
            color: Colors.red,
            child: Text('Cancel'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

          FlatButton(
            color: Colors.blue,
            child: Text('Save'),
            onPressed: (){
              _category.name = _categoryNameController.text;
              _category.description = _categoryDescriptionController.text;
              _categoryService.saveCategory(_category);

            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: (){
          _showFromDialog(context);
        },
      ),
    );
  }
}
