import 'package:breakthecode/pages/AboutPage.dart';
import 'package:breakthecode/pages/HomeScreen.dart';
import 'package:breakthecode/pages/LoginScreen.dart';
import 'package:breakthecode/route/page_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 152, 241, 155)),
              accountName: Text(
                "Muhammad Nur Armana",
                style: TextStyle(color: Color.fromARGB(255, 0, 139, 5)),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/img/arman2.jpg"),
              ),
              accountEmail: Text(
                auth.currentUser!.email.toString(),
                style: TextStyle(color: Color.fromARGB(255, 0, 139, 5)),
              )),
          DrawerListTile(
            iconData: Icons.people,
            title: "About Me",
            onTilePressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          DrawerListTile(
            iconData: Icons.logout,
            title: "Sign Out",
            onTilePressed: () {
              _signOut().then((value) => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen())));
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile(
      {Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
