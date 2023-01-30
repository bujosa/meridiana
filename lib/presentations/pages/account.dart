import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController lastNameEditingController = TextEditingController();

  List dropdownItemList = [
    {
      'label': 'Dollar',
      'value': 'dolar',
      'icon': const Icon(
        Icons.attach_money,
        color: Colors.amber,
      )
    },
    {
      'label': 'Euro',
      'value': 'euro',
      'icon': const Icon(
        Icons.euro,
        color: Colors.amber,
      )
    },
    {
      'label': 'Peso Dominicano',
      'value': 'peso dominicano',
      'icon': const Icon(
        Icons.attach_money_outlined,
        color: Colors.amber,
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Center(
                  child: Text(
                    'Account Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                child: Text('Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.white,
                      hintText: 'LastName',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    controller: lastNameEditingController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text('Currency',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                    )),
              ),
              CoolDropdown(
                resultTS: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                resultBD: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                resultHeight: MediaQuery.of(context).size.height * 0.070,
                resultWidth: MediaQuery.of(context).size.width * 0.85,
                dropdownHeight: 200,
                dropdownWidth: MediaQuery.of(context).size.width * 0.75,
                dropdownList: dropdownItemList,
                onChange: (value) {},
                defaultValue: dropdownItemList[1],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            lastNameEditingController.text = 'Changed';
          },
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: const Icon(Icons.edit_document, color: Colors.black),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 2));
  }
}
