import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Minerva',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 5;

  void push(){
    setState(() {
      value++;
    });
  }

  Widget _bottomAction(IconData icon){
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: push,
        tooltip: 'New Project',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _bottomAction(FontAwesomeIcons.tasks),
            _bottomAction(FontAwesomeIcons.chartPie),
            SizedBox(width: 32.0),
            _bottomAction(FontAwesomeIcons.moneyBillWave),
            _bottomAction(Icons.settings),
          ],
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _user(),
          _graph(),
          _list(),
        ],
      ),
    );
  }

  Widget _user() {
    return Column(
      children: <Widget>[
        Text("Jorge Salas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        Text("Total Projects",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  Widget _graph(){
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Manufacturing", () => 6);
    dataMap.putIfAbsent("Delivery", () => 1);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartType: ChartType.disc,
        ),
      ],
    );
  }

  Widget _item(IconData icon, String name, String description, String phase) {
    return ListTile(
      leading: Icon(icon, size: 32.0,),
      title: Text(name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      subtitle: Text(description,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.blueGrey,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.0)
        ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(phase,
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 16.0
              ),
            ),
          ),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          _item(FontAwesomeIcons.solidFile, "DD0397", "Re-Trabajos Gage Proyecto DD0290", "Manufacturing"),
          _item(FontAwesomeIcons.solidFile, "DD0382", "Maquina emplayadora manual", "Delivery"),
          _item(FontAwesomeIcons.solidFile, "DD0360", "Lector de Huella", "Manufacturing"),
          _item(FontAwesomeIcons.solidFile, "DD0304", "Carro para Enfriamiento", "Manufacturing"),
          _item(FontAwesomeIcons.solidFile, "DD0245", "Peñoles", "Manufacturing"),
          _item(FontAwesomeIcons.solidFile, "904", "Maquina calibradora CAM PLATE", "Manufacturing"),
          _item(FontAwesomeIcons.solidFile, "1006", "Alcoholímetro", "Manufacturing"),
        ],
      ),
    );
  }
}
