import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LogIn.dart';
import 'SignUp.dart';

class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
               Container(
                 width: 2500,
                 height: 400,
                 child: Image(image:AssetImage('images/logo.png',)
                 ),
               ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50.0)),
                  child: MaterialButton(
                      child: Text('Login',style: TextStyle(fontSize: 30.0,color: Colors.white)),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50.0)),
                  child: MaterialButton(
                      child: Text('Sign Up',style: TextStyle(fontSize: 30.0,color: Colors.white),),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      }
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}