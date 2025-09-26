import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  void Function()? onTap;

  //regiter method
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),

        ));
      }
    } else{
       showDialog(context: context, builder: (context) => AlertDialog(
        icon: Icon(Icons.error,color: Colors.red,),
          title: Text("Paswords don't match!",style: TextStyle(fontSize: 19)),
        ));
    }
  }

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buidlogoAndWelcomeMessage(context),
            _buildLoginForm(context)
          ],
        ),
      ),
    );
  }

  //Logo and Welcome back message..
  Widget _buidlogoAndWelcomeMessage(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.message,
            size: 60, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 50),
        Text(
          "Let's create an account for you",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 16),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

//Email and Password Register Form...
  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        MyTextfield(
            hintText: "Email",
            obscureText: false,
            controller: _emailController),
        const SizedBox(height: 10),
        MyTextfield(
          hintText: "Password",
          obscureText: true,
          controller: _pwController,
        ),
        const SizedBox(height: 10),
        MyTextfield(
          hintText: "Confirm password",
          obscureText: true,
          controller: _confirmpwController,
        ),
        const SizedBox(height: 25),
        MyButton(
          text: 'Register',
          onTap: ()=>register(context),
        ),
        const SizedBox(height: 23),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                'Login now',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        )
      ],
    );
  }
}
