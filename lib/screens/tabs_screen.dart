import 'package:flutter/material.dart';
import 'package:vamos_cozinhar/components/main_drawer.dart';
import 'package:vamos_cozinhar/models/meal.dart';
import 'package:vamos_cozinhar/screens/categories_screen.dart';
import 'package:vamos_cozinhar/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, dynamic>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens?[_selectedScreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens?[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
          ]),
    );
  }
}



































