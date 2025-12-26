import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController textEditingControllerForEmail,
      textEditingControllerForPassword;
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    textEditingControllerForEmail = TextEditingController();
    textEditingControllerForPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingControllerForEmail.dispose();
    textEditingControllerForPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan),
      body: Form(
        key: _key,
        child: ListView(
          children: [
            SizedBox(height: 75.h),
            Icon(Icons.lock, size: 60),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 40.sp, color: Colors.black),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: textEditingControllerForEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "You should enter a value";
                  } else if (!value!.contains('@')) {
                    return "Not a valid format";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: textEditingControllerForPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  hintText: "password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.length <= 6) {
                    return "The password should be longer than six";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Thanks for joining")),
                    );
                  }
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.cyan,
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
