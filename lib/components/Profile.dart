import 'package:firebase_auth/firebase_auth.dart';
import 'package:flixify_movie_app/pages/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // get the user
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Profile",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              // cupertino style list setting
              children: [
                CupertinoListTile.notched(
                  backgroundColor: Colors.grey.shade900,
                  title: const Text('Username',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  additionalInfo: Text(
                    user?.displayName ?? "",
                    style: TextStyle(color: Colors.grey.shade500),

                    // email
                  ),
                ),
                // email
                CupertinoListTile.notched(
                  backgroundColor: Colors.grey.shade900,
                  title: const Text('Email',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  additionalInfo: Text(
                    user?.email ?? "",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
                // sign out button
                CupertinoListTile.notched(
                  backgroundColor: Colors.grey.shade900,
                  title: const Text('Sign Out',
                      style: TextStyle(color: Colors.red, fontSize: 18)),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    // push to auth page
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthPage(
                                  key: UniqueKey(),
                                )));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
