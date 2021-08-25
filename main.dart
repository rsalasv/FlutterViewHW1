import 'dart:io';

import 'package:flutter/material.dart';


void main() => runApp(MyApp());



class Count extends StatelessWidget{
  final int likes;
  final Function(int) onCountChanged;

  Count(
    @required this.likes,
    @required this.onCountChanged
  );

  @override
  Widget build(BuildContext context){
    return Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        onCountChanged(-1);
                        //print(likes);
                      },
                        icon: Icon(Icons.thumb_down,
                          color: Colors.indigo
                        )
                      ),
                      IconButton(onPressed: (){
                        onCountChanged(1);
                        //print(likes);
                      },
                        icon: Icon(Icons.thumb_up,
                          color: Colors.indigo
                        ),
                      ),
                    ],
                  ),
                  Text("$likes"),
                ],
              );
  }
}



class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
class _HomePage extends State<HomePage> {
  int likes = 9999;
  int getLikes(){
    return this.likes;
  }
  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: new Text(value),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Dissmiss",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
    ));
  }

  bool pressed = false;
  bool pressed2 = false;
  bool pressed3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ITESO'),
      ),
      body: ListView(
        children: [
          //Imagen
          Image.network("https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
          Container(height: 30),
          //Fila
          Row(
            children: [
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text("ITESO, Universidad Jesuita de Guadalajara",
                    style: TextStyle(
                      fontWeight: FontWeight.bold),
                  ),
                  Text("San Pedro Tlaquepaque, Jal.",
                    style: TextStyle(
                      color: Colors.grey),
                  ),
                ],
              ),
              Column(
                children: [
                  Count(likes, (int temp)=>{
                    setState(()=>likes+=temp)
                  }),
            ],
          ),
            ]),
          //Fila
          Container(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children:[
                  IconButton(onPressed: (){
                        setState(() {
                          pressed = !pressed;
                        });
                        if(pressed)
                          showInSnackBar("Mande correo a iteso@iteso.mx para más información");
                      },
                        icon: Icon(Icons.mail,
                          color: pressed ? Colors.indigo : Colors.black,
                          size: 45
                        ),
                  ),
                  Text("Correo")
                ]
              ),
              Column(
                children:[
                  IconButton(onPressed: (){
                        setState(() {
                          pressed2 = !pressed2;
                        });
                        if(pressed)
                          showInSnackBar("Llame al 3333312320 para más información");
                      },
                        icon: Icon(Icons.call,
                          color: pressed2 ? Colors.indigo : Colors.black,
                          size: 45
                        ),
                  ),
                  Text("Llamada")
                ]
              ),
                            Column(
                children:[
                  IconButton(onPressed: (){
                        setState(() {
                          pressed3 = !pressed3;
                        });
                        if(pressed)
                          showInSnackBar("Visitanos para más información");
                      },
                        icon: Icon(Icons.directions,
                          color: pressed3 ? Colors.indigo : Colors.black,
                          size: 45
                        ),
                  ),
                  Text("Ruta")
                ]
              )
            ],
          ),
          Container(height: 64,),
          Text("El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara",
            textAlign: TextAlign.justify,
          ),
        ]
    ), 
  );
}
}