import 'package:firebase_auth/firebase_auth.dart';
import 'package:flixify_movie_app/components/Button.dart';
import 'package:flixify_movie_app/pages/Home.dart';
import 'package:flixify_movie_app/palette/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void loginWithGoogle() async {
    // Implement Google Sign In
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    if (googleUser == null) return;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential? userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          // if null
          if (snapshot.data == null) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("assets/images/bg.png").image,
                    opacity: 0.4,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  ),
                ),
                child: Center(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // title
                      Text("Flixify",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 25),
                      // content
                      Text(
                        "Get ready to dive into the world of movies and TV shows",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(height: 25),
                      // Auth Buttons
                      MyButton(
                        text: "Subscribe Now",
                        onTap: () {},
                        bgColor: Palette.blueAccent,
                      ),

                      MyButton(
                        text: "Sign In",
                        onTap: loginWithGoogle,
                        bgColor: Color.fromARGB(124, 97, 97, 97),
                      ),
                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Palette.secondary,
                            ),
                          ), // This was missing
                          GestureDetector(
                            onTap: () {
                              // Navigate to Sign Up Page
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // Footer
                      Text(
                          "By continuing, you agree to Flixify's Terms of Use and Privacy Policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, color: Palette.secondary)),
                    ],
                  ),
                )),
              ),
            );
          } else {
            return HomePage();
          }
        });
  }
}
