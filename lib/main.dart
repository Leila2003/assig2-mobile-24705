import 'package:calculator/signin.dart';
import 'package:calculator/calculator.dart';
import 'package:calculator/signup.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';

import 'signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leila',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leila'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.login), text: 'Sign In'),
            Tab(icon: Icon(Icons.app_registration), text: 'Sign Up'),
            Tab(icon: Icon(Icons.calculate), text: 'Calculator'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SignInScreen(),
          SignUpScreen(),
          CalculatorApp(),
        ],
      ),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'leila',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Sign In'),
            onTap: () {
              Navigator.pop(context);
              _tabController.animateTo(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Sign Up'),
            onTap: () {
              Navigator.pop(context);
              _tabController.animateTo(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculator'),
            onTap: () {
              Navigator.pop(context);
              _tabController.animateTo(2);
            },
          ),
        ],
      ),
    );
  }
}
