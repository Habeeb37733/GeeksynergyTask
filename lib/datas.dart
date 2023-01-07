import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';



import 'companyinfo.dart';


class ComingDatas extends StatefulWidget {
  String? name;
  String? email;
  String? password;
  ComingDatas({this.name, this.email, this.password});
  final String title = "Movie List";
  @override
  State<StatefulWidget> createState() {
    return ComingDatasState(name: name, email: email, password: password);
  }
}
//String apiUrl = 'https://hoblist.com/api/movieList';
class ComingDatasState extends State<ComingDatas> {
  String? name;
  String? email;
  String? password;
  ComingDatasState({this.name, this.email, this.password});
  List? data;
  Future<Map<String, dynamic>> _fetchData() async {
    String  apiEndpoint= "https://hoblist.com/api/movieList";
    final Uri url = Uri.parse(apiEndpoint);

    Map<String, String> body = {
      'category': 'movies',
      'language': 'kannada',
      'genre': 'all',
      'sort': 'voting',
    };

    http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: body
    );





    if (response.statusCode == 200) {
      print(response.statusCode);
      //print(response.body);

       return json.decode(response.body);


    } else {

      throw Exception('Failed to fetch data');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      body:

      FutureBuilder<Map<String, dynamic>>(
        future: _fetchData(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {



           return ListView.builder(
             itemCount: snapshot.data!['result'].length,
               itemBuilder: (BuildContext context,i){
                 Map<String, dynamic> movie = snapshot.data!['result'][i];
               print(movie);
                 String mov=jsonEncode(movie);
                //print(movie);
                 int timestamp = int.parse(movie['releasedDate'].toString());
                 DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
                 String formattedDate = DateFormat.yMMMMd().format(date);
               return ListTile(
                 dense: false,
                leading: SizedBox(
                    height: double.infinity,
                    child: Image.network(movie['poster'].toString())),
                 title: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(movie['title'],style: TextStyle(
                       fontWeight: FontWeight.bold,
                     ),),
                   ],
                 ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Icon(
                          Icons.arrow_drop_up,
                          color: Colors.black,

                        ),
                    ),

                    Expanded(child: Text(movie['voting'].toString())),
                    Expanded(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,

                      ),
                    ),

                    Expanded(child: Text("voting",style: TextStyle(fontSize: 8),)),


                  ],
                ),
                 subtitle: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     RichText(
                       text: TextSpan(
                         style: DefaultTextStyle.of(context).style,
                         children: [
                           TextSpan(text: 'Genre: ', style: TextStyle(fontWeight: FontWeight.bold)),
                           TextSpan(text:movie['genre'] ),
                         ],
                       ),
                     ),
                     RichText(text: TextSpan(
                       style: DefaultTextStyle.of(context).style,
                       children: [
                         TextSpan(text: 'Director: ', style: TextStyle(fontWeight: FontWeight.bold)),
                         TextSpan(text:movie['director'].toString()  ),


                       ]
                     )),
                     RichText(text: TextSpan(
                       style: DefaultTextStyle.of(context).style,
                       children: [
                         TextSpan(text: 'Starring: ', style: TextStyle(fontWeight: FontWeight.bold)),
                         TextSpan(text:movie['stars'].toString()  ),

                       ],
                     )),
                     RichText(text: TextSpan(
                       style: DefaultTextStyle.of(context).style,
                       children: [
                         TextSpan(text:movie['runTime'].toString()  ),
                         TextSpan(text: ' | '),
                         TextSpan(text:movie['language'].toString()  ),
                         TextSpan(text: ' | '),
                         TextSpan(text:formattedDate.toString()  ),

                       ]
                     )),
                   SizedBox(
                       width: double.infinity,
                       child: ElevatedButton(onPressed: (){}, child: Text("Watch Trailer"))),
                   ],
                 ),


               );
               }
                );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}