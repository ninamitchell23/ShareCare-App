import 'package:flutter/material.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/common/custom_button.dart';
import 'package:sharecare/views/entrypoint.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

    @override
  State<LoginScreen> createState() => _LoginScreenState ();
}

bool _obscureText = true;
class _LoginScreenState extends State<LoginScreen>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                  Text('Welcome To ShareCare', style: TextStyle(color: kPrimary, fontSize: 28, fontWeight: FontWeight.bold),),
                  Text('Let us share the little we Have', style: TextStyle(color: kGray, fontSize: 13, fontWeight: FontWeight.bold))
                ],
              ),
              ),


              Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 20, left: 20, right: 20),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: true,
                enableSuggestions: true,
                decoration: const InputDecoration(
                   border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 235, 233, 233)),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),

                   ),
                   fillColor: Color.fromARGB(255, 235, 233, 233),
                   filled: true,
                 
                   hintText: 'Enter your email',
                   
                ),
              ),
              ),



              Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20, left: 20, right: 20),
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon( _obscureText ? Ionicons.ios_eye_off : Ionicons.ios_eye_sharp),
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


            const Padding(
              padding: EdgeInsets.only(left: 190),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                ),
                )
              ),
              

            CustomButton(
              text: 'Login',
              textColor: kOffWhite,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
              },
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10, left: 0, bottom: 0, right: 0),
              child: Text(
                'or Continue with',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                )
              ),
              

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 0, bottom: 0, right: 0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)
                 ),
                 child: IconButton(
                  icon: const Icon(MaterialIcons.facebook, color: Colors.blue,),
                  onPressed: () {},
                  ),
                ),

               Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: IconButton(
                  icon: const Icon(MaterialIcons.facebook, color: Colors.blue,),
                  onPressed: () {},
                  ),
                ),

                 Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: IconButton(
                  icon: const Icon(MaterialIcons.facebook, color: Colors.blue,),
                  onPressed: () {},
                  ),
                )
              ],
             ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10, left: 30, bottom: 0, right: 0),
              child: Row (
              children: [
                 Text(
                "Don't Have an account?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                ),

                 Text(
                'SignUp',
                style: TextStyle(
                  color: kPrimary,
                  fontSize: 15,
                ),
                )
              ],
            ),
            )
          ],
        ),
      ),
    )
    );
  }
}