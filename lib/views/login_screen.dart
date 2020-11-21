import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

// screens
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _submit() async {
    // Perform submit action

    if (_formKey.currentState.validate()) {
      // Form validation success
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
      } catch (e) {
        print(e);
      }
    }
  }

  Widget _inputField(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 10.0,
      ),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _inputField(
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      },
                    ),
                  ),
                  _inputField(
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    child: Text('Submit'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Don't have an account ?"),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text("Register now"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
