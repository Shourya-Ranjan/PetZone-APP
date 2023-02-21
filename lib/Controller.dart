// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sam/Content/snap.dart';
import 'package:flutter_sam/screens/Drawer.dart';
import 'package:flutter_sam/screens/MyOrders.dart';

class Controller extends StatelessWidget {
  const Controller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PetZone App",
      home: DefaultTabController(
        length: 3,
        // ignore: sort_child_properties_last
        child: Scaffold(
          appBar: AppBar(
            title: const Text("PetZone"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Icon Button Clicked'),
                    ),
                  );
                },
                tooltip: "Close",
              )
            ],
            backgroundColor: Colors.blue,
          ),
          body: TabBarView(children: [
            Container(child: const SnappingList()),
            Container(child: const OrdersPage()),
            Container(
              child: const Icon(Icons.access_alarm),
            )
          ]),
          drawer: const DrawerOnly(),
          bottomNavigationBar: Container(
            color: Colors.blue,
            child: const TabBar(tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.shopping_cart)),
            ]),
          ),
        ),
      ),
    );
  }
}
