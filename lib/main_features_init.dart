import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection.dart' as di;
import 'features/auth/data/models/user_hive.dart';

class MainFeatureInit {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
    Hive.registerAdapter(UserHiveAdapter());
    await Hive.openBox<UserHive>('userBox');
    await di.init();
  }
}
