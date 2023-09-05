import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_courses/screens/log_in.dart';

import 'home.dart';

class SignUp extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;

    return Scaffold(
      backgroundColor: Color(0xff046edb),
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 150,),
          Text(
            'Let\'s learn!',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),

          SizedBox(height: 100,),
          Container(
            height: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        color: Color(0xff046edb),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              prefixIcon:
                                  Icon(Icons.drive_file_rename_outline),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(50.0)),
                              labelText: 'Enter your name'),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextFormField(
                          onChanged: (value) => _email = value,
                          validator: (value) => value!.isEmpty
                              ? 'Enter a Valid Email'
                              : null,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email_outlined),
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(50.0)),
                              labelText: 'Email'),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextFormField(

                          onChanged: (value) => _password = value,
                          validator: (value) => value!.length < 6
                              ? 'Your password must be larger than 6 characters'
                              : null,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon:
                                  Icon(Icons.remove_red_eye_outlined),
                              prefixIcon: Icon(Icons.password_outlined),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(50.0)),
                              labelText: 'Password'),
                          keyboardType: TextInputType.number,
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextFormField(
                          onChanged: (value) => _password = value,
                          validator: (value) => value!.length < 6
                              ? 'Your password must be larger than 6 characters'
                              : null,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(50.0)),
                              labelText: 'Conferm Password'),
                          keyboardType: TextInputType.number,
                        )),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xff046edb),
                            borderRadius: BorderRadius.circular(50.0)),

                        child: MaterialButton(

                            child: Text('Sign Up',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                              }
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
                            child: Text('Log in'))
                      ],
                    ),
                  ],
                ),


              ),
            ),
          ),
        ],
        ),
      ),

    );
  }
}
