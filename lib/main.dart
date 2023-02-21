// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_sam/Controller.dart';

void main() => runApp(Application());

// ignore: use_key_in_widget_constructors
class Application extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Controller();
  }
}
