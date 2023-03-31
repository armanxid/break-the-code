import 'package:breakthecode/pages/WebViewPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/img/arman2.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              "Muhammad Nur Armana",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Competitions Joined"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("10")
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text("Competitions Winner"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("3")
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewPage(
                                value: "https://github.com/armanxid",
                                title: "Profile Arman",
                              )));
                },
                child: Text('Github Profile'))
          ],
        ),
      ),
    );
  }
}
