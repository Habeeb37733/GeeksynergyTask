import 'package:flutter/material.dart';

class cmpnyinfo extends StatelessWidget {
  const cmpnyinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Company info"),),
      body:Padding(
        padding: const EdgeInsets.only(top: 200,left: 8),
        child: Column(

          children: [
            Row(
              children: [
                Text("Company:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                Text(" Geeksynergy Technologies Pvt Ltd",
                  style:TextStyle(
                    fontSize: 16,
                  )),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Address:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(" Sanjayanagar, Bengaluru-56",
                    style:TextStyle(
                      fontSize: 16,
                    )),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Phone:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(" XXXXXXXXX09",
                    style:TextStyle(
                      fontSize: 16,
                    )),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Email:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(" XXXXXX@gmail.com",
                    style:TextStyle(
                      fontSize: 16,
                    )),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
