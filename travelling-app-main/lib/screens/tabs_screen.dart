// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, duplicate_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:travelling_app/models/trip.dart';
import 'categories_screen.dart';
import 'favorites_screens.dart';
import '../widgets/app_drawer.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key key}) : super(key: key);

  final List<Trip> favoriteTrips;

  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;
   List<Map<String, Object>> _screens;
  @override
  void initState() {
    _screens = [
    {
      'Screen': CategoriesScreen(),
      'Title': 'تصنيفات الرحلات',
    },
    {
      'Screen': FavoritesScreen(widget.favoriteTrips),
      'Title': 'الرحلات المفضلة',
    }
  ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectScreenIndex]['Title']),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
