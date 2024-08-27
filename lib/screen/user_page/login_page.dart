import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_api/controller/api_user/login_api.dart';
import 'package:user_api/screen/user_page/page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passController,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: ()async {
             bool status= await LoginApi.loginapi(email: emailController.text, pass: passController.text);
             log("status :$status");
             if(status){
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login success")));
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SccessPage()));
             }else{
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Faild")));
             }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
