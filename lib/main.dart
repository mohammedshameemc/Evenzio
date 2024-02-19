import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/provider/loginProvider.dart';
import 'package:firstproject/provider/mainprovider.dart';
import 'package:firstproject/user/home.dart';
import 'package:firstproject/user/splash.dart';



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Admin/adminhome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> MainProvider()),
        ChangeNotifierProvider(create: (context)=> loginProvider())

      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Evenzio',
        theme: ThemeData(
            // textTheme: GoogleFonts.sacramentoTextTheme(
            //   Theme.of(context).textTheme,
            // ),


          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: Splash(),
        // home: home(),
        // home: AdminHome(),






      ),
    );
  }
}

