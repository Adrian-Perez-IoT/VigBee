import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // final _mensajesStreamController = StreamController<String>.broadcast();
  final StreamController<Map<String, dynamic>> _mensajesStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get mensajes => _mensajesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.getToken().then((token) {
      print("===== FCM Token =====");
      print(token);

      _firebaseMessaging.configure(onMessage: (message) async {
        print('======= On Message =======');
        // print('EL JSON ENVIADO DESDE EL SERVIDOR BACKEND ES:' );
        // print(message);
        print("Pintar campana de rojo");
      }, onResume: (message) async {
        print('======= On Resume =======');
        // print(message);
        _mensajesStreamController.sink.add(message); // navego al screen alert
      }, onLaunch: (message) async {
        print('======= On Launch =======');
        // print(message);
        _mensajesStreamController.sink.add(message); // navego al screen alert
      });
    });
  }

//disponer
  dispose() {
    _mensajesStreamController?.close();
  }
}
