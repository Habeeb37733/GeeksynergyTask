import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'datas.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List<String> items = ['BTECH', 'BCA', 'IT'];
  String? selectedItem = 'BTECH';
  String? name;
  String? email;
  String? password;
  String? phonenum;
  bool valueBool = false;
  var formKey = GlobalKey<FormState>();

  // var formKey1 = GlobalKey<FormState>();
  var sharedPreference;
  var mycontroller =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);
  int? pageIndex;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => sharedPreference = value);
  }

  @override
  void dispose() {
    sharedPreference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: mycontroller,
                    onPageChanged: (index) {
                      pageIndex = index;
                    },
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 40, right: 40.0, left: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "REGISTER",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      onSaved: (saved) {
                                        name = saved;
                                      },
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "E-mail",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                        alignLabelWithHint: true,
                                      ),
                                      onSaved: (saved) {
                                        email = saved;
                                      },
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                        alignLabelWithHint: true,
                                      ),
                                      onSaved: (saved) {
                                        password = saved;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Profession",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        DropdownButton<String?>(
                                          value: selectedItem,
                                          items: items.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedItem = newValue!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "Myphonenum",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                        alignLabelWithHint: true,
                                      ),
                                      onSaved: (saved) {
                                        phonenum = saved!;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: valueBool,
                                    onChanged: (saved) {
                                      setState(() {
                                        valueBool = saved!;
                                      });
                                    },
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "I agree to the ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Terms of Service ",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 50.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      mycontroller.animateToPage(
                                        pageIndex = 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear,
                                      );
                                      add();
                                      show();
                                    },
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade800,
                                      fixedSize: Size(80.0, 80.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  mycontroller.animateToPage(
                                    pageIndex = 1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  );
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 10),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'Email'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) => email = value,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Password'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) => password = value,
                                      obscureText: false,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () async {
                                      show();
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState?.save();
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        final savedEmail =
                                        prefs.getString('MyEmail');
                                        final savedPassword =
                                        prefs.getString('MyPassword');
                                        if (email == savedEmail &&
                                            password == savedPassword) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ComingDatas(
                                                    name: name,
                                                    email: email,
                                                    password: password,
                                                  ),
                                            ),
                                          );
                                        }
                                        else {
                                          print("invalid user/password");
                                          final snackBar = SnackBar(
                                              content: Text(
                                                  'Invalid username /password'));

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    },
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade800,
                                      fixedSize: Size(80.0, 80.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  mycontroller.animateToPage(
                                    pageIndex = 0,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  );
                                  delete();
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void add() async {
    formKey.currentState!.save();
    await (sharedPreference as SharedPreferences).setString('MyName', name!);
    await (sharedPreference as SharedPreferences).setString('MyEmail', email!);
    await (sharedPreference as SharedPreferences)
        .setString('MyPassword', password!);
    await (sharedPreference as SharedPreferences)
        .setString('Myphonenum', phonenum!);
    await (sharedPreference as SharedPreferences)
        .setString('selectedItem', selectedItem!);
  }

  void show() {
    print(
      "Name :" +
          (sharedPreference as SharedPreferences)
              .getString('MyName')
              .toString(),
    );

    print(
      "Email :" +
          (sharedPreference as SharedPreferences)
              .getString('MyEmail')
              .toString(),
    );

    print(
      "Password :" +
          (sharedPreference as SharedPreferences)
              .getString('MyPassword')
              .toString(),
    );
    print(
      "Phone number:" +
          (sharedPreference as SharedPreferences)
              .getString('Myphonenum')
              .toString(),
    );
    print(
      "profession :" +
          (sharedPreference as SharedPreferences)
              .getString('selectedItem')
              .toString(),
    );
  }

  void delete() {
    (sharedPreference as SharedPreferences).remove('MyName');
    (sharedPreference as SharedPreferences).remove('MyEmail');
    (sharedPreference as SharedPreferences).remove('MyPassword');
    (sharedPreference as SharedPreferences).remove('selectedItem');
    (sharedPreference as SharedPreferences).remove('Myphonenum');
  }
}
