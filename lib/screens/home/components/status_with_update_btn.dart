// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vigbee/constants.dart';
import 'package:intl/intl.dart';
//import 'package:hellow_world_flutter/screens/details/details_screen.dart';

// import '../../../constants.dart';

class HouseStatusRead extends StatelessWidget {
  const HouseStatusRead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: new EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: Border.all(
                color: kPrimaryColor,
                width: 1,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                /* Contenedor imagen */
                Container(
                  height: 140.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    gradient: new LinearGradient(
                      colors: [Colors.black, Colors.black],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.clamp,
                    ),
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/livingroombackgroud.jpg"),
                      fit: BoxFit.fitWidth,
                      colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.hardLight),
                      // colorFilter: ColorFilter.linearToSrgbGamma(),
                    ),
                  ),
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100, left: 310),
                        child: new Text(
                          'Sala',
                          style: new TextStyle(
                            fontSize: 32,
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            // backgroundColor: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /* CONTENEDOR CON LA INFORMACION */
                Container(
                  height: 120.0,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [Colors.blue[50], Colors.white10],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        // padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: new EdgeInsets.only(
                            bottom: 40, left: 10, right: 16),
                        child: CircleAvatar(
                          radius: 26,
                          // backgroundColor: Colors.blueAccent[100],
                          backgroundColor: Colors.green,
                          child: new CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                AssetImage("assets/images/mocimiento.jpg"),
                          ),
                        ),
                      ),
                      new Expanded(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new SizedBox(height: 10),
                            new Text(
                              'Movimiento detectado',
                              style: new TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            new SizedBox(height: 4),
                            new Row(
                              children: <Widget>[
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      '1:14:30 Hs',
                                      style: new TextStyle(
                                        fontSize: 17,
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),

                                    /* new Text(
                                    'Miercoles 9, Diciembre 2020',
                                    style: new TextStyle(
                                      fontSize: 19.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.white70,
                                    ),
                                  ), */
                                  ],
                                ),
                              ],
                            ),
                            new SizedBox(height: 20),
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  'Ultimo evento:',
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                new Text(
                                  'Miercoles 9, Diciembre 2020 a las 1:14:30 hs  ',
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            /*  */
                          ],
                        ),
                      ),
                      /* new Padding(
                        padding: new EdgeInsets.only(
                            top: 82, left: 10.0, right: 10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Checkbox(
                              value: false,
                              onChanged: null,
                              activeColor: Colors.green,
                              checkColor: Colors.white,
                              tristate: false,
                            ),
                            /* new Text(
                                '12°',
                                style: new TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                ),
                              ), */
                          ],
                        ),
                      ) */
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          Container(
            height: 150,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/livingroombackgroud.jpg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
                // colorFilter: ColorFilter.linearToSrgbGamma(),
              ),
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            child: Placeholder(),
          ),
          SizedBox(height: 18),

          RealtimeSensorRead(
            cualSensor: "Porton",
            color: Colors.blue,
            lugar: "Garage",
          ),
          SizedBox(height: 18),
          RealtimeSensorRead(
            cualSensor: "Movimiento",
            color: Colors.green,
            lugar: "LivingRoom",
          ),
          // RealtimeSensorRead(
          //   cualSensor: "Puerta Abierta",
          //   color: Colors.blue,
          // ),
          SizedBox(height: 18),
          RealtimeSensorRead(
            cualSensor: "Gas",
            color: Colors.deepOrangeAccent,
            lugar: "Cocina",
          ),

          // RealtimeSensorRead(
          //   cualSensor: "Monoxido de Carbono",
          //   color: Colors.orange,
          // ),
        ],
      ),
    );
  }
}

class RealtimeSensorRead extends StatefulWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final Query query = FirebaseFirestore.instance.collection("lecturasSensor");
  final String cualSensor;
  final Color color;
  final String lugar;
  RealtimeSensorRead({this.cualSensor, this.color, this.lugar});
  @override
  _RealtimeSensorReadState createState() => _RealtimeSensorReadState();
}

class _RealtimeSensorReadState extends State<RealtimeSensorRead> {
  @override
  bool value = false;
  // final dbRef = FirebaseFirestore.instance.ref();

  onUpdate(bool lecturaSensor) {
    setState(() {
      // value = !value;
      value = lecturaSensor;
    });
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
        // agregar una restriccion que detecte cuando los sensores no estan en linea.
        stream: widget._firestore.collection("lecturasSensor").snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError && snapshot.data != null) {
            return Column(
              children: [
                Card(
                  child: FloatingActionButton.extended(
                    heroTag: widget
                        .cualSensor, //Evitar error "There are multiple heroes that share the same tag within a subtree"
                    onPressed: () {
                      onUpdate(true);
                      // print("+*+*+*+*+**//+*/-*+/*");
                      // print(snapshot.data.documents[1]["value"].toString());
                    },
                    label: Text(
                      // snapshot.data.documents[2]["sensor"].toString(),
                      // asignarNombreMostrar(snapshot.data.documents),
                      asignarNombreMostrar(
                          widget.cualSensor, snapshot.data.documents),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    /* value
                        ? Text(
                            // snapshot.data.documents[2]["sensor"].toString(),
                            // asignarNombreMostrar(snapshot.data.documents),
                            asignarNombreMostrar(
                                widget.cualSensor, snapshot.data.documents),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : Text("Sin"), */
                    elevation: 20,
                    backgroundColor: identificarValueParaCadaCard(
                            widget.cualSensor, snapshot.data.documents)
                        ? widget.color
                        : Colors.grey,
                    icon: value
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    // snapshot.data.documents[1]["time"].toString(),
                    mostrarhorarioExacto(
                        timestamp: snapshot.data.documents[1]["time"]),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    // snapshot.data.documents[1]["time"].toString(),
                    obtenerDia(timestamp: snapshot.data.documents[1]["time"]),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    // snapshot.data.documents[1]["sensor"].toString(),/
                    identificoCardParaMostrarLugar(widget.cualSensor),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
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
      return "Lunes " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 2:
      return "Martes " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 3:
      return "Miercoles " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 4:
      return "Jueves " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 5:
      return "Viernes " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 6:
      return "Sabado " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();
    case 7:
      return "Domingo " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString();

      break;
    default:
      return "no es fecha valida";
  }
}

String mostrarhorarioExacto({int timestamp}) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  // final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toUtc();
  // print(date);
  // devolver pero en hora local. ¿?

  return date.hour.toString() +
      ":" +
      date.minute.toString() +
      ":" +
      date.second.toString() +
      " Hs.";
  // return timestamp.toString();
}

String identificoCardParaMostrarLugar(cualCardIdentifico) {
  switch (cualCardIdentifico) {
    case "Porton":
      {
        return "Lugar: Garage";
      }
      break;
    case "Gas":
      {
        return "Lugar: Cocina";
      }
      break;
    case "Movimiento":
      {
        return "Lugar: LivingRoom";
      }
      break;
    default:
      return "Error al identificar el lugar a mostrar";
  }
}

bool identificarValueParaCadaCard(cualCardIdentifico, documento) {
  switch (cualCardIdentifico) {
    case "Porton":
      {
        return documento[0]["value"];
      }
      break;
    case "Gas":
      {
        return documento[1]["value"];
      }
      break;
    case "Movimiento":
      {
        return documento[2]["value"];
      }
      break;
    default:
      return null; //posible bug
  }
  // return false;
}

String asignarNombreMostrar(cualsensorMuestro, documento) {
  switch (cualsensorMuestro) {
    case "Porton":
      {
        if (documento[0]["value"]) {
          return "Porton Abierto";
        } else {
          return "Porton Cerrado";
        }
        // return documento[0]["sensor"];
      }
      break;
    case "Gas":
      {
        if (documento[1]["value"]) {
          return "Peligro monóxido de carbono";
        } else {
          return "Sin monóxido de carbono";
        }
      }
      break;
    case "Movimiento":
      {
        if (documento[2]["value"]) {
          return "Movimiento";
        } else {
          return "Sin movimiento";
        }
      }
      break;
    default:
      return "error al Identificar Sensor a Mostrar";
  }
}
