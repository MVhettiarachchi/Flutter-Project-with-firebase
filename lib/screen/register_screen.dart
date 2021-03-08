import 'dart:io';

import 'package:dgmentor_mujer_user/screen/home_screen.dart';
import 'package:dgmentor_mujer_user/screen/login_screen.dart';
import 'package:dgmentor_mujer_user/services/auth_services.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _password = '';
  String _confirmPassword = '';
  //String _address = '';
  bool _isLoading = false;

 
  @override
  void initState() {
    super.initState();
  }


  _showDailog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Invalied"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showDailogLoadin(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(message),
          content: Container(
              width: 150.0,
              height: 80.0,
              child: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: width,
              // height: height,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.yellow[700],
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    // height: height * 6 / 10,
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    // color: Colors.blue,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "First Name",
                                fillColor: Colors.grey,
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 20.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please Enter a valied name'
                                  : null,
                              onSaved: (input) => _firstName = input.trim(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Last Name",
                                fillColor: Colors.grey,
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 20.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please Enter a valied name'
                                  : null,
                              onSaved: (input) => _lastName = input.trim(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  size: 20.0,
                                ),
                                labelText: "Phone",
                                fillColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please Enter a valied phone number'
                                  : null,
                              onSaved: (input) => _phone = input.trim(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  size: 20.0,
                                ),
                                labelText: "Email",
                                fillColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please Enter a valied email'
                                  : null,
                              onSaved: (input) => _email = input.trim(),
                              onChanged: (input) => _email = input.trim(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 20.0,
                                ),
                                labelText: "Password",
                                fillColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (input) => input.trim().isEmpty
                                  ? 'Please Enter a valied password'
                                  : null,
                              onSaved: (input) => _password = input.trim(),
                              onChanged: (input) => _password = input.trim(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 20.0,
                                ),
                                labelText: "Confirm Password",
                                fillColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red[200],
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (input) {
                                if (input.trim().isEmpty) {
                                  return 'Please Enter a valied password';
                                } else if (input.trim() != _password) {
                                  return 'Password not matched';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (input) =>
                                  _confirmPassword = input.trim(),
                              onChanged: (input) =>
                                  _confirmPassword = input.trim(),
                            ),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            height: 50.0,
                            width: 200.0,
                            child: RaisedButton(
                              color: Colors.yellow[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  _showDailogLoadin('Logging');
                                  _isLoading = true;

                                  AuthService.signUpUser(
                                    firstName: _firstName,
                                    lastName: _lastName,
                                    email: _email,
                                    password: _password,
                                    phone: _phone,
                                    //          address: _address,
                                  ).then((value) {
                                    _isLoading = false;
                                    Navigator.pop(context);
                                    if (value) {
                                      Navigator.pushReplacement(
                                          context,    
                                          MaterialPageRoute(
                                              builder: (_) => HomeScreen()));
                                    }
                                  });
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Have an account? ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Login.',
                                  style: TextStyle(
                                    color: Colors.yellow[700],
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => Navigator.pop(context),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
