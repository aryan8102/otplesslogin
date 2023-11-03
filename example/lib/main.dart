import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:otpless_flutter/otpless_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void showDialog(){
    AlertDialog();
  }
  String _dataResponse = 'Unknown';
  final _otplessFlutterPlugin = Otpless();
  final TextEditingController urlTextContoller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _otplessFlutterPlugin.hideFabButton();
  }

  // ** Function that is called when page is loaded
  // ** We can check the auth state in this function
  Future<bool> startOtpless() async {
    AlertDialog(content:Text("token is null"));
    bool check = false;
    _otplessFlutterPlugin.start((result) {
      var message = "";
      if (result['data'] != null) {
        final token = result['data']['token'];
        message = "token: $token";
        AlertDialog(content:Text("token is $message"));
      }
      setState(() {
        _dataResponse = message ?? "e2m";
      });
      if (result['data'] != null) {
        check = true;

      }

    });
    if (check == false){
      return false;
    }else{
      return true;
    }
  }



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    urlTextContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('E2m otpless login'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 10,
                              )
                          ),
                          labelText: 'Enter your Name',
                          hintText: 'Type something',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 10,
                              )
                          ),
                          labelText: 'Enter your mail',
                          hintText: 'Type something',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 10,
                              )
                          ),
                          labelText: 'Enter your Adress',
                          hintText: 'Type something',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  CupertinoButton.filled(
                      child: Text("Login With Whatsapp"),
                      // onPressed: (startOtpless == true)?showDialog():showDialog(),
                    onPressed: ()async{
                        // startOtpless
                        if (await startOtpless()==true){
                          AlertDialog(
                            content:Text("The token is ${_dataResponse}"),
                          );
                        }
                        else{
                          AlertDialog(content:Text("No response"));
                        }

                    },
                  ),



                  Text(""),
                  SizedBox(height: 100),
                  SizedBox(height: 10),
                  Text(_dataResponse)
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
