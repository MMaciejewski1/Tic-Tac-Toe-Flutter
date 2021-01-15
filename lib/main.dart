import 'package:flutter/material.dart';
import 'package:ttc/ai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<int> board = new List(9);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> tab=List<int>.generate(9, (int index) => 0);
String text="You are playing as X";
  _playerMove(int a){
    setState(() {
      List<int> temp = new List(9);
      for(int x=0;x<9;x++){
        temp[x]=tab[x];
      }
      temp[a]=Player.human;
      temp[Ai.aiMove(temp,Player.computer)]=Player.computer;
      tab=temp;
      if(Ai.getWinner(tab)==Player.computer||Ai.getWinner(tab)==Player.human)
        {
         text="The Winner is"+_player(Ai.getWinner(tab));
         tab=List<int>.generate(9, (int index) => 0);
        }
    });
  }
  _player(int x){
    return (x==Player.computer)?"O":(x==Player.human)?"X":" ";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(60),
            child: Text(text, style: TextStyle(fontSize: 25),),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              // generate the widgets that will display the board
              children: List.generate(9,  (int index) =>  InkWell(
                    child:Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green,
              child: Text(_player(tab[index])),
              ),
    onTap: () {
                      _playerMove(_playerMove(index));
    } ),
            ),
          ),
        ),
       ]
      )
    );
  }



}
