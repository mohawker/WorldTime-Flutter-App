import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: data['isDaytime'] ? [Colors.white, Colors.lightBlueAccent] : [Colors.black, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2,1],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                  ),
                  label: Text(
                    'Edit Location',
                  ),
                  color: Colors.yellow,
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color:
                              data['isDaytime'] ? Colors.black : Colors.white,
                        )),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: data['isDaytime'] ? Colors.black : Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
