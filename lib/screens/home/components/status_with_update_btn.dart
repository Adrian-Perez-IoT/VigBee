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
          RealtimeSensorRead2(
            vigilar: "Porton",
            colorContenedor: Colors.blue,
            lugarSensor: "Garage",
          ),
          RealtimeSensorRead2(
            vigilar: "Movimiento",
            colorContenedor: Colors.green,
            lugarSensor: "LivingRoom",
          ),
          RealtimeSensorRead2(
            vigilar: "Gas",
            colorContenedor: Colors.deepOrangeAccent,
            lugarSensor: "Cocina",
          ),
          /* RealtimeSensorRead2(),
          RealtimeSensorRead2(), */

          /* RealtimeSensorRead(
            cualSensor: "Porton",
            color: Colors.blue,
            lugar: "Garage",
          ), */
          /*
          SizedBox(height: 18),
          RealtimeSensorRead(
            cualSensor: "Movimiento",
            color: Colors.green,
            lugar: "LivingRoom",
          ),
          SizedBox(height: 18),
          RealtimeSensorRead(
            cualSensor: "Gas",
            color: Colors.deepOrangeAccent,
            lugar: "Cocina",
          ),
*/
        ],
      ),
    );
  }
}

class RealtimeSensorRead2 extends StatefulWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String vigilar;
  final Color colorContenedor;
  final String lugarSensor;
  RealtimeSensorRead2({this.vigilar, this.colorContenedor, this.lugarSensor});

  @override
  _RealtimeSensorRead2State createState() => _RealtimeSensorRead2State();
}

class _RealtimeSensorRead2State extends State<RealtimeSensorRead2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 1,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
      child: StreamBuilder(
        stream: widget._firestore.collection("lecturasSensor").snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError && snapshot.data != null) {
            return Column(
              children: [
                /* Contenedor imagen de cabecera */
                Container(
                  height: 131.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                      image:
                          // AssetImage("assets/images/livingroombackgroud.jpg"),
                          asignarImageBackground(widget.vigilar),
                      fit: BoxFit.fitWidth,
                      colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.hardLight),
                      // colorFilter: ColorFilter.linearToSrgbGamma(),
                    ),
                  ),
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100, left: 300),
                        child: new Text(
                          // 'SALA',
                          asignarTitulo(cualLugar: widget.vigilar),
                          style: new TextStyle(
                            fontSize: 20,
                            // color: Colors.black87,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            // fontStyle: FontStyle.italic,
                            backgroundColor: Color(0xff0f4e68),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /* CONTENEDOR CON LA INFORMACION */
                Container(
                  height: 150,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [Color(0xffd4eae5), Color(0xffe4eae5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp,
                    ),
                    /* gradient: new LinearGradient(
                      colors: [Colors.blue[50], Colors.white10],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp,
                    ), */
                  ),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        // padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: new EdgeInsets.only(
                            bottom: 40, left: 10, right: 16),
                        child: CircleAvatar(
                          radius: 30,
                          // backgroundColor: Colors.blueAccent[100],
                          backgroundColor: Colors.green,
                          // foregroundColor: Colors.red,
                          child: new CircleAvatar(
                            radius: 29,
                            backgroundImage:
                                // AssetImage("assets/images/porton.jpg"),
                                asignarAvatar(cualLugar: widget.vigilar),
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
                              // 'Movimiento detectado',
                              asignarNombreMostrar(
                                  cualsensorMuestro: widget.vigilar,
                                  documento: snapshot.data.documents),
                              style: new TextStyle(
                                fontSize: 21,
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
                                      // '1:14:30 Hs',
                                      /* mostrarhorarioExacto(
                                          cualSensor: widget.vigilar,
                                          timestamp: snapshot.data.documents[2]
                                              ["time"]), */
                                      "Hora de lectura: " +
                                          mostrarHorarioSensor(
                                              cualSensor: widget.vigilar,
                                              documento:
                                                  snapshot.data.documents),
                                      style: new TextStyle(
                                        fontSize: 17,
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            new SizedBox(height: 20),
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  // 'Ultima detección:',
                                  asignarSubtitulo(cualVigilo: widget.vigilar),
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 5),
                                new Text(
                                  // 'Miercoles 9, Diciembre 2020 a las 1:14:30 hs  ',
                                  /* mostrarhorarioExacto(
                                          timestamp: snapshot.data.documents[2]
                                              ["ultimaAmenaza"]) +
                                      " - " +
                                      obtenerFechaAmenaza(
                                          timestamp: snapshot.data.documents[2]
                                              ["ultimaAmenaza"]), */
                                  mostrarHoraFechaUltimaAmenaza(
                                      cualSensor: widget.vigilar,
                                      documento: snapshot.data.documents),

                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            /*  */
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

String asignarTitulo({String cualLugar}) {
  switch (cualLugar) {
    case "Porton":
      {
        return 'GARAGE';
      }
      break;
    case "Gas":
      {
        return 'COCINA';
      }
      break;
    case "Movimiento":
      {
        return 'SALA';
      }
      break;
    default:
      return "Error al identificar titulo de Imagen";
  }
}

String asignarSubtitulo({String cualVigilo}) {
  // return 'Ultima amenaza detectadasdfasdf:';
  switch (cualVigilo) {
    case "Porton":
      {
        return 'Última apertura del portón:';
      }
      break;
    case "Gas":
      {
        return 'Último peligro identificado:';
      }
      break;
    case "Movimiento":
      {
        return 'Último movimiento detectado:';
      }
      break;
    default:
      return "Error al identificar subtitulo Imagen";
  }
}

String mostrarHoraFechaUltimaAmenaza({String cualSensor, documento}) {
  switch (cualSensor) {
    case "Porton":
      {
        final date = DateTime.fromMillisecondsSinceEpoch(
            documento[0]["ultimaAmenaza"] * 1000);
        return DateFormat('h:mm:ss a').format(date) +
            " - " +
            obtenerFechaAmenaza(timestamp: documento[0]["ultimaAmenaza"]);
      }
      break;
    case "Gas":
      {
        final date = DateTime.fromMillisecondsSinceEpoch(
            documento[1]["ultimaAmenaza"] * 1000);
        return DateFormat('h:mm:ss a').format(date) +
            " - " +
            obtenerFechaAmenaza(timestamp: documento[1]["ultimaAmenaza"]);
      }
      break;
    case "Movimiento":
      {
        final date = DateTime.fromMillisecondsSinceEpoch(
            documento[2]["ultimaAmenaza"] * 1000);
        return DateFormat('h:mm:ss a').format(date) +
            " - " +
            obtenerFechaAmenaza(timestamp: documento[2]["ultimaAmenaza"]);
      }
      break;
    default:
      return "Error: zona a vigilar inexistente";
  }
}

String mostrarHorarioSensor({String cualSensor, documento}) {
  switch (cualSensor) {
    case "Porton":
      {
        final date =
            DateTime.fromMillisecondsSinceEpoch(documento[0]["time"] * 1000);
        return DateFormat('h:mm:ss a').format(date);
      }
      break;
    case "Gas":
      {
        final date =
            DateTime.fromMillisecondsSinceEpoch(documento[1]["time"] * 1000);
        return DateFormat('h:mm:ss a').format(date);
      }
      break;
    case "Movimiento":
      {
        final date =
            DateTime.fromMillisecondsSinceEpoch(documento[2]["time"] * 1000);
        return DateFormat('h:mm:ss a').format(date);
      }
      break;
    default:
      return "Arror al mostrar horario de lectura en tiempo real";
  }
}

AssetImage asignarAvatar({cualLugar}) {
  // return AssetImage("assets/images/porton.jpg");
  switch (cualLugar) {
    case "Porton":
      {
        return AssetImage("assets/images/garageico.jpg");
      }
      break;
    case "Gas":
      {
        // return AssetImage("assets/images/icorespiraposta.png");
        return AssetImage("assets/images/esto1.jpeg");
      }
      break;
    case "Movimiento":
      {
        return AssetImage("assets/images/mocimiento.jpg");
      }
      break;
    default:
      return AssetImage("assets/images/porton.jpg");
  }
}

AssetImage asignarImageBackground(cualImagenAsigno) {
  // return AssetImage("assets/images/livingroombackgroud.jpg");
  switch (cualImagenAsigno) {
    case "Porton":
      {
        return AssetImage("assets/images/porton5.jpg");
      }
      break;
    case "Gas":
      {
        return AssetImage("assets/images/cocinaposta.jpg");
      }
      break;
    case "Movimiento":
      {
        return AssetImage("assets/images/sala6.jpg");
      }
      break;
    default:
      return AssetImage("assets/images/porton.jpg");
  }
}

String obtenerFechaAmenaza({int timestamp}) {
  //tiene que decir: "hace 30 segundos, hace 2 minutos, hace 5 dias, hace 3 semanas, hace 5 meses, etc""
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
      /* return "Jueves " +
          DateFormat('d MMM, yyyy').format(dateSensorRead).toString(); */
      return DateFormat('h:mm:ss a').format(dateSensorRead) +
          " " +
          "Jueves " +
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

String mostrarhorarioExacto({String cualSensor, int timestamp}) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  // final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toUtc();
  // print(date);
  // devolver pero en hora local. ¿?

  /* La posta anterior
   return date.hour.toString() +
      ":" +
      date.minute.toString() +
      ":" +
      date.second.toString() +
      " Hs."; */
  return DateFormat('h:mm:ss a').format(date);
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

String asignarNombreMostrar({cualsensorMuestro, documento}) {
  switch (cualsensorMuestro) {
    case "Porton":
      {
        if (documento[0]["value"]) {
          return "Portón abierto";
        } else {
          return "Portón cerrado";
        }
        // return documento[0]["sensor"];
      }
      break;
    case "Gas":
      {
        if (documento[1]["value"]) {
          return "Peligro monóxido de carbono";
        } else {
          return "Normal";
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
      return "error al identificar el sensor a mostrar";
  }
}

/*  */ /*  */ /*  */ /*  */ /*  */ /*  */ /*  */ /*  */ /*  */ /*  */ /*  */ /*  */ /*  */

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
  // bool value = false;
  // final dbRef = FirebaseFirestore.instance.ref();

  onUpdate(bool lecturaSensor) {
    setState(() {
      // value = !value;
      // value = lecturaSensor;
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
                          cualsensorMuestro: widget.cualSensor,
                          documento: snapshot.data.documents),
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
                    icon: true
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    // snapshot.data.documents[1]["time"].toString(),
                    mostrarhorarioExacto(
                        timestamp: snapshot.data.documents[0]["time"]),
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
                    obtenerDia(timestamp: snapshot.data.documents[0]["time"]),
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
