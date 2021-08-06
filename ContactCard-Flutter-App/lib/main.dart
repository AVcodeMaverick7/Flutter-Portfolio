import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/vicky.jpg'),
              ),
              Text(
                'Vikranth Ale',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'DATA SCIENTIST',
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade100,
                    fontSize: 25.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 25.0,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      '+39 329 214 5367',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  )),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 25.0,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    'alevikranth407@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
