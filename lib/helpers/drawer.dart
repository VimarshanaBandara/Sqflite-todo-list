import 'package:flutter/material.dart';
import 'package:todo_list/screens/category_screen.dart';
import 'package:todo_list/screens/home_screen.dart';
class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName:Text('Vimarshana Bandara'),
                accountEmail:Text('vimarshanabandara76@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(''),
              ),
              decoration: BoxDecoration(
                color: Colors.blue
              ),

            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
            ),

            
            ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.view_list),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryPage()));
              },
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
