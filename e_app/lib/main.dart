import 'package:e_app/Veiw/signUpScreen.dart';
import 'package:e_app/state/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( context)=>CurrentUser(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUpScreen(),
      ),
    );
  }
}
