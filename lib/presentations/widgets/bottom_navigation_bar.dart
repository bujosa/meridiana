import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      backgroundColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Subscriptions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2),
          label: 'Account',
        ),
      ],
      currentIndex: index ?? 0,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      onTap: (int actualIndex) {
        if (actualIndex == index) {
          return;
        }

        switch (actualIndex) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/subscriptions');
            break;
          case 2:
            Navigator.pushNamed(context, '/account');
            break;
        }
      },
    );
  }
}
