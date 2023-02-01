import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:provider/provider.dart';
import '../../shared/models/subscription.dart';
import '../../shared/utils/constants.dart';
import '../widgets/global/bottom_navigation_bar.dart';

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

  FocusNode urlSubscriptionFocusNode = FocusNode();

  int category = 0;

  @override
  Widget build(BuildContext context) {
    final suscriptioProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Dismissible(
          key: const Key('add_subscription'),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 80.0, bottom: 20.0),
                  child: Center(
                    child: Text(
                      'Add Subscription',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                Text('Subscription name',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                    )),
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
                        prefixIcon: Icon(Icons.store),
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
                Text('Logo link',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      focusNode: urlSubscriptionFocusNode,
                      decoration: const InputDecoration(
                        floatingLabelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_link),
                        prefixIconColor: Colors.white,
                        hintText: 'https://example.com/logo.png',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: imageSubscriptionEditingController,
                    ),
                  ),
                ),
                Text('Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                    )),
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
                      inputFormatters: [
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
                      ),
                    ],
                  ),
                  resultWidth: MediaQuery.of(context).size.width * 0.85,
                  resultHeight: MediaQuery.of(context).size.height * 0.070,
                  dropdownHeight: 200,
                  dropdownWidth: MediaQuery.of(context).size.width * 0.6,
                  dropdownList: dropdownCategoryList,
                  onChange: (value) {
                    setState(() {
                      category = value['value'];
                    });
                  },
                  defaultValue: dropdownCategoryList[category],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child:
                          const Text('Cancel', style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (nameSubscriptionEditingController.text.isNotEmpty &&
                            imageSubscriptionEditingController
                                .text.isNotEmpty &&
                            priceSubscriptionEditingController
                                .text.isNotEmpty) {
                          if (!imageSubscriptionEditingController.text
                              .contains('https://')) {
                            FocusScope.of(context)
                                .requestFocus(urlSubscriptionFocusNode);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(milliseconds: 1000),
                                backgroundColor: Colors.blueAccent,
                                content: Text('Please enter a valid image link',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ),
                            );
                            return;
                          }

                          final subscription = Subscription(
                            name: nameSubscriptionEditingController.text,
                            image: imageSubscriptionEditingController.text,
                            price: double.parse(
                                priceSubscriptionEditingController.text),
                            category: category,
                          );

                          suscriptioProvider.addSubscription(subscription);

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 1000),
                              backgroundColor: Colors.blueAccent,
                              content: Text('Please fill all fields',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Save', style: TextStyle(fontSize: 20)),
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
