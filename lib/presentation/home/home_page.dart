import 'package:flutter/material.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/presentation/auth/data/data_provider/auth_db.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

AuthDb authDb = AuthDb();

  @override
  void initState() {
    super.initState();
    authDb.getUserDetails(FirebaseAuth)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blueColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
