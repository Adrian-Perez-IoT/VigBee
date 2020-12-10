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
      //Aqui funcion guardarTokenFirestore(){cuidar que el token no haya sido ya previamente guardado}. Para luego recuperar el token en el Servidor bakend MQTT (elegir un solo token y que sea el ultimo).
      //emulador api28 -> dcS-sFSue18:APA91bFVq64WRhbmIjTerQdZ0w--cjaYyLJov7U9Eprx-IcbxTWqNHRz6Lb43NIER7UtbUVo0GPMVsrMbJvYaiWLKPzYicD8L9La_MWe6H25A2_exgsJAlAlm4QHkjIWgL5BOpNTV2eW
      //j7-> dOLhex-gfLY:APA91bHDksOk8SmZKCJ1Nrfo5p5txUPyTkO_yb88tARjv7bsoUEl-whyNiofd3zAYKqNn3A7A4Cl6m4Yl2S5z8vjGizgjjuhIcQYUyl5joa_Rp0_KSALaxGI8yIiqBgIkt1bU7gB8ln_

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
