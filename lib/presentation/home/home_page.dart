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
  });

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              AuthDb.getInstance().then(
                (valDb) => valDb.deleteUserDetails().then(
                      (va) => FirebaseAuth.instance.signOut().then(
                            (v) => context.goNamed(RouterConstants.introPage),
                          ),
                    ),
              );
            },
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
