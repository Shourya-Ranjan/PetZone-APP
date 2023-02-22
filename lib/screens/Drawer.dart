// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_sam/Controller.dart';
import 'package:flutter_sam/screens/AboutUsPage.dart';
import 'package:flutter_sam/screens/ProfilePage.dart';
import 'package:flutter_sam/screens/Notifications.dart';
import 'package:flutter_sam/screens/AlertDialogBox.dart';

class DrawerOnly extends StatefulWidget {
  const DrawerOnly({super.key});

  @override
  State<DrawerOnly> createState() => _DrawerOnlyState();
}

class _DrawerOnlyState extends State<DrawerOnly> {
  String title = 'AlertDialog';
  bool tappedYes = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Shourya Ranjan'),
            accountEmail: Text('shouryaranjan54@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black26,
              child: ImageIcon(AssetImage('assets/images/fish-food.png')),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/fish-food.png')),
              CircleAvatar(
                  foregroundImage: AssetImage('assets/images/fish-food.png'))
            ],
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.account_box_outlined),
            title: const Text('My Account'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_outlined),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: unnecessary_new
                      builder: (context) => const NotificationsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer_outlined),
            title: const Text('Offers'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support_outlined),
            title: const Text('FAQs'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.perm_contact_cal_outlined),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.import_contacts_outlined),
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.perm_contact_cal_outlined),
            title: const Text('Toggle Dark Mode'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () async {
              final action = await AlertDialogs.yesCancelDialog(
                  context, 'Logout', 'Really?');
              if (action == DialogsAction.yes) {
                setState(() => tappedYes = true);
              } else {
                setState(() => tappedYes = false);
              }
            },
          ),
        ],
      ),
    );
  }
}
