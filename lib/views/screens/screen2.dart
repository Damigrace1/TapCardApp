import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/card2__widget.dart';
import 'screen1.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with SingleTickerProviderStateMixin {
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
        title: const Text('tapcard'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/toggle_theme.png',
              width: 50,
            ),
            onPressed: () {
              // Add logic for theme change
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          tabs: const [
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
        Expanded(
          child: ListView(
            children: [
              const Card2Widget(
                name: 'Jonas Broms',
                jobTitle: 'UX/UI Designer',
                website: 'www.jonasbroms.com',
                email: 'jonas.broms@jonasbroms.com',
                phoneNumber: '+234 805 456 321',
                color: Color(0xff002214),
              ),
              const Card2Widget(
                name: 'Jonas Broms',
                jobTitle: 'UX/UI Designer',
                website: 'www.jonasbroms.com',
                email: 'jonas.broms@jonasbroms.com',
                phoneNumber: '+234 805 456 321',
                color: Color(0xff503dd4),
              ),
              AddNewCard()
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
    return const Center(
      child: Text('Contacts'),
    );
  }
}
