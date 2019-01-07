import 'package:flutter/material.dart';
import 'package:flutter_login_json/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                      labelText: 'Username'
                    ),
                  ),
                ),),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password'
                        ),
                      ),
                    ),),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(onPressed:(){
                      login(username.text, password.text);
                    },
                    child: Text("Login",style: TextStyle(color: Colors.white)),
                    color: Colors.blue,)
                  ),
                ),


          ],

      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }

  void login(String username,String password) async
  {
    String url = 'https://reqres.in/api/login';
    var response = await http.post(url,body: {'email':username,'password':password});
    print('Respone ${response.statusCode}');
    if(response.statusCode == 200)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>home()));
      }

  }
}
