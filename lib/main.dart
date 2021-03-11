import 'package:flutter/material.dart';
import 'package:vigbee/providers/push_notifications_provider.dart';
import 'package:vigbee/screens/alerts/alerts_screen.dart';
import 'package:vigbee/screens/home/home_screen.dart';
import 'package:vigbee/screens/monitor/monitorear_screen.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VigBee());
}

class VigBee extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<VigBee> {
  final Future<FirebaseApp> _initialization = Firebase
      .initializeApp(); // si o si la debo inicializar para usar cualquier servicio de firebase
  final GlobalKey<NavigatorState> navigatorkey = new GlobalKey<
      NavigatorState>(); // este variable la declaro, para acceder a ella desde ¿cualquier lugar?, y navegar
  @override
  void initState() {
    super.initState();
    final PushNotificationProvider pushProvider =
        new PushNotificationProvider();
    pushProvider.initNotifications();
    //para estar escuchando los mensajes que emitan la variable mensaje, uso el metodo listen
    pushProvider.mensajes.listen(
      (data) {
        // Navigator.pushNamed(context, 'alertas'); //¿Si lelega una nueva notificacion, me muevo al screen alerts?
        print(
            '=========================Argumento recibido en la notificacion Push');
        print(data);
        navigatorkey.currentState.pushNamed('alertas', arguments: data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("SomethingWentWrong: Error al inicializar Firebase...");
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorkey,
            title: 'VigBee',
            theme: ThemeData(
              scaffoldBackgroundColor: kBackgloundColor,
              primaryColor: kPrimaryColor,
              textTheme:
                  Theme.of(context).textTheme.apply(bodyColor: kTextColor),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: 'home',
            routes: {
              'home': (BuildContext context) => HomeScreen(),
              'alertas': (BuildContext context) => AlertsScreen(),
              'monitorear': (BuildContext context) => MonitorScreen(),
            },
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Loading VigBee...");
      },
    );
  }
}
