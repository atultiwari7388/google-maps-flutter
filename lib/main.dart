import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FirebasePractice/view/SplashScreen/splash_screen.view.firebasse.dart';
import 'package:flutter_bootcamp/view/FlutterPushnotification/notificationService/local_notification.services.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print(message.data.toString());
    print(message.notification!.title);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationServices.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: "Rubik Regular",
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const NavRouteView(),
      // initialRoute: NavRouteView.id,
      // routes: {
      //   NavRouteView.id: (context) => const NavRouteView(),
      //   SecondRouteView.id: (context) => const SecondRouteView(),
      // },

      // initialRoute: RouteName.navRouteScreen,
      // onGenerateRoute: Routes.onGenerateRoute,

      home: const FirebaseSplashScreen(),
    );
  }
}
