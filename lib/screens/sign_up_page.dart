import 'package:flutter/material.dart';
import 'package:logistic/screens/login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  void backToSignIn(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
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
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 46,
                      child: TextFormField(
                          decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Số điện thoại',
                        hintText: 'ex: 0869060808',
                      )),
                    )),
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  backToSignIn(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: const Text('Submit'),
                  height: 46,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
