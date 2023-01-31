import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Text.rich(
                TextSpan(
                  text: 'Hello, ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'John',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.euro,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    '1000',
                    style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 300.0,
                            color: Colors.white,
                            offset: Offset(0, 65),
                          ),
                        ],
                        fontSize: 80,
                        overflow: TextOverflow.clip),
                  ),
                ],
              ),
            ),
            const Center(
              child: Text('Monthly payments',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(height: 70),
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('Pie Chart'),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 0));
  }
}
