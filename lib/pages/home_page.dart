import 'package:flutter/material.dart';
import 'package:summit_gate/components/bottom_nav_bar.dart';
import 'package:summit_gate/pages/cart_page.dart';
import 'package:summit_gate/pages/intro_page.dart';
import 'package:summit_gate/pages/profil_page.dart';
import 'package:summit_gate/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom navigation bar
  int _selectedIndex = 0;

  // this method will update our selected index
  // when the user tabs on the bottom navigation bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // page to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 9, 2, 35),
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(250, 249, 133, 9),
                const Color.fromARGB(255, 247, 178, 51),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //logo
                  DrawerHeader(
                    child: Image.asset(
                      "assets/summitgatelogo.png",
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
          
                  //other pages
                  GestureDetector(
                    onTap: () => Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
          
                  GestureDetector(
                    onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilPage(email: "eve.holt@reqres.in"),
                  ),
                ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.person_2,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Profil',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IntroPage(),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex], 
    );
  }
}
