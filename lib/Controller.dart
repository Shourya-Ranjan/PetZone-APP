// ignore_for_file: file_names, library_private_types_in_public_api, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_sam/Content/snap.dart';
import 'package:flutter_sam/screens/Drawer.dart';
import 'package:flutter_sam/screens/MyOrders.dart';

class Controller extends StatelessWidget {
  const Controller({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, mode, __) {
          return MaterialApp(
            theme: ThemeData(),
            darkTheme: ThemeData.dark(), // standard dark theme
            themeMode: mode,
            title: "PetZone App",
            home: DefaultTabController(
              length: 3,
              // ignore: sort_child_properties_last
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("PetZone"),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                            Controller.themeNotifier.value == ThemeMode.light
                                ? Icons.dark_mode
                                : Icons.light_mode),
                        onPressed: () {
                          themeNotifier.value = mode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                        }),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Icon Button Clicked'),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      tooltip: "Close",
                    )
                  ],
                  backgroundColor: Colors.blue,
                ),
                body: const TabBarView(children: [
                  SnappingList(),
                  OrdersPage(),
                  Icon(Icons.access_alarm),
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
        });
  }
}
