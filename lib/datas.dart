import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'companyinfo.dart';

class ComingDatas extends StatefulWidget {
  String? name;
  String? email;
  String? password;
  ComingDatas({this.name, this.email, this.password});
  @override
  State<StatefulWidget> createState() {
    return ComingDatasState(name: name, email: email, password: password);
  }
}

class ComingDatasState extends State<ComingDatas> {
  String? name;
  String? email;
  String? password;
  ComingDatasState({this.name, this.email, this.password});

   postdata() async{
    try {
      var response = await http
          .post(Uri.parse('https://hoblist.com/api/movieList'), body: {
        "id": 1.toString(),
        "Name": "Kantara",
        "Category": "Movies",
        "Language": "Kannada",
        "Genre": "All",
        "Sort": "Voting",
      });
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
    try{
      var response2 =await http.post(
          Uri.parse('https://hoblist.com/api/movieList'),
          body: {
            "id":1.toString(),
            "Name":"KGF",
            "Category":"Movies",
            "Language" : "Kannada",
            "Genre" : "All",
            "Sort" : "Voting",
          }

      );
      print(response2.body);
      print(response2.statusCode);
    }catch(e){
      print(e);
    }
    try{
      var response3 =await http.post(
          Uri.parse('https://hoblist.com/api/movieList'),
          body: {
            "id":1.toString(),
            "Name":"KGF",
            "Category":"Movies",
            "Language" : "Kannada",
            "Genre" : "All",
            "Sort" : "Voting",
          }

      );
      print(response3.body);
      print(response3.statusCode);
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            title: Text("Company Info",
            style: TextStyle(fontWeight: FontWeight.w700,),),
            onTap: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const cmpnyinfo()),
            ),
          ),
        ]),
      ),
      body: ListView(
    children: [
      Card(
        child: ListTile(
          title: Text("Kantara"),
          subtitle: Padding(
            padding: const EdgeInsets.only(right: 160),
            child: Column(
              children: [
                Row(
                  children: [Text("Category:"),
                    Text("Movies"),],
                ),
                Row(
                  children: [Text("Language:"),
                    Text("Kannada"),],
                ),
                Row(
                  children: [Text("Genre:"),
                    Text("All"),],
                ),
                Row(
                  children: [Text("Sort:"),
                    Text("Voting"),],
                ),

                Container(
                  width:300,
                  child: ElevatedButton(onPressed: (){},
                      child:Text("Watch Trailer")),
                ),
              ],

            ),
          ),
          leading: Container(
            //  width: 100,
              child:

          Image(image: AssetImage("assets/images/movie3.jpg"),)),

        ),
      ),

      Card(
        child: ListTile(
          title: Text("KGF"),
          subtitle: Padding(
            padding: const EdgeInsets.only(right: 160),
            child: Column(
              children: [
                Row(
                  children: [Text("Category:"),
                    Text("Movies"),],
                ),
                Row(
                  children: [Text("Language:"),
                    Text("Kannada"),],
                ),
                Row(
                  children: [Text("Genre:"),
                    Text("All"),


                  ],
                ),
                Row(
                  children: [Text("Sort:"),
                    Text("Voting"),],
                ),

                Container(
                  width:300,
                  child: ElevatedButton(onPressed: (){},
                      child:Text("Watch Trailer")),
                ),
              ],
            ),
          ),
          leading: Container(
              width: 55,
              child:

              Image(image: AssetImage("assets/images/movie22.jpg"),)),

        ),
      ),
      Card(
        child: ListTile(
          title: Text("Maya"),
          subtitle: Padding(
            padding: const EdgeInsets.only(right: 160),
            child: Column(
              children: [
                Row(
                  children: [Text("Category:"),
                    Text("Movies"),],
                ),
                Row(
                  children: [Text("Language:"),
                    Text("Kannada"),],
                ),
                Row(
                  children: [Text("Genre:"),
                    Text("All"),


                  ],

                ),
                Row(
                  children: [Text("Sort:"),
                    Text("Voting"),],
                ),

                Container(
                  width:300,
                  child: ElevatedButton(onPressed: (){},
                      child:Text("Watch Trailer")),
                ),
              ],
            ),
          ),
          leading: Container(
             width: 55,
              child:

              Image(image: AssetImage("assets/images/movie4.jpg"),)),

        ),
      ),

ElevatedButton(onPressed: postdata, child: Text("Send Data"))
    ],
    ),


                     //  child: Image(image: AssetImage("assets/images/movie3.jpg",


      
    );
  }
}