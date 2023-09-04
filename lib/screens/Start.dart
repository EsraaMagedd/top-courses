import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LogIn.dart';
import 'SignUp.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Let\'s learn!',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/welcome.jpg'),
            ),
            Spacer(),
            Container(
              height: 300,
              width: 420,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: Text('                Sign In                ',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,

                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                    ),

                      elevation: 10,
                      shadowColor: Colors.black,
                  ),

                  ),
                  SizedBox(height: 10),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    },
                    child: Text('Create an account',style:
                    TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  )

                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
