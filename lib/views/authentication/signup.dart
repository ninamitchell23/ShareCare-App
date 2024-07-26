import 'package:flutter/material.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/authentication/loginpage.dart';
//import 'package:sharecare/views/authentication/signup.dart';
//import 'package:sharecare/views/home/home_page.dart';
//import 'package:sharecare/views/widget/custom_button.dart'; // Import the custom_button.dart file
//import 'package:sharecare/views/entrypoint.dart'; // Ensure this import is correct
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final double fontSize; // Add fontSize parameter

  const CustomButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.onPressed,
    this.fontSize = 16.0, // Default font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimary, // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 45.0), // Adjusted padding
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize, // Set the font size
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Text(
                      'Welcome Onboard',
                      style: TextStyle(
                        color: kPrimary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Let us help you donate easily',
                      style: TextStyle(
                        color: kGray,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 20, left: 20, right: 20),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 235, 233, 233)),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    fillColor: Color.fromARGB(255, 235, 233, 233),
                    filled: true,
                    hintText: 'Enter your email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 20, left: 20, right: 20),
                child: TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Ionicons.ios_eye_off
                          : Ionicons.ios_eye_sharp),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    fillColor: const Color.fromARGB(255, 235, 233, 233),
                    filled: true,
                    hintText: 'Enter your Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 20, left: 20, right: 20),
                child: TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Ionicons.ios_eye_off
                          : Ionicons.ios_eye_sharp),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    fillColor: const Color.fromARGB(255, 235, 233, 233),
                    filled: true,
                    hintText: 'Confirm Password',
                  ),
                ),
              ),
              CustomButton(
                text: 'Sign Up',
                textColor: kOffWhite,
                fontSize: 20.0, // Adjust font size here
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'or Continue with',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          MaterialIcons.facebook,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          AntDesign.google,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          AntDesign.twitter,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: kPrimary,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
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
