import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/sizer/size.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Pattern.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Image.asset('assets/images/Logo.png'),
                )),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(20)),
              child: const Text(
                'Login To Your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenHeight(20),
                  getProportionateScreenHeight(15),
                  getProportionateScreenHeight(20),
                  0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenHeight(20),
                  getProportionateScreenHeight(15),
                  getProportionateScreenHeight(20),
                  0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenHeight(20),
                  getProportionateScreenHeight(25),
                  getProportionateScreenHeight(20),
                  0),
              child: const Text(
                'Or Continue With',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                    primary: Colors.deepPurpleAccent,
                    shape: StadiumBorder(),
                  ),
                  child: const Text(
                    'Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                    primary: Colors.deepPurpleAccent,
                    shape: StadiumBorder(),
                  ),
                  child: const Text(
                    'Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
