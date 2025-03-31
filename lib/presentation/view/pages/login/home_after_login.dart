import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    );
    return MaterialApp(
      title: "123",
      home: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                await _googleSignIn.signOut();
                Navigator.pop(context);
                logger.d("Logout success");
              } catch (error) {
                logger.e("Logout failed: $error");
              }
            },
            child: Text("Logout"),
          ),
        ),
      ),
    );
  }
}
