import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/auth/data/data_provider/auth_db.dart';
import 'package:track_it/presentation/auth/data/models/user.dart' as userModel;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthDb authDb = AuthDb();

  @override
  void initState() {
    super.initState();
    AuthDb.getInstance().then((val) async {
      authDb = val;
      userModel.User? userDetails =
          await authDb.getUserDetails(FirebaseAuth.instance.currentUser!.uid);
      log(userDetails.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blueColor,
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _getCurrentIndex(context),
          onTap: (index) {
            switch (index) {
              case 0:
                GoRouter.of(context).goNamed(RouterConstants.feedPage);
                break;
              case 1:
                GoRouter.of(context).goNamed(RouterConstants.analyticsPage);
                break;
              case 2:
                GoRouter.of(context).goNamed(RouterConstants.profilePage);
                break;
              default:
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.graphic_eq), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_sharp), label: "")
          ]),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouter.of(context).location;
    if (location.startsWith(
        "/${RouterConstants.home}/${RouterConstants.analyticsPage}")) {
      return 1;
    } else if (location.startsWith(
        "/${RouterConstants.home}/${RouterConstants.profilePage}")) {
      return 2;
    }
    return 0; // Default to feed
  }
}
