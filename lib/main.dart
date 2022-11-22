import 'package:flutter/material.dart';
import 'package:gallery_app/features/gallery/presentation/gallery_screen.dart';
import 'package:gallery_app/injection.dart';

import 'core/presentation/navigation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routerConfig: router,
    );
  }
}
