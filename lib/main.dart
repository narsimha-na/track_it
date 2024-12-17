import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:track_it/presentation/auth/cubit/auth_cubit.dart';
import 'package:track_it/presentation/auth/data/data_provider/auth_db.dart';
import 'package:track_it/presentation/auth/data/models/user.dart';
import 'package:track_it/presentation/auth/data/repo/auth_repo_impl.dart';

import 'core/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late AuthDb authDb;
  @override
  void initState() {
    super.initState();
    startMethds();
  }

  startMethds() async {
    authDb = await AuthDb.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final IAuthRepo authRepo = IAuthRepo(
        firebaseAuth: FirebaseAuth.instance,
        dbRef: FirebaseDatabase.instance.ref('users'));

    return RepositoryProvider(
      create: (context) => authRepo,
      child: BlocProvider(
        create: (context) => AuthCubit(
          authRepo: authRepo,
          authDb: authDb,
        ),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: (context, router) {
            return Theme(
              data: ThemeData.light(),
              child: router!,
            );
          },
          routerConfig: goRouterPaths,
        ),
      ),
    );
  }
}
