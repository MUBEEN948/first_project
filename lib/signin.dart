import 'package:flutter/material.dart';
import 'package:untitled/signup.dart';
class SiginPage extends StatefulWidget {
  const SiginPage({super.key});

  @override
  State<SiginPage> createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  final _formKey = GlobalKey<FormState>(); // Form key to manage validation
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free resources
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        backgroundColor: const Color(0xff62CECE),
        title: const Center(
          child: Text(
            "Lab-10-1397",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      //Container under body
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffFFFFFF),
        //Column under Container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Text under Column
            const Text(
              "Signin",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff62CECE)),
            ),
            //form under column 1
            Form(
              key: _formKey, // Attach form key
              child: Column(
                children: [
                  // Email/Username Field under form
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                        label: const Text(
                          "Enter your Email/username",
                          style: TextStyle(fontSize: 16),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        prefix: Image.asset(
                          'asset/icon/gmail.png',
                          width: 15,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email or username.";
                        }
                        if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Enter a valid email address.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Password Field
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                        label: const Text(
                          "Enter your password",
                          style: TextStyle(fontSize: 16),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password.";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Submit Button
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate the form
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Successfully logged in")),
                          );
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        backgroundColor: const Color(0xff62CECE),
                        elevation: 5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Do not have an account ?",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        backgroundColor: const Color(0xff62CECE),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
