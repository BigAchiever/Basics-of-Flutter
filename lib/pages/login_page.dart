import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/undraw_Mindfulness_re_v7j6.png",
            fit: BoxFit.cover,
            // height: 300,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Adding Padding to the input fields
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
            child: Column(
              children: [
                // Input fields of login page
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      print("Hi Danish");
                    },
                    style: TextButton.styleFrom(),
                    child: Text("Login")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
