import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/service/auth_service.dart';
import '../components/my_textfield.dart';
import '../components/my_button.dart';
import '../components/square_tile.dart';



class LoginPage extends StatefulWidget {
  final  Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
final emailcontroller = TextEditingController();

final passwordController = TextEditingController();

 // siggn user in method
 void signUserIn() async {

 showDialog(
  context: context, 
  builder: (context)  {
    return const Center(
      child: CircularProgressIndicator(),
    );
  },
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailcontroller.text,
    password: passwordController.text,
  );
  Navigator.pop(context); // Dismisses the loading dialog
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
      showErrorMesage(e.code);
  }
    
}
void showErrorMesage(String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        
        ),
      );
    },
  
  );
  
}
 


 @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 228, 226, 226),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height:40),
          
              //logo
             const Icon(
                Icons.lock,
                size:100,
              ),
          
              const SizedBox(height: 40),
          
               // welcomen back, you've been missed
              const  Text(
                  "Welcome back, you've been missed",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
          
               const  SizedBox(height: 15),
          
                 // Email textfield
                 MyTextField(
                  controller: emailcontroller,
                  hintText: 'Email',
                  obscureText: false,
                ),
          
               const SizedBox(height: 5),
          
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
          
                const SizedBox(height: 5),
          
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
          
                // sign in button
                MyButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),
          
                 const SizedBox(height: 40),
          
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
          
                 // google + apple sign in buttons
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    // google button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png'),

          
                  const SizedBox(width: 25),
          
                    // apple button
                    SquareTile(
                      onTap: () {},
                      imagePath: 'lib/images/apple.png')
                  ],
                ),
          
                const SizedBox(height: 40),
          
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
            ],
            ),
        ),
      ),
      ),
  );
 }
}