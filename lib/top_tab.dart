// Task 3 - TabController
import 'package:flutter/material.dart';

class TopTab extends StatefulWidget {
  const TopTab({super.key});

  @override
  State<TopTab> createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            indicatorColor: Colors.amber,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Left',
              ),
              Tab(
                text: 'Middle',
              ),
              Tab(
                text: 'Right',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
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
          ),
        ],
      ),
    );
  }
}
