import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/auth/data/data_provider/auth_db.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => _goToAuth());
  }

  _goToAuth() {
    AuthDb.getInstance().then((dbVal) {
      try {
        dbVal.getUserDetails("userDetails").then((userVal) {
          if (userVal != null) {
            context.goNamed(RouterConstants.home);
          } else {
            context.goNamed(RouterConstants.introPage);
          }
        });
      } catch (e) {
        context.goNamed(RouterConstants.introPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blueColor,
      body: Stack(
        children: [
          const MainBackground(),
          _logo(),
        ],
      ),
    );
  }

  _logo() {
    return const Center(child: LogoWidget());
  }
}
