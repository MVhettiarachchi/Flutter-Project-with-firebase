import 'package:dgmentor_mujer_user/screen/add_user_main_page.dart';
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

  String _email = '';
  String _password = '';
  String error = '';
  @override
  void initState() {
    super.initState();
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
                    ),
                  ),
                ),
                Container(
                  height: height * 6 / 10,
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
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
                                  color: Colors.tealAccent[700],
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
                                ? 'Please Enter a valied user name'
                                : null,
                            onSaved: (input) => _email = input.trim(),
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
                                  color: Colors.tealAccent[700],
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
                            //onSaved: (input) => _password = input.trim(),

                            onSaved: (input) => _password = input.trim(),
                            // onFieldSubmitted: (password) async {
                            //   await onClick(_email.toString(), _password.toString());
                            // },
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Container(
                          height: 50.0,
                          width: 200.0,
                          child: RaisedButton(
                            color: Colors.tealAccent[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            onPressed: () async {
                              try {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  await AuthService.login(
                                          context: context,
                                          email: _email,
                                          password: _password)
                                      .then((value) {
                                    if (value != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => AddUserScreen()));
                                    } else {
                                      setState(() => error =
                                          'Could not SIGN IN with those credential');
                                    }
                                  });
                                }
                              } catch (e) {
                                print(e);
                              }
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
                                'Create Account',
                                style: TextStyle(
                                  color: Colors.tealAccent[700],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegisterScreen()));
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
