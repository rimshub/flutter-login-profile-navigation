// Task 4 - bottomNavigationBar

import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabController.index,
        children: const [
          Center(
            child: Text('This is My First Screen'),
          ),
          Center(
            child: Text('This is My Second Screen'),
          ),
          Center(
            child: Text('This is My Third Screen'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Left',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Middle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Right',
          ),
        ],
      ),
    );
  }
}
