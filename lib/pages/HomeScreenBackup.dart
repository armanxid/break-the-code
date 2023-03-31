import 'package:breakthecode/controller/appcontroller.dart';
import 'package:breakthecode/pages/LoginScreen.dart';
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

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
      print(controller.getPosts.length);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              // SizedBox(height: 37),
              Text.rich(
                TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Welcome, \n",
                      style: TextStyle(color: Colors.blue[300])),
                  TextSpan(
                      text: auth.currentUser!.email,
                      style: TextStyle(color: Colors.blue[900]))
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Search..."),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Reccomendations Place",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    _signOut().then((value) => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen())));
                  },
                  child: Text("Log Out"),
                ),
              ),
              // Expanded(child: Obx(() {
              //   print(controller.getPosts[2].name);
              //   return controller.postLoading.value
              //       ? Center(
              //           child: CircularProgressIndicator(),
              //         )
              //       : ListView.builder(
              //           itemCount: controller.getPosts.length,
              //           itemBuilder: (context, index) {
              //             var item = controller.getPosts[index];
              //             return Text(data);
              //             // return Card(
              //             //   child: ListTile(
              //             //     title: Text(item.name),
              //             //     subtitle: Text(item.site),
              //             //     leading: Text(item.status),
              //             //   ),
              //             // );
              //           });
              // }))
              //     // GridView.count(
              //     //     crossAxisCount: 2,
              //     //     children:
              //     //         List.generate(controller.getPosts.length, (index) {
              //     //       var item = controller.getPosts[index];
              //     //       return Card(
              //     //         child: Column(
              //     //           children: <Widget>[
              //     //             Text(item.name),
              //     //             Text(item.site),
              //     //             Text(item.status)
              //     //           ],
              //     //         ),
              //     //       );
              //     //     }),
              //     //   );
              //   }),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
              // backgroundColor: Colors.purple,
            ),
          ]),
    );
  }
}
