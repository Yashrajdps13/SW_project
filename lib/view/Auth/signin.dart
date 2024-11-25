import 'package:flutter/material.dart';
import 'package:goatmitra/Methods/Auth_methods.dart';
import 'package:goatmitra/view/Auth/signup.dart';
import 'package:goatmitra/view/pages/HomePage.dart';
import 'package:goatmitra/view/widgets/text_form.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void NavigateToSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Signupscreen()));
  }

  void loginUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailcontroller.text, password: _passwordcontroller.text);

    if (res == "seccess") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
      ));
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const Text(
              "Log In",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 64,
            ),
            Textfieldinput(
                textEditingController: _emailcontroller,
                hinttext: 'Enter Your Email',
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            Textfieldinput(
              textEditingController: _passwordcontroller,
              hinttext: 'Enter Your Password',
              textInputType: TextInputType.visiblePassword,
              ispassword: true,
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: loginUser,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: Colors.blue,
                ),
                child: _isloading
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white))
                    : const Text("Log in"),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(flex: 2, child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Don't have any account?"),
                ),
                InkWell(
                  onTap: NavigateToSignup,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
