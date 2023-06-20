import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget{
  static String routeName = "/homescreen";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}

