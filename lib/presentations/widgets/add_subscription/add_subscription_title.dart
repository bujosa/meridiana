import 'package:flutter/material.dart';

class AddSubscriptionTitle extends StatelessWidget {
  const AddSubscriptionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
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
    );
  }
}
