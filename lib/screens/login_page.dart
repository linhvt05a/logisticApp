import 'package:flutter/material.dart';
import 'package:logistic/screens/home_page.dart';
import 'package:logistic/screens/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void navigateToHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  void backToSignup(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        // backgroundColor: Colors.black12
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 46,
                    child: TextFormField(
                        decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Họ và tên',
                      hintText: 'ex: Hoàng Quang  ',
                    )),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 46,
                      child: TextFormField(
                          decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'ex: hoanglinh6794@gmail',
                      )),
                    )),
              ],
            )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        navigateToHome(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text('Submit'),
                        height: 46,
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Do you have an account?'),
                        TextButton(
                            onPressed: () {
                              backToSignup(context);
                            },
                            child: const Text(
                              'Signup',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
