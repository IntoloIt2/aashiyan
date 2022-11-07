// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace

import 'dart:convert';

import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/controller/auth_controller.dart';
import 'package:aashiyan/view/residential/bunglow/builtup.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gson/gson.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './razorCredentials.dart' as razorCredintials;
import 'package:http/http.dart' as https;

import '../const.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = payDesFees;
  var gst = 0;
  var total = 0;
  var orderId;
  int totalMoney = 0;
  var InteriorCount;
  var specification;
  var amount = 0;

  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });

    super.initState();
  }

  showToast(msg, color) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.withOpacity(0.1),
      textColor: color,
    );
  }

  void launchRazorPay(String Id, var totalMoney) {
    setState(() {
      orderId = Id;
      amount = totalMoney;
    });

    var options = {
      'key': razorCredintials.keyId,
      // 'amount': totalMoney * 100, //in the smallest currency sub-unit.
      // 'amount': '${totalMoney}', //in the smallest currency sub-unit.
      'name': 'Aashiyan Pvt Ltd.',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Architects Design Company',
      'timeout': 300, // in seconds
      'prefill': {
        'contact': '9826293551',
        'email': 'anuragshrikhande9@gmail.com'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final key = utf8.encode(razorCredintials.keySecret);
    final bytes = utf8.encode('$orderId|${response.paymentId}');
    final hmacSha256 = Hmac(sha256, key);
    final Digest generatedSignature = hmacSha256.convert(bytes);

    if (generatedSignature.toString() == response.signature.toString()) {
      print("Payment was successful!");

      var body = {
        "user_id": user_id,
        "project_id": projectId,
        "transaction_id": response.paymentId.toString(),
        "specifications": specification,
        "amount": amount
      };

      var res = await https.post(Uri.parse("${dotenv.env['APP_URL']}/payment"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(body));

      var msg = "SUCCESS: " + response.paymentId.toString();
      showToast(msg, Colors.green);
    } else {
      print("The payment was unauthentic!");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("response.fail")),
    // );
    var msg = "ERROR: " + response.error!['reason'];
    showToast(msg, Colors.red);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("response.walletName"),
    //   ),
    // );
    var msg = "EXTERNAL_WALLET: " + response.walletName.toString();
    showToast(msg, Colors.green);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void createOrder() async {
    // RegExp regex = RegExp(r"([.]*)(?!.*\d)");
    RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
    int money = int.parse(total.toString());
    int tMoney = money * 100;
    String stringMoney = tMoney.toString().replaceAll(regex, '');

    totalMoney = int.parse(stringMoney);

    String username = razorCredintials.keyId;
    String password = razorCredintials.keySecret;

    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    Map<String, dynamic> body = {
      // "amount": totalMoney,
      "amount": 100,
      "currency": "INR",
      "receipt": "rcptid_11"
    };

    var res = await https.post(
      Uri.https("api.razorpay.com", "v1/orders"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "authorization": basicAuth,
      },
      body: jsonEncode(body),
    );
    if (res.statusCode == SUCCESS) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      InteriorCount = prefs.getString("InteriorDesignCount");
      projectId = prefs.getInt('projectId');
      String? userData = prefs.getString('userData');

      var decJson;
      if (userData != null) {
        decJson = jsonDecode(userData);
      }
      user_id = decJson['data']['id'];
      Gson gson = new Gson();
      specification = gson.decode(InteriorCount);

      launchRazorPay(jsonDecode(res.body)['id'], totalMoney);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Aashiyan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: requirementText(
                  'Note: If your project will not be under company\'s working rules then your fees will be refunded under 3 days. '),
            ),
            Column(
              children: [
                Container(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        requirementText('Total payable Advance'),
                        requirementText('$payDesFees'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        requirementText('GST 18%'),
                        requirementText('${gst = payDesFees * 18 ~/ 100}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        requirementText('Total'),
                        requirementText('${total = payDesFees + gst}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 43,
              color: primaryColor,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: createOrder,
                  child: const Text('PAY',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: requirementText(
                  'Note:- Revision will be attained on office contact no. up to finalization of concept floor plan and 3D elevation.'),
            )
          ],
        ),
      ),
    );
  }
}
