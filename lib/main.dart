import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class _Tab {
  const _Tab({this.title, this.icon});
  final String title;
  final IconData icon;
}

class Chat {
  const Chat({this.name, this.message,this.time,this.image});
  final String name;
  final String time;
  final IconData image;
  final String message;
}

const List<_Tab> tabs  = const <_Tab> [
 const _Tab(title: null, icon: Icons.camera_alt),
 const _Tab(title: "CHATS", icon: null),
 const _Tab(title: "STATUS", icon: null),
 const _Tab(title: "CALLS", icon: null),
] ;

const List<Chat> chats = const <Chat> [
  const Chat(name: "Tony Stark", message: "Hey Luqman, I might not come back from facing Thanos, The estate is yours if I don't make it",
  time: "15:43",image: Icons.motorcycle),

  const Chat(name: "Jessica Jones", message: "Tell Malcolm not to TOUCH MY BOOZE!, or I'll kill him",
  time: "16:13",image: Icons.local_bar),

  const Chat(name: "Morty Smith", message: "Ready for our adventure to the lost city of Atlatis??",
  time: "18:45",image: Icons.live_tv),

  
  const Chat(name: "Tony Stark", message: "Hey Luqman, I might not come back from facing Thanos, The estate is yours if I don't make it",
  time: "15:43",image: Icons.motorcycle),

  const Chat(name: "Jessica Jones", message: "Tell Malcolm not to TOUCH MY BOOZE!, or I'll kill him",
  time: "16:13",image: Icons.local_bar),

  const Chat(name: "Morty Smith", message: "Ready for our adventure to the lost city of Atlatis??",
  time: "18:45",image: Icons.live_tv),

];

class ChatItem extends StatelessWidget {
  const ChatItem({Key key, this.chat});
  final Chat chat;

  @override

  Widget build(BuildContext context){
    return new ListTile(
      title: new Text(chat.name),
      trailing: new Text(chat.time),
      leading: new Icon(chat.image),
      subtitle: new Text(chat.message)
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FluttsApp',
      theme: new ThemeData(
      primaryColor: Colors.red[800],
      accentColor: Colors.amber[600],
      fontFamily: 'roboto',

      ),
      home: new DefaultTabController(
        length: tabs.length,
        child: new MyHomePage(title: "FluttsApp",),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        actions: <Widget>[
          new IconButton(
            onPressed: () => null,
            icon: new Icon(Icons.search),
          ),
          new IconButton(
            onPressed: () => null,
            icon: new Icon(Icons.more_vert
          )
          )
        ],
        title: new Text(widget.title),
        bottom: new TabBar(
          
          indicatorColor: Colors.white,
          isScrollable: false,
          tabs: tabs.map((_Tab tab){
            return new Tab(
              text: tab.title,
              icon: new Icon(tab.icon),
            );
          }).toList(),
        ),
      ),
      body:new TabBarView(
        children:<Widget>[
          new Center(child: new Text("Camera Widget")
          ),
          new ListView(children: chats.map((Chat chat){
            return new Container(
              padding: const EdgeInsets.only(left:3.0,right: 3.0,top:10.0),
              child:  new ChatItem(
                chat: chat,
              ),
            );
        }).toList(),
        ),
        new Container(child: new Center(child: new Text("Status shows here"),
        ),
        ),
        new Center(child: new Text("CALLS"))
        ]
        
        
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => null,
        tooltip: 'Increment',
        child: new Icon(Icons.message, color: Colors.white,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
