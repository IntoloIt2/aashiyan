// import 'dart:convert';
// import 'dart:ffi';

// import 'package:aashiyan/controller/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../components/contants.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import '../../view/homepage.dart';
// import '../../const.dart';

// class Auth_Provider with ChangeNotifier {
//   bool isLogged = false;
//   var res;
//   var verification_res;
//   var loginres;

//   TextEditingController verify_codeController = TextEditingController();
//   // TextEditingController passwordController = TextEditingController();

//   Future<void> registeration(String Email, String Password, context) async {
//     print("map");
//     var map = new Map<String, dynamic>();
//     map['email'] = Email;
//     map['password'] = Password;
//     // print(map);
//     final response = await http.post(
//       Uri.parse('http://192.168.0.99:8080/sdplserver/api/registration'),
//       //verify-email/userid
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(map),
//     );

//     res = jsonDecode(response.body);
//     // print(res);

//     if (res['status'] == 200) {
//       user_id = res['user_id'];
//       // print("st 200");
//       // showDialog(context: context, builder: verificationDialog(Email, password,context));

//       showDialog(
//           builder: (context) => verificationDialog(email, password, context),
//           context: (context));
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => verificationDialog(Email, Password, context),
//       //   ),
//       // );

//       // verificationDialog(Email, context);
//     } else {
//       showDialog(
//           context: context,
//           builder: (context) => acknoledgmentDialog(context, '${res['msg']}'));
//     }
//     notifyListeners();
//   }

//   Future<void> verification(
//       email, password, String Verify_code, context, int id) async {
//     var map = Map<String, dynamic>();

//     map['verify_code'] = Verify_code;
//     map['user_id'] = id;

//     print(jsonEncode(map));
//     final response = await http.post(
//       Uri.parse(
//           'http://192.168.0.99:8080/sdplserver/api/verify-email/ $user_id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(map),
//     );

//     verification_res = jsonDecode(response.body);
//     // print(verification_res);

//     if (verification_res['status'] == 200) {
//       // isLogged = true;
//       // showDialog(context: context, builder: loginDialog);
//       showDialog(
//           builder: (context) => loginDialog(email, password, context),
//           context: (context));
//       // if (!isLogged) {
//       //   Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //       builder: (context) => loginDialog(email, password, context),
//       //     ),
//       //   );
//       // }

//       // Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //       builder: (context) => Residential(),
//       //     ));

//     } else {
//       showDialog(
//           context: context,
//           builder: (context) =>
//               acknoledgmentDialog(context, '${verification_res['msg']}'));
//     }
//     notifyListeners();
//   }

//   Future<void> login(String Email, String Password, context) async {
//     var map = new Map<String, dynamic>();
//     map['email'] = Email;
//     map['password'] = Password;
//     // print(map);
//     final response = await http.post(
//       Uri.parse('http://192.168.0.99:8080/sdplserver/api/login'),

//       //verify-email/userid     |     http://sdplweb.com/sdpl/api/login

//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(map),
//     );

//     loginres = jsonDecode(response.body);
//     // print(loginres);

//     if (loginres['status'] == 200) {
//       isLogged = true;
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(),
//           ));
//     } else {
//       showDialog(
//           context: context,
//           builder: (context) =>
//               acknoledgmentDialog(context, '${(loginres['msg'])}'));
//     }
//     notifyListeners();
//   }

//   String emailUpdate(email, value) {
//     email = value;
//     notifyListeners();
//     return email;
//   }

//   void passwordUpdate(password, value) {
//     password = value;
//     notifyListeners();
//     return password;
//   }

//   AlertDialog loginDialog(String email, String password, BuildContext context) {
//     return AlertDialog(
//       title: const Center(
//           child: Text(
//         'Login',
//         style: TextStyle(
//             color: Color.fromARGB(255, 183, 92, 1),
//             fontWeight: FontWeight.bold,
//             fontSize: 25),
//       )),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextFormField(
//               // controller: email,
//               onChanged: (value) {
//                 email = value;
//                 // emailUpdate(email, value);
//                 // notifyListeners();
//                 // print(email);
//               },
//               decoration: const InputDecoration(hintText: 'Email'),
//             ),
//             TextFormField(
//               // controller: passwordController,
//               onChanged: (value) {
//                 password = value;
//                 // passwordUpdate(password, value);
//                 // notifyListeners();

//                 // setState(() {

//                 // });
//                 // password = value;
//                 // int get password => value;
//                 // print(password);
//               },
//               obscureText: true,
//               decoration: const InputDecoration(
//                 hintText: 'Password',
//               ),
//             ),
//             TextButton(
//               child: const Text('Forget Password',
//                   style: TextStyle(color: Colors.black, fontSize: 16)),
//               onPressed: () {},
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: primaryColor, borderRadius: BorderRadius.circular(8)),
//               child: TextButton(
//                 child: const Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 onPressed: () {
//                   // Navigator.of(context, rootNavigator: true).pop();
//                   // print("email=");
//                   // print(email);
//                   // print("pass--");
//                   // print(password);
//                   login(email, password, context);
//                   // email.clear;
//                   // password;
//                 },
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text('Don\'t have an account'),
//             ),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   AuthController(context);
//                 },
//                 // {
//                 // Get.to(() => AuthController());
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => AuthController(),
//                 //   ),
//                 // );
//                 // showDialog(
//                 //     context: context, builder: AuthController(context));
//                 // Navigator.of(context).push(MaterialPageRoute(
//                 //   builder: (context) => AuthController(),
//                 // ));
//                 // },
//                 child: const Text('Register',
//                     style: TextStyle(color: Colors.black, fontSize: 16)))
//           ],
//         ),
//       ),
//     );
//   }

//   AlertDialog verificationDialog(email, Password, BuildContext context) {
//     return AlertDialog(
//       title: Center(
//           child: Text(
//         'Please enter OTP from your mail id - \n ${(email)}',
//         style: TextStyle(
//             color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
//       )),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextFormField(
//               controller: verify_codeController,
//               decoration: const InputDecoration(hintText: 'Enter OTP'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: primaryColor, borderRadius: BorderRadius.circular(8)),
//               child: TextButton(
//                 child: const Text(
//                   'Verify',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 onPressed: () {
//                   verification(email, Password, verify_codeController.text,
//                       context, user_id);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   AlertDialog acknoledgmentDialog(BuildContext context, String str) {
//     return AlertDialog(
//       title: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Text(
//           str,
//           style: TextStyle(
//               color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//       ),
//       content: Container(
//         width: 50,
//         decoration: BoxDecoration(
//             color: primaryColor, borderRadius: BorderRadius.circular(8)),
//         child: TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text(
//             'okay',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }
