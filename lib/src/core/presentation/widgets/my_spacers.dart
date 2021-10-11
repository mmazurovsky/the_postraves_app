import 'package:flutter/material.dart';

class MyBiggestSpacer extends StatelessWidget {
  const MyBiggestSpacer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 30);
  }
}

class MyBigSpacer extends StatelessWidget {
  const MyBigSpacer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 23);
  }
}

class MyMediumPlusSpacer extends StatelessWidget {
  const MyMediumPlusSpacer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 18);
  }
}

class MyMediumSpacer extends StatelessWidget {
  const MyMediumSpacer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 12);
  }
}

class MySmallSpacer extends StatelessWidget {
  const MySmallSpacer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 8);
  }
}

class MySmallestSpacer extends StatelessWidget {
  const MySmallestSpacer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 3);
  }
}