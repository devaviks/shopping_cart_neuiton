import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neuimart_project/model/common_widgets/back_button.dart' as bb;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import '../../../model/common_widgets/cached_image.dart';
import '../../utils/api_constant.dart';
import '../../utils/api_utility.dart';
import '../../utils/asset_constants.dart';
import '../cart/cart_ui/cart_address/cart_address.dart';
import 'model/login_request.dart';

class OtpBottomSheet extends StatefulWidget {
  static const routeName = '/otp1';

  @override
  _OtpBottomSheetState createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  late String _otp1;
  late String _mobileNumber;
  final _formKey = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>.broadcast();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mobileNumber = ModalRoute.of(context)!.settings.arguments.toString();
  }

  void _validateAndSubmitOTP(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Call the API service to verify the OTP
      _verifyOtp(context);
    }
  }

  void _verifyOtp(BuildContext context) async {
    final url = BASEURL + LOGIN;
    loginRequest student = loginRequest(userPhone: _mobileNumber, otp: '1111');
    final response = await http.post(
      Uri.parse(url),
      headers: ApiUtility.getJsonHeaders(),
      body: json.encode(student.toJson()),
    );

    if (response.statusCode == 200) {
      // OTP verification successful, navigate to the desired screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => CartAddressSelection(),
        ),
      );
    } else {
      // Handle the case when OTP verification fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid OTP. Please try again.'),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Builder(
          builder: (ctx) => SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 18,
                    left: 18,
                    child: bb.BackButton(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedImage(
                          url: mobile_verification,
                          height: 90,
                          width: 90,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Verify with OTP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sent to $_mobileNumber',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: Form(
                            key: _formKey,
                            child: PinCodeTextField(
                              appContext: context,
                              length: 4,
                              animationType: AnimationType.fade,
                              keyboardType: TextInputType.number,
                              textStyle: TextStyle(
                                color: Colors.black,
                              ),
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                fieldHeight: 40,
                                fieldWidth: 30,
                                activeFillColor: Colors.white,
                                inactiveColor: Colors.grey.shade300,
                                selectedColor: Colors.black87,
                                activeColor: Colors.grey.shade300,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              onChanged: (value) {
                                setState(() {
                                  _otp1 = value;
                                });
                              },
                              onCompleted: (value) =>
                                  _validateAndSubmitOTP(ctx),
                              beforeTextPaste: (text) {
                                return false;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'RESEND OTP',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color.fromRGBO(255, 63, 108, 1),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Log in using ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'Password',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 63, 108, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Having trouble logging in? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'Get help',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 63, 108, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
