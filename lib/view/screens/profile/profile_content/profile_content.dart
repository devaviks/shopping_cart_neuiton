import 'package:flutter/material.dart';

import '../profile_buttons/profile_text_button.dart';

class ProfileContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTextButton(
          text: "FAQs",
        ),
        ProfileTextButton(
          text: "ABOUT US",
        ),
        ProfileTextButton(
          text: "TERMS OF USE",
        ),
        ProfileTextButton(
          text: "PRIVACY POLICY",
        ),
      ],
    );
  }
}
