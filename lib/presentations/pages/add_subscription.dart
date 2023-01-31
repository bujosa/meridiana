import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/bottom_navigation_bar.dart';

class AddSubscriptionPage extends StatefulWidget {
  const AddSubscriptionPage({super.key});

  @override
  State<AddSubscriptionPage> createState() => _AddSubscriptionPageState();
}

class _AddSubscriptionPageState extends State<AddSubscriptionPage> {
  TextEditingController nameSubscriptionEditingController =
      TextEditingController();

  TextEditingController priceSubscriptionEditingController =
      TextEditingController();

  TextEditingController imageSubscriptionEditingController =
      TextEditingController();

  List dropdownItemList = [
    {
      'label': 'Streaming',
      'value': 1,
    },
    {
      'label': 'Lighting',
      'value': 2,
    },
    {
      'label': 'Gaming',
      'value': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Text(
            'New Subscription',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 30,
            ),
          ),
        ),
        body: Dismissible(
          key: const Key('add_subscription'),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                  child: Text('Name of the subscription',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
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
                        prefixIcon: Icon(Icons.add_link),
                        prefixIconColor: Colors.white,
                        hintText: 'Example: Netflix',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: nameSubscriptionEditingController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text('Logo image link',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
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
                        prefixIcon: Icon(Icons.add_link),
                        prefixIconColor: Colors.white,
                        hintText: 'Add logo image link',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: imageSubscriptionEditingController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text('Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      decoration: const InputDecoration(
                        floatingLabelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.monetization_on),
                        prefixIconColor: Colors.white,
                        hintText: 'example: 10.99',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: priceSubscriptionEditingController,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('Category ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 24,
                        )),
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
                      resultWidth: MediaQuery.of(context).size.width * 0.4,
                      resultHeight: MediaQuery.of(context).size.height * 0.070,
                      dropdownHeight: 200,
                      dropdownWidth: MediaQuery.of(context).size.width * 0.4,
                      dropdownList: dropdownItemList,
                      onChange: (value) {},
                      defaultValue: dropdownItemList[1],
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 1));
  }
}
