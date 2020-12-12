import 'package:flutter/material.dart';
import 'package:vigbee/components/my_bottom_navbar.dart';
// import 'package:hellow_world_flutter/screens/alerts/components/expansionList.dart';
import 'package:vigbee/screens/home/components/appBar.dart';
import 'package:vigbee/providers/mqtt_provider.dart' as algomqtt;

class MonitorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // return Placeholder();
    return Scaffold(
      appBar: buildAppBar(context),
      // body: NotificationsListview(),
      body: Center(
        child: Center(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  print("Aqui se suscribe al topic");
                  // algomqtt.onSubscribed("Casa/LivingRoom/Movimiento");
                  // algomqtt.client.onSubscribed("Casa/LivingRoom/Movimiento"); Error de: Exception caught by gesture
                  algomqtt.main();
                },
              ),
            ],
            // children: [
            //   Text(
            //       "Screen monitorear. Que es similar al monitorear del screen-home"),
            //   ,
            // ],
          ),
        ),
      ),
      bottomNavigationBar:
          MyBottomNavBar(), // Aqui agragar routes (monitorear, quitar historial, y agregar tambien 'Inicio'   )
    );
  }
}

//Esta clase se un ejemplo extraido del tutorial. No la utilizo (por ahora) solo la tengo aqui de referencia para saber como se hace
class NotificationsListview extends StatelessWidget {
  const NotificationsListview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //declaramos una variable para acceder a TODAS las ¿Lecturas? (no, eso es en MONITORING) LA ALERTA RECIBIDA?
    // final amenaza = ModalRoute.of(context).settings.arguments;

    return Container(
      // height: size.height, creo que no hace falta.
      child: Column(
        children: <Widget>[
          CategoriesScroller(),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              //hace el scroll más lento para mantener visible el contenido.
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                //return Text(arg);
                // return Container(
                //   height: 50,
                //   color: Colors.blue,
                //   child: Center(
                //     child: Text(arg),
                //   ),
                // );
                return ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {},
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );

    // return Row(
    //   children: <Widget>[
    //     RichText(
    //       text: TextSpan(
    //         children: [
    //           TextSpan(
    //             text: arg,
    //             style: Theme.of(context).textTheme.headline2.copyWith(
    //                   color: kTextColor,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // SingleChildScrollView(),
          Text(
            "Casa",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Alertas",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Tienes las siguientes alertas de posibles amenazas detectadas en tu hogar",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
