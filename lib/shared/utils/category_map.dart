import 'package:flutter/material.dart';

const Map<int, Icon> currencyToIcon = {
  0: Icon(
    Icons.attach_money,
    color: Colors.amber,
  ),
  1: Icon(
    Icons.euro,
    color: Colors.amber,
  ),
  2: Icon(
    Icons.attach_money_outlined,
    color: Colors.amber,
  ),
};

const Map<int, Icon> currencyToIconHomePage = {
  0: Icon(
    Icons.attach_money,
    color: Colors.white,
    size: 40,
  ),
  1: Icon(
    Icons.euro,
    color: Colors.white,
    size: 40,
  ),
  2: Icon(
    Icons.attach_money_outlined,
    color: Colors.white,
    size: 40,
  ),
};

const Map<int, String> categoryToEmoji = {
  0: '❤️',
  1: '🎞️',
  2: '🍲',
  3: '👨‍💻',
  4: '🏠',
  5: '🎮',
  6: '🚗',
  7: '💼',
  8: '📱',
};

const Map<int, String> categoryToTitle = {
  0: 'Health',
  1: 'Streaming',
  2: 'Food',
  3: 'Education & Tech',
  4: 'Home Services',
  5: 'Gaming',
  6: 'Car Services',
  7: 'Work',
  8: 'Phone Services',
};
