import 'package:flutter/material.dart';
import 'package:subtracker/models/app_constants.dart';
import 'package:subtracker/screens/register_one.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const RegisterOne()))),
                child: Image.asset("assets/images/get_started_button.png"),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: 0,
              right: 0,
              child: InkWell(
                //TODO navigate to login
                child: Image.asset("assets/images/have_an_account_button.png"),
              ))
        ],
      ),
    );
  }
}
