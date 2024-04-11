import 'package:flutter/material.dart';
import 'package:subtracker/screens/register_two.dart';

import '../models/app_constants.dart';

class RegisterOne extends StatelessWidget {
  const RegisterOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Image.asset("assets/images/landing_page.png"),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: AppConstants.logoText,
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.15,
              left: 0,
              right: 0,
              child: InkWell(
                child: Image.asset("assets/images/google_button.png"),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.15,
              left: 0,
              right: 0,
              child: const InkWell(
                child: Text(
                  "or",
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.075,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterTwo())),
                child: Image.asset("assets/images/email_button.png"),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.01,
              left: 0,
              right: 0,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "By registering, you  agree to our Terms of Use. \n Learn how we collect, use and share your data.",
                  style: TextStyle(color: Color(0xff83839c), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }
}
