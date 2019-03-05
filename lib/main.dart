import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter App",
      theme: new ThemeData(primaryColor: Colors.blue,),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{ //penambahan
  TabController tabController;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 3, vsync: this); //penambahan
    var tabBarItem = new TabBar(
      tabs: <Widget>[
        new Tab(
          icon: new Icon(Icons.list),
        ),
        new Tab(
          icon: new Icon(Icons.grid_on),
        ),
        new Tab(
          icon: new Icon(Icons.credit_card),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    );

    var listItem = new ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return new ListTile(
          title: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top:10.0, bottom: 10.0),
              child: new Text("Daftar Item $index"),
            ),
          ),
          onTap: (){
            showDialog(
              barrierDismissible: false,
              context: context,
              child: new CupertinoAlertDialog(
                title: new Column(
                  children: <Widget>[
                    new Text("Daftar View"),
                    new Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  ],
                ),
                content: new Text("Item terpilih $index"),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("OK"),
                  )
                ],
              )
            );
          },
        );
      }
    );

    var gridView = new GridView.builder(
      itemCount: 10,
      gridDelegate: 
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) ,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              child: new Text("Item $index"),
            ),
          ),
          onTap: (){
            showDialog(
              barrierDismissible: false,
              context: context,
              child: new CupertinoAlertDialog(
                title: new Column(
                  children: <Widget>[
                    new Text("GridView"),
                    new Icon(
                      Icons.favorite,
                      color:Colors.green,
                    ),
                  ],
                ),
                content: new Text("Item yang dipilih $index"),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: new Text("OK"),
                  )
                ],
              )
            );
          },
        );
      }
    );
  
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("TabBar"),
          bottom: tabBarItem,
        ),
        body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            listItem,
            gridView,
           new Align(
             alignment:Alignment.topLeft,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    // leading: Icon(Icons.album),
                    title: Text('Membuat Card'),
                    subtitle: Text('Belajar membuat Card menggunakan Flutter'),
                  ),
                ],
              ),
            ),
          ),
          
          ],
        ),
      ),
    );
  }
}