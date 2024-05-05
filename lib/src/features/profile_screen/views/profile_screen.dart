import 'package:ecommerce_app/src/utils/controller/signout.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SignOut _signOut = SignOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          _signOut.logOutUser();
          Navigator.popAndPushNamed(context, '/');
        },
        child: Text(
          "Logout",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      )),
    );
  }
}
