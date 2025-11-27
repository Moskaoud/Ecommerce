import 'package:flutter/material.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/pages/session11_flutter4.dart';
import 'package:ecommerce/pages/session12_flutter5.dart';

import 'moody.dart';
import 'session5_task.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(Icons.menu, color: Colors.black),
      //   ),
      //   title: Text("Home"),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.settings, color: Colors.black),
      //     ),
      //   ],
      // ),
      body: SafeArea(child: Task()),
      // body: SafeArea(child: Session12Flutter5()),
      // body: SafeArea(child: Login()),
      // body: SafeArea(child: Moody()),
      //   body: SafeArea(child: Session11Flutter4()),

    );
  }
}
