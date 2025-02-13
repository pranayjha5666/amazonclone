import 'package:amazonclone/common/widgets/custom_button.dart';
import 'package:amazonclone/common/widgets/custom_textfield.dart';
import 'package:amazonclone/constants/global_variable.dart';
import 'package:amazonclone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _singinformkey = GlobalKey<FormState>();
  final _signupformkey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();  _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    // TODO: implement dispose
    super.dispose();

  }

  void signupUser() {
    authServices.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }


  void signinUser() {
    authServices.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signupformkey,
                    child: Column(
                      children: [
                        CustomtextFormField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomtextFormField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomtextFormField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: "Sign Up", onTap: () {
                          if(_signupformkey.currentState!.validate()){
                            signupUser();
                          }
                        })
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _singinformkey,
                    child: Column(
                      children: [
                        CustomtextFormField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomtextFormField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: "Sign In", onTap: () {
                          if(_singinformkey.currentState!.validate()){
                            signinUser();
                          }
                        },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
