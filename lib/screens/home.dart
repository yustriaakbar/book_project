import 'package:flutter/material.dart';
import 'package:mini_project/provider/favorite_provider.dart';
import 'package:mini_project/screens/favorite.dart';
import 'package:mini_project/screens/list_item.dart';
import 'package:mini_project/screens/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _pages = [
    ListItem(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          final route = MaterialPageRoute(
              builder: (context) {
                return Consumer<FavoriteProvider>(
                  builder: (context, FavoriteProvider data, widget) {
                    return FavoritePage(
                        popularBookData: data.favoriteBookList);
                  },
                );
              });
          Navigator.push(context, route);
        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
