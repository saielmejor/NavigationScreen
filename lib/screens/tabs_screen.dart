import 'package:flutter/material.dart';
import 'categories_screen.dart';
import '../widgets/main_drawer.dart';
import 'favorite_screen.dart';

class TabsScren extends StatefulWidget {
  @override
  _TabsScrenState createState() => _TabsScrenState();
}

class _TabsScrenState extends State<TabsScren> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'},
  ]; //add aproperty for selectedPageIndex

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    // will give you the index of the selected page
// goes to the selectedpage dependending on the selected  index
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]
              ['title']), //access the title of the selectedPageIndex
        ),
        drawer: MainDrawer(),
        //you need to tell what information will display after pressing each tab
        body: _pages[_selectedPageIndex]
            ['page'], // access the page key from the map
        //add bottom tab tab
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex:
              _selectedPageIndex, // changes the color of the selected page
          type: BottomNavigationBarType
              .shifting, // add animation when switching pages
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorite'),
            ),
          ],
        ));
  }
}
