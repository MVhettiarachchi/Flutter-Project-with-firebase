import 'package:dgmentor_mujer_user/screen/home_screen.dart';
import 'package:dgmentor_mujer_user/screen/register_screen.dart';
import 'package:dgmentor_mujer_user/services/auth_services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> loginUser() async {
   
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        try {
          if (_formKey.currentState.validate()) {
            _showDailogLoadin('Loging');
            _formKey.currentState.save();
            await AuthService.login(email: _username, password: _password).then((value) {
              Navigator.pop(context);
              if (value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => HomeScreen(
                              //isNewLogin: true,
                            )));
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Somethig wen wrong. Please try again.'),
                  ),
                );
              }
            });
          }
        } catch (error) {
          Navigator.pop(context);
      
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message),
            ),
          );
        }
      }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('No Internet'),
  //       ),
  //     );
  //   }
  }

  _showDailogLoadin(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(message),
          content: Container(width: 150.0, height: 80.0, child: Center(child: CircularProgressIndicator())),
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
      body: SingleChildScrollView(
        child: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                Container(
                  height: height * 4 / 10,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: height / 10),
                      height: height / 5,
                      child: Image(image: AssetImage('assets/images/dg_mentor.png')),
                    ),
                  ),
                ),
                Container(
                  height: height * 6 / 10,
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  // color: Colors.blue,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 1 / 10,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              fillColor: Colors.grey,
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
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
                            validator: (input) => input.trim().isEmpty ? 'Please Enter a valied user name' : null,
                            onSaved: (input) => _username = input.trim(),
                          ),
                        ),
                        SizedBox(
                          height: height * 1 / 30,
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
                                  color: Colors.blue,
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
                            validator: (input) => input.trim().isEmpty ? 'Please Enter a valied password' : null,
                            onSaved: (input) => _password = input.trim(),
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Container(
                          height: 50.0,
                          width: 200.0,
                          child: RaisedButton(
                            color: Colors.blue[900],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                            onPressed: () {
                              loginUser();
                            },
                            child: Text(
                              'Login',
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
                                'New User? ',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Register.',
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}