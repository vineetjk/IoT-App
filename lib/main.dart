import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


void main() => runApp(MyApp());
final dbRef = FirebaseDatabase.instance.reference();

class MyApp extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'con IoT ',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  
  MyHomePage();

 @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  var _colbulb = Colors.grey;
  var _colfan = Colors.grey;
  var _coltube = Colors.grey;
  var _colbedroom = Colors.grey;
  var _colall = Colors.grey;
  bool bulbstate = false;
  bool fanstate = false;
  bool tubestate = false;
  bool bedstate = false;
  bool allstate = false;


  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text("IoT App"),
        
        
      ),
      body: Table(
        children: [
          TableRow(

           children:[
             Padding(
                padding: const EdgeInsets.only(top:10.0,right: 5.0,left: 5.0,bottom: 5.0),
                child: Card(
                  
                  child: 
                    Column(

                      children : <Widget>[

                      Icon(Icons.lightbulb_outline,size: 60.0,color: _colbulb,),

                      Text("Hall Light",),

                      Switch(
                      value: bulbstate,
                      onChanged: (bool s){
                      setState(() {
                        bulbstate = s;
                        print("bulb: $bulbstate");

                        if(s){
                          _colbulb = Colors.amber;
                          dbRef.child("/").update({
                            'bulb': true,

                          });
                        }
                        else{
                          _colbulb = Colors.grey;
                          dbRef.child("/").update({
                            'bulb': false,

                          });
                        }


                      });
                      },
                      ),

                      ]
                  ),
                  
                  ),
                ),

                Padding(
                padding: const EdgeInsets.only(top:10.0,right: 5.0,bottom: 5.0),
                child: Card(
                  
                  child: 
                    Column(

                      children : <Widget>[

                      Icon(Icons.filter_vintage,size: 60.0,color: _colfan,),

                      Text("Fan"),

                      Switch(
                      value: fanstate,
                      onChanged: (bool s){
                      setState(() {
                        fanstate = s;
                        print("fan :$fanstate");

                        if(s){
                          _colfan = Colors.amber;
                          dbRef.child("/").update({
                            'fan': true,

                          });
                        }
                        else{
                          _colfan = Colors.grey;
                          dbRef.child("/").update({
                            'fan': false,

                          });
                        }





                      });
                      },
                      ),

                      ]
                  ),
                  
                  ),
                ),
              
      
              
              ]
        ),

        TableRow(

           children:[
             Padding(
                padding: const EdgeInsets.only(top:10.0,right: 5.0,left: 5.0,bottom: 5.0),
                child: Card(
                  
                  child: 
                    Column(

                      children : <Widget>[

                      Icon(Icons.remove,size: 60.0,color: _coltube,),

                      Text("Tube Light"),

                      Switch(
                      value: tubestate,
                      onChanged: (bool s){
                      setState(() {
                        tubestate = s;
                        print("tube :$tubestate");

                        if(s){
                          _coltube = Colors.amber;
                          dbRef.child("/").update({
                            'tube': true,

                          });
                        }
                        else{
                          _coltube = Colors.grey;
                          dbRef.child("/").update({
                            'tube': false,

                          });
                        }


                      });
                      },
                      ),

                      ]
                  ),
                  
                  ),
                ),

                Padding(
                padding: const EdgeInsets.only(top:10.0,right: 5.0,bottom: 5.0),
                child: Card(
                  
                  child: 
                    Column(

                      children : <Widget>[

                      Icon(Icons.room_service, size: 60.0,color: _colbedroom,),

                      Text("Bed Light"),

                      Switch(
                      value: bedstate,
                      onChanged: (bool s){
                      setState(() {
                        bedstate = s;
                        print("bed: $bedstate");

                        if(s){
                          _colbedroom = Colors.amber;
                          dbRef.child("/").update({
                            'bed': true,

                          });
                        }
                        else{
                          _colbedroom = Colors.grey;
                          dbRef.child("/").update({
                            'bed': false,

                          });
                        }


                      });
                      },
                      ),

                      ]
                  ),
                  
                  ),
                ),
              
      
              
              ]
        ),

        TableRow(

           children:[
             Padding(
                padding: const EdgeInsets.only(top:10.0,right: 5.0,left: 5.0,bottom: 5.0),
                child: Card(
                  
                  child: 
                    Column(

                      children : <Widget>[

                      Icon(Icons.settings,size: 60.0,color: Colors.purple,),

                      Text("Settings"),

                      RaisedButton(
                        child:Icon(Icons.chevron_right,color: Colors.white,),
                        color: Colors.purple,
                      
                      onPressed:(){
                      
                      },
                      ),

                      ]
                  ),
                  
                  ),
                ),

                Padding(
                padding: const EdgeInsets.only(top:10.0,right: 5.0,bottom: 5.0),
                child: Card(
                  
                  child: 
                    Column(

                      children : <Widget>[

                      Icon(Icons.all_inclusive, size: 60.0,color: _colall,),

                      Text("Turn On All"),

                      Switch(
                      value: allstate,
                      onChanged: (bool s){
                      setState(() {
                        allstate = s;
                        print("bed: $allstate");

                        if(s){
                          _colall = Colors.amber;

                          _colbulb = Colors.amber;
                          _colfan = Colors.amber;
                          _coltube = Colors.amber;
                          _colbedroom = Colors.amber;
                          

                          bulbstate = true;
                          tubestate = true;
                          bedstate = true;
                          fanstate = true;
                          dbRef.child("/").update({
                            'bed': true,
                            'bulb': true,
                            'fan': true,
                            'tube': true,
                            

                          });
                        }
                        else{
                          _colall = Colors.grey;
                          _colbulb = Colors.grey;
                          _colfan = Colors.grey;
                          _coltube = Colors.grey;
                          _colbedroom = Colors.grey;
                          
                          
                          bulbstate = false;
                          tubestate = false;
                          bedstate = false;
                          fanstate = false;
                          dbRef.child("/").update({
                            'bed': false,
                            'bulb': false,
                            'fan': false,
                            'tube': false,
                          });
                        }


                      });
                      },
                      ),

                      ]
                  ),
                  
                  ),
                ),
              
      
              
              ]
        ),


        
        
        ],
        
      
      ),

      

      
    );
  }

  void writeData(int a){
    int b = a;
    dbRef.child("/").update({

      'patternID' : b


    });
  }
}
