import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/card2__widget.dart';
// import 'card_widget.dart';

class MyCardsScreen extends StatefulWidget {
  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/app_logo.png',
            matchTextDirection: true,
          ),
        ),
        title: Text('tapcard'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/toggle_theme.png',
              width: 50,
            ),
            // icon: Icon(Icons.brightness_6),
            onPressed: () {
              // Add logic for theme change
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'My Cards'),
            Tab(text: 'Contacts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyCardsTab(),
          ContactsTab(),
        ],
      ),
    );
  }
}

class MyCardsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddNewCard(),
        Expanded(
          child: ListView(
            children: [
              
            ],
          ),
        ),
      ],
    );
  }
}

class ContactsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contacts'),
    );
  }
}

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[400]!, style: BorderStyle.solid),
      ),
      child: const Center(
        heightFactor: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add_circle_outline, size: 48, color: Color(0xff8e60dd)),
            SizedBox(height: 8),
            Text(
              'Add New Card',
              style: TextStyle(
                color: Color(0xff8e60dd),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
