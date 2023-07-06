import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



import '../../../model/common_widgets/cached_image.dart';
import '../../../model/common_widgets/primary_button.dart';
import '../../utils/api_constant.dart';
import '../../utils/api_utility.dart';
import '../../utils/asset_constants.dart';
import '../../utils/validation_utility.dart';
import 'model/login_request.dart';
import 'otp.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();
  late String _mobileNumber;

  void _validateAndLogin(BuildContext ctx) {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _form.currentState?.save();

    final login = loginRequest(userPhone: _mobileNumber, otp: '1111');
    final url = BASEURL + LOGIN;

    http
        .post(
      Uri.parse(url),
      headers: ApiUtility.getJsonHeaders(),
      body: json.encode(login.toJson()),
    )
        .then((response) {
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final bool loginSuccessful = responseData['success'] == 1;

        if (loginSuccessful) {
          Navigator.of(context).pushNamed(Otp.routeName, arguments: _mobileNumber);
        } else {
          final errorMessage =
              responseData['message'];
          ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      } else {
        final errorMessage = 'Login failed. Please try again.';
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    })
        .catchError((error) {
      final errorMessage = 'Login failed. Please try again.';
      print(error);
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedImage(
                url: banner_login_landing,
                height: 165,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.all(36),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'or',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: ' Signup',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Form(
                        key: _form,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            alignLabelWithHint: true,
                            errorStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onFieldSubmitted: (_) => _validateAndLogin(context),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          validator: (value) => validateMobileNumberInput(value),
                          onSaved: (value) {
                            _mobileNumber = value!;
                          },
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        child: ButtonTheme(
                          child: PrimaryButton(
                            key: Key('buttonKey'),
                            title: 'CONTINUE',
                            onPressed: () => _validateAndLogin(context),
                          ),
                        ),
                      ),
                    ],
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
