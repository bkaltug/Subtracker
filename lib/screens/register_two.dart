import 'package:flutter/material.dart';
import 'package:subtracker/screens/home_page.dart';
import '../models/app_constants.dart';

class RegisterTwo extends StatefulWidget {
  const RegisterTwo({super.key});

  @override
  State<RegisterTwo> createState() => _RegisterTwoState();
}

class _RegisterTwoState extends State<RegisterTwo> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Icon passwordSuffixIcon = const Icon(Icons.visibility_off);
  bool obscureTextBool = true;
  Color dividerOneColor = Colors.white.withOpacity(0.5);
  Color dividerTwoColor = Colors.white.withOpacity(0.5);
  Color dividerThreeColor = Colors.white.withOpacity(0.5);
  int passwordStrengthCode = 0;
  String passwordWarningText =
      "Use 8 or more characters with a mix of letters,\n numbers & symbols.";

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswordStrength);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength() {
    String password = _passwordController.text;
    dividerOneColor = Colors.white.withOpacity(0.5);
    dividerTwoColor = Colors.white.withOpacity(0.5);
    dividerThreeColor = Colors.white.withOpacity(0.5);
    passwordStrengthCode = 0;

    if (password.length >= 8 ||
        RegExp(r'\d').hasMatch(password) ||
        RegExp(r'[A-Z]').hasMatch(password)) {
      passwordStrengthCode = 1;
    }
    if (password.length >= 8 && RegExp(r'\d').hasMatch(password) ||
        password.length >= 8 && RegExp(r'[A-Z]').hasMatch(password) ||
        RegExp(r'\d').hasMatch(password) &&
            RegExp(r'[A-Z]').hasMatch(password)) {
      passwordStrengthCode = 2;
    }
    if (password.length >= 8 &&
        RegExp(r'\d').hasMatch(password) &&
        RegExp(r'[A-Z]').hasMatch(password)) {
      passwordStrengthCode = 3;
    }
    if (passwordStrengthCode == 1) {
      dividerOneColor = Colors.green;

      dividerTwoColor = Colors.white.withOpacity(0.5);
      dividerThreeColor = Colors.white.withOpacity(0.5);
    }
    if (passwordStrengthCode == 2) {
      dividerOneColor = Colors.green;
      dividerTwoColor = Colors.green;
      dividerThreeColor = Colors.white.withOpacity(0.5);
    }
    if (passwordStrengthCode == 3) {
      dividerOneColor = Colors.green;
      dividerTwoColor = Colors.green;
      dividerThreeColor = Colors.green;
    }

    setState(() {});
  }

  String? validateEmail(String? value) {
    if (value == null ||
        value.isEmpty ||
        !_emailController.text.contains("@") ||
        !_emailController.text.contains(".com")) {
      setState(() {
        passwordWarningText =
            "Please enter a valid e-mail address.\n\n Use 8 or more characters with a mix of letters,\n numbers & symbols.";
      });
      return "";
    } else {
      setState(() {
        passwordWarningText =
            "Use 8 or more characters with a mix of letters,\n numbers & symbols.";
      });
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (passwordStrengthCode != 3) {
      setState(() {
        passwordWarningText =
            "Password must be strong!\n\n Use 8 or more characters with a mix of letters,\n numbers & symbols.";
      });
      return "";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                AppConstants.logoText,
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                Container(
                    padding: const EdgeInsets.only(bottom: 5, left: 1),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text("E-mail address",
                        textAlign: TextAlign.left)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.white.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: TextFormField(
                      controller: _emailController,
                      validator: validateEmail,
                      style: const TextStyle(
                          color: Colors.white, decorationThickness: 0),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 5, left: 1),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text("Password", textAlign: TextAlign.left)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.white.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: TextFormField(
                      controller: _passwordController,
                      validator: validatePassword,
                      obscureText: obscureTextBool,
                      style: const TextStyle(
                          color: Colors.white, decorationThickness: 0),
                      decoration: InputDecoration(
                          suffixIconColor: Colors.white,
                          border: InputBorder.none,
                          suffixIcon: InkWell(
                            child: passwordSuffixIcon,
                            onTap: () {
                              if (obscureTextBool == true) {
                                setState(() {
                                  obscureTextBool = false;
                                  passwordSuffixIcon =
                                      const Icon(Icons.visibility);
                                });
                              } else {
                                setState(() {
                                  obscureTextBool = true;
                                  passwordSuffixIcon =
                                      const Icon(Icons.visibility_off);
                                });
                              }
                            },
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  passwordWarningText,
                  style:
                      const TextStyle(color: Color(0xff83839c), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: dividerOneColor,
                        thickness: 2,
                      )),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Divider(
                        color: dividerTwoColor,
                        thickness: 2,
                      )),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Divider(
                        color: dividerThreeColor,
                        thickness: 2,
                      )),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Image.asset("assets/images/get_started_button.png"),
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Color(0xff83839c), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Image.asset("assets/images/sign_in_button.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
