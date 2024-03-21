import 'package:cg_flutter_implementation/features/home/presentation/pages/code_review.dart';
import 'package:cg_flutter_implementation/features/home/presentation/pages/contacts.dart';
import 'package:cg_flutter_implementation/features/home/presentation/pages/custom_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final pages = [
    const Contacts(),
    const CustomWidget(),
    const CodeReview(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contacts,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.widgets,
            ),
            label: 'Custom widget',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.code,
            ),
            label: 'Code review',
          ),
        ],
      ),
    );
  }
}
