import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_up.dart';
import 'home.dart';

class Login extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    return SafeArea(
      child: Material(
        child: Scaffold(
          backgroundColor: Color(0xff046edb),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80,),
              Text(
                'Let\'s learn!',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 80,),
              Container(
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),

                child: Form(
                  key: _formkey,
                    child: Container(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40,),
                          Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700,
                              color: Color(0xff046edb),),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: TextFormField(
                                onChanged: (value) => _email = value,
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter a Valid Email' : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                    suffixIcon: Icon(Icons.email_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50.0)),
                                    labelText: 'Email'),
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: TextFormField(
                                onChanged: (value) => _password = value,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password_outlined),
                                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50.0)),
                                    labelText: 'Password'),
                                keyboardType: TextInputType.number,
                              )),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(0xff046edb),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: MaterialButton(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Home(),
                                          ));
                                    }
                                    ;
                                  }),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              SizedBox(
                                width: 10.0,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUp(),
                                        ));
                                  },
                                  child: Text('Sign Up'))
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
      ),
    );
  }
}
