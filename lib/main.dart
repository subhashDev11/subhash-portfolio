import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subhash_dev/firebase_options.dart';

import 'app.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
