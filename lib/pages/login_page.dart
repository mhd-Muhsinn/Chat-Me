import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buidlogoAndWelcomeMessage(context), _buildLoginForm(context)],
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
          "Welcome back, you've been missed!",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 16),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

//Login Email and Password Form...
  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        MyTextfield(hintText: "Email", obscureText: false, controller: _emailController),
        const SizedBox(height: 10),
        MyTextfield(
          hintText: "Password",
          obscureText: true, controller: _pwController,
        ),
        const SizedBox(height: 25),
        MyButton(text: 'Login', onTap: () {},),
        const SizedBox(height: 23),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not a member? '
            ,style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            Text('Register now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary
            ),
            ),


          ],
        )
      ],
    );
  }
}
