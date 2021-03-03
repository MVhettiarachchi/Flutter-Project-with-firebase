import 'package:dgmentor_mujer_user/model/contact_model.dart';
import 'package:dgmentor_mujer_user/services/firebase_services.dart';
import 'package:flutter/material.dart';


class AddUserDetailsScreen extends StatefulWidget {
  @override
  _AddUserDetailsScreenState createState() => _AddUserDetailsScreenState();
}

class _AddUserDetailsScreenState extends State<AddUserDetailsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String _firstName = '';
  String _lastName = '';

  String _phone = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('DgmentorMujer')),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add details',
                style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Container(
                child: TextFormField(
                  controller: firstNameController,
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
                  // validator: (input) => input.trim().isEmpty
                  //     ? 'Please Enter a valied name'
                  //     : null,
                  // onSaved: (input) => _firstName = input.trim(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextFormField(
                  controller: lastNameController,
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
                  // validator: (input) => input.trim().isEmpty
                  //     ? 'Please Enter a valied name'
                  //     : null,
                  // onSaved: (input) => _lastName = input.trim(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextFormField(
                  controller: phoneController,
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
                  // validator: (input) => input.trim().isEmpty
                  //     ? 'Please Enter a valied phone number'
                  //     : null,
                  // onSaved: (input) => _phone = input.trim(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_pin,
                      size: 20.0,
                    ),
                    labelText: "Address",
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
                  // validator: (input) => input.trim().isEmpty
                  //     ? 'Please Enter a valied phone number'
                  //     : null,
                  // onSaved: (input) => _phone = input.trim(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50.0,
                width: 200.0,
                child: RaisedButton(
                  color: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  onPressed: () {
                    if (firstNameController.text.trim() != '' &&
                        lastNameController.text.trim() != '' &&
                        phoneController.text.trim() != '' &&
                        addressController.text.trim() != '') {
                      ContactModel createdRelativesdetails = ContactModel(
                        firstname: firstNameController.text.trim(),
                        lastname: lastNameController.text.trim(),
                        phone: phoneController.text.trim(),
                        address: addressController.text.trim(),
                      );
                      FirebaseService.createRlativesDetails(
                          createdRelativesdetails);
                      Navigator.pop(context, createdRelativesdetails);
                    }
                  },
                  child: Text(
                    'Add',
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
            ],
          ),
        ),
      )),
      // drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Drawer Header'),
      //         decoration: BoxDecoration(
      //           color: Colors.yellow[700],
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Contacts'),
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (_) => AddUserScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Item 2'),
      //         onTap: () {
      //           // Update the state of the app 
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
