import 'package:breakthecode/controller/appcontroller.dart';
import 'package:breakthecode/pages/LoginScreen.dart';
import 'package:breakthecode/pages/WebViewPage.dart';
import 'package:breakthecode/pages/layout/DrawerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    if (auth.currentUser != null) {}
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 152, 241, 155),
        title: Text(
          "Home",
          style: TextStyle(color: Color.fromARGB(255, 0, 139, 5)),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.extension),
                onPressed: () {},
              )
            ],
          ),
          Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Welcome, \n",
                  style: TextStyle(color: Color.fromARGB(255, 0, 139, 5))),
              TextSpan(
                  text: auth.currentUser!.email,
                  style: TextStyle(color: Color.fromARGB(255, 1, 85, 3)))
            ]),
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 18,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Search..."),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: Obx(() {
            return controller.postLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.getPosts.length,
                    itemBuilder: (context, index) {
                      var item = controller.getPosts[index];
                      return Card(
                        child: Container(
                          // margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewPage(
                                                value: item.url,
                                                title: item.site,
                                              )));
                                },
                                child: ListTile(
                                  title: Text(item.name),
                                  subtitle: Text(item.site),
                                  leading: Text(item.status),
                                  contentPadding: EdgeInsets.all(5.0),
                                ),
                              ),
                              // ListTile(
                              //   title: Text(item.name),
                              //   subtitle: Text(item.site),
                              //   leading: Text(item.status),
                              //   contentPadding: EdgeInsets.all(5.0),
                              // ),
                            ],
                          ),
                        ),
                      );
                    });
          }))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.blue,
          backgroundColor: Color.fromARGB(255, 152, 241, 155),
          selectedItemColor: Color.fromARGB(255, 0, 139, 5),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.search),
            //   label: 'Search',
            //   // backgroundColor: Colors.green,
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
              // backgroundColor: Colors.purple,
            ),
          ]),
    );
  }
}
