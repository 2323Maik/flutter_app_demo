import 'package:flutter/material.dart';

import 'package:different_screen_spp/models/Meals.dart';
import 'package:different_screen_spp/widgets/main_drawer.dart';
import '../widgets/myHomePage.dart';
import '../routs/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  State<StatefulWidget> createState() => _TabsScreenState();
}
//const TabsScreen({super.key});

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>? _pages;

  @override
  void initState() {
    // TODO: implement initState
    // _pages = [
    _pages = [
      {
        "page": HomePage(),
        "title": "Categories",
        "icon": const ElevatedButton(
          onPressed: null,
          child: Text("Elevated button "),
        )
      },
      {
        "page": FavoriteScreen(widget.favoriteMeals),
        "title": "Favorites",
        "icon": const ElevatedButton(
          onPressed: null,
          child: Text("Elevated button "),
        )
      }
    ];
    super.initState();
  }

  int _selectePageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //// This is a setup for BottomNavigationBar ////////

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages![_selectePageIndex]['title'] as String),
      ),
      ////////////// Drawer Here////////////////
      drawer: MainDrawer(),

      ////////////// Body Here////////////////
      body: _pages![_selectePageIndex]['page'] as Widget,

      ////////////// bottomNavigationBar Here////////////////
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          currentIndex:
              _selectePageIndex, // here we can see thier navigation///
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                label: "Category",
                icon: Icon(Icons.category),
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              backgroundColor: Theme.of(context).primaryColor,
              label: "Favorite",
            )
          ]),
    );

    //// This is a setup for default tab controller ///////////
    /// Here we don't need to use StateFull Widget ///////////

    /*DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: const Text("Meals"),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorite",
              ),
            ]),
          ),
          body: TabBarView(children: [
            HomePage(),
            FavoriteScreen(),
          ]),
        ));*/
  }
}
