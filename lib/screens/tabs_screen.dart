import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScren extends StatefulWidget {
  @override
  _TabsScrenState createState() => _TabsScrenState();
}

class _TabsScrenState extends State<TabsScren> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1, // you can set the default tab to show up

      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favorite',
              ),
            ],
          ),
        ),
        //you need to tell what information will display after pressing each tab
        body: TabBarView(
          children: <Widget>[CategoriesScreen(), FavoritesScreen()],
        ),
      ),
    );
  }
}
