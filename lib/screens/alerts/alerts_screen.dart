// import 'dart:async';
// import 'dart:html';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:vigbee/components/my_bottom_navbar.dart';
import 'package:vigbee/screens/home/components/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// import 'package:hellow_world_flutter/screens/alerts/components/expansionList.dart';
//import 'package:hellow_world_flutter/screens/alerts/components/body.dart';

class AlertsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      // body: NotificationsListview(),
      // body: ExpansionAlertsList(),
      body: ListaDeAlertas(),
      bottomNavigationBar:
          MyBottomNavBar(), // Aqui agregar routes (monitorear, quitar historial, y agregar tambien 'Inicio'   )
    );
  }
}

class ListaDeAlertas extends StatefulWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  _ListaDeAlertasState createState() => _ListaDeAlertasState();
}

class _ListaDeAlertasState extends State<ListaDeAlertas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: widget._firestore
              .collection("alertas.de.amenaza")
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: snapshot
                  .data.documents.length, // Aqui limito mis ultimas 30 alertas
              itemBuilder: (context, index) {
                // creo model amenaza. Le asigno time y sensor, (¿Tambien titulo, body?)
                Map mostrar = {
                  "sensor": snapshot.data.documents[index]["sensor"],
                  "figurita": "caminando",
                  // "hora_exact": readTimestamp(snapshot.data.documents[index]["time"].toString()),
                  "hora_exact": readTimestamp(
                      timestamp: snapshot.data.documents[index]["time"]),
                  "fecha": obtenerDia(
                      timestamp: snapshot.data.documents[index]["time"]),
                  // "fecha": DateTime.fromMillisecondsSinceEpoch(
                  //         snapshot.data.documents[index]["time"] * 1000)
                  //     .day
                  //     .toString(),
                };

                return AlertaItem(mostrar: mostrar);
              },
            );
            //Si quiero reaccionar cuando ya se cierra el strem (ya no voy a recibir mas informacion), muestro mi ultmo widget
            /* if (snapshot.connectionState == ConnectionState.done) {
              return Text('Fin del Stream :( ');
            } 
            return Container(
                height: 150,
                width: 150,
                color: snapshot.data //Aqui tengo que renderizar
                );
                */
          },
        ),
      ),
    );
  }
}

class AlertaItem extends StatefulWidget {
  // final String itemTitle;
  final Map mostrar;
  AlertaItem({this.mostrar});
  @override
  _AlertaItemState createState() => _AlertaItemState();
}

class _AlertaItemState extends State<AlertaItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // title: Text(widget.itemTitle),
        title: Row(
          children: <Widget>[
            Expanded(
              // child: Text(item.place,
              child: (widget.mostrar["sensor"] == "PIR")
                  ? Text("Movimiento")
                  : (widget.mostrar["sensor"] == "MAGNETIC")
                      ? Text("Apertura de Puerta")
                      : Text("Monoxido de Carbono"),
              // textAlign: TextAlign.left, overflow: TextOverflow.ellipsis),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown, // otherwise the logo will be tiny
                // child: const FlutterLogo(),
                child: ((widget.mostrar["sensor"].toString() != "MQ7"))
                    ? ((widget.mostrar["sensor"].toString() == "PIR")
                        ? Icon(Icons.directions_run)
                        // : Icon(IconData(61179, fontFamily: 'MaterialIcons')),
                        : Icon(Icons.crop_portrait))
                    : Icon(Icons.warning),
              ),
            ),
            Expanded(
              child: Text(
                  // item.hour,
                  // messageAlert["data"]["time"].toString(),
                  widget.mostrar["hora_exact"],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              // child: Text(item.day,
              child: Text(widget.mostrar["fecha"],
                  textAlign: TextAlign.right, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}

String readTimestamp({int timestamp}) {
  // final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toUtc();
  // print(date);
  // devolver pero en hora local. ¿?
  return date.hour.toString() + ":" + date.minute.toString() + " Hs.";
}

String obtenerDia({int timestamp}) {
  DateTime dateSensorRead =
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  /* print(dateSensorRead
      .toString()); // prints something like 2019-12-10 10:02:22.287949
  print(DateFormat('EEEE').format(dateSensorRead)); // prints Tuesday
  print(DateFormat('EEEE, d MMM, yyyy')
      .format(dateSensorRead)); // prints Tuesday, 10 Dec, 2019
  print(DateFormat('h:mm a').format(dateSensorRead)); // prints 10:02 AM
 */
  // return timestamp.toString();

  // print(date.hour.toString() +
  //     ":" +
  //     date.minute.toString() +
  //     ":" +
  //     date.second.toString());
  // print(date.hour);
  // return date.hour.toString() +
  //     ":" +
  //     date.minute.toString() +
  //     ":" +
  //     date.second.toString() +
  //     " Hs.";
  // return DateFormat('EEEE, d MMM, yyyy').format(date);

  switch (DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).weekday) {
    case 1:
      return "Lun, " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 2:
      return "Mar, " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 3:
      return "Mie, " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 4:
      return "Jue " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 5:
      return "Vie, " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 6:
      return "Sab, " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 7:
      return "Dom, " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();

      break;
    default:
      return "no es ninguno";
  }
}
