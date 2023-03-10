import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:meridiana/shared/utils/constants.dart';
import 'package:provider/provider.dart';
import '../widgets/global/bottom_navigation_bar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    int? actualCurrency;

    TextEditingController nameEditingController =
        TextEditingController(text: subscriptionProvider.name);

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
                child: Text(
                  'Account Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                child: Text('Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
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
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.white,
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onSubmitted: (value) =>
                        {subscriptionProvider.setName(value)},
                    controller: nameEditingController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text('Currency',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
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
                dropdownList: dropdownCurrencyList,
                onChange: (value) {
                  actualCurrency = value['value'];
                },
                defaultValue: actualCurrency == null
                    ? dropdownCurrencyList[subscriptionProvider.currency]
                    : dropdownCurrencyList[actualCurrency],
              )
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            subscriptionProvider
                .setCurrency(actualCurrency ?? subscriptionProvider.currency);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 1300),
                content: Text(
                  'Information updated!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
          child: Icon(
            Icons.edit_document,
            color: Theme.of(context).colorScheme.primary,
            size: 45,
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 2));
  }
}
