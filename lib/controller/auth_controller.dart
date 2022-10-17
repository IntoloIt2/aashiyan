// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:aashiyan/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/contants.dart';
import '../const.dart';
import '../view/homepage.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController verify_codeController = TextEditingController();

late bool isLogged = false;

SharedPreferences emailPreferences = emailController as SharedPreferences;
SharedPreferences passwordPreferences = passwordController as SharedPreferences;

@override
void dispose() {
  // Clean up the controller when the widget is disposed.
  emailController.dispose();
  passwordController.dispose();
  verify_codeController.dispose();
}

var name;
var password;
var res;
var verification_res;
var loginres;

Future<void> registeration(String Email, String Password, context) async {
  var map = new Map<String, dynamic>();
  map['email'] = Email;
  map['password'] = Password;
  print(map);

  final response = await http.post(
    Uri.parse('http://192.168.0.99:8080/sdplserver/api/registration'),
    //verify-email/userid
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(map),
  );

  res = jsonDecode(response.body);

  if (res['status'] == 200) {
    user_id = res['user_id'];

    showDialog(context: context, builder: verificationDialog);
  } else {
    showDialog(
        context: context,
        builder: (context) => acknoledgmentDialog(context, '${res['msg']}'));
  }
}

Future<void> verification(String Verify_code, context, int id) async {
  var map = Map<String, dynamic>();

  map['verify_code'] = Verify_code;
  map['user_id'] = id;

  print(jsonEncode(map));
  final response = await http.post(
    Uri.parse('http://192.168.0.99:8080/sdplserver/api/verify-email/ $user_id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(map),
  );

  verification_res = jsonDecode(response.body);
  print(verification_res);

  if (verification_res['status'] == 200) {
    showDialog(context: context, builder: loginDialog);
  } else {
    showDialog(
        context: context,
        builder: (context) =>
            acknoledgmentDialog(context, '${verification_res['msg']}'));
  }
}



Future<void> login(String Email, String Password, context) async {
  var map = Map<String, dynamic>();

  map['email'] = emailController.text;
  map['password'] = passwordController.text;

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('loginDetails', map.toString());
  prefs.setString('email', Email);
  prefs.setString('password', Password);
  prefs.setString('user_id', user_id).toString();

  final response = await http.post(
    Uri.parse('http://192.168.0.99:8080/sdplserver/api/login'),

    //verify-email/userid     |     http://sdplweb.com/sdpl/api/login

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(map),
  );

  loginres = jsonDecode(response.body);
  user_id = loginres['data']['id'].toString();
  print(user_id);

  if (loginres['status'] == 200 && user_id != null) {
    isLogged = true;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  } else {
    showDialog(
        context: context,
        builder: (context) =>
            acknoledgmentDialog(context, '${(loginres['msg'])}'));
  }
  print(loginres);
}

Future<Null> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('loginDetails');

  email = '';
  password = '';
  isLogged = false;
}

AlertDialog registerDialog(BuildContext context) {
  return AlertDialog(
    title: Column(
      children: const [
        // Text('data'),
        Padding(
          padding: EdgeInsets.all(11.0),
          child: Text(
            'Register',
            style: TextStyle(
                color: Color.fromARGB(255, 183, 92, 1),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
      ],
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                child: const Text(
                  'REGISTER',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  registeration(
                      emailController.text, passwordController.text, context);
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Already have an account?'),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                showDialog(context: context, builder: loginDialog);
              },
              child: const Text('Login',
                  style: TextStyle(color: Colors.black, fontSize: 16)))
        ],
      ),
    ),
  );
}

void postData() {}

AlertDialog loginDialog(BuildContext context) {
  return AlertDialog(
    title: const Center(
        child: Text(
      'Login',
      style: TextStyle(
          color: Color.fromARGB(255, 183, 92, 1),
          fontWeight: FontWeight.bold,
          fontSize: 25),
    )),
    content: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          TextButton(
            child: const Text('Forget Password',
                style: TextStyle(color: Colors.black, fontSize: 16)),
            onPressed: () {},
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(8)),
            child: TextButton(
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                login(emailController.text, passwordController.text, context);
                emailController.clear();
                passwordController.clear();
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Don\'t have an account'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(context: context, builder: registerDialog);
              },
              child: const Text('Register',
                  style: TextStyle(color: Colors.black, fontSize: 16)))
        ],
      ),
    ),
  );
}

void verifyUser() {}

AlertDialog verificationDialog(BuildContext context) {
  return AlertDialog(
    title: Center(
        child: Text(
      'Please enter OTP from your mail id - \n ${(emailController.text)}',
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
    )),
    content: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: verify_codeController,
            decoration: const InputDecoration(hintText: 'Enter OTP'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(8)),
            child: TextButton(
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                verification(verify_codeController.text, context, user_id);
              },
            ),
          ),
        ],
      ),
    ),
  );
}

AlertDialog acknoledgmentDialog(BuildContext context, String str) {
  return AlertDialog(
    title: Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        str,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
    content: Container(
      width: 50,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(8)),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'okay',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ),
  );
}
