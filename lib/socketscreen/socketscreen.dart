import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adhara_socket_io/adhara_socket_io.dart';

const String URI = "http://192.168.0.4:3000/";

class Socketscreen extends StatefulWidget {
  @override
  _Socketscreen createState() => _Socketscreen();
}

class _Socketscreen extends State<Socketscreen> {
  /*List<String> toPrint = ["trying to connect"];
  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  Map<String, bool> _isProbablyConnected = {};

  @override
  void initState() {
    super.initState();
    manager = SocketIOManager();
    initSocket("default");
  }

  initSocket(String identifier) async {
    setState(() => _isProbablyConnected[identifier] = true);
    SocketIO socket = await manager.createInstance(SocketOptions(
      //Socket IO server URI
        URI,
        //Query params - can be used for authentication
        query: {
          "auth": "--SOME AUTH STRING---",
          "info": "new connection from adhara-socketio",
          "timestamp": DateTime.now().toString()
        },
        //Enable or disable platform channel logging
        enableLogging: false,
        transports: [Transports.WEB_SOCKET, Transports.POLLING] //Enable required transport
    ));
    socket.onConnect((data) {
      pprint("connected...");
      pprint(data);
      sendMessage(identifier);
    });
    socket.onConnectError(pprint);
    socket.onConnectTimeout(pprint);
    socket.onError(pprint);
    socket.onDisconnect(pprint);
    socket.on("type:string", (data) => pprint("type:string | $data"));
    socket.on("type:bool", (data) => pprint("type:bool | $data"));
    socket.on("type:number", (data) => pprint("type:number | $data"));
    socket.on("type:object", (data) => pprint("type:object | $data"));
    socket.on("type:list", (data) => pprint("type:list | $data"));
    socket.on("message", (data) => pprint(data));
    socket.connect();
    sockets[identifier] = socket;
  }

  bool isProbablyConnected(String identifier){
    return _isProbablyConnected[identifier]??false;
  }

  disconnect(String identifier) async {
    await manager.clearInstance(sockets[identifier]);
    setState(() => _isProbablyConnected[identifier] = false);
  }

  sendMessage(identifier) {
    if (sockets[identifier] != null) {
      pprint("sending message from '$identifier'...");
      sockets[identifier].emit("message", [
        "Hello world!",
        1908,
        {
          "wonder": "Woman",
          "comics": ["DC", "Marvel"]
        },
        {
          "test": "=!./"
        },
        [
          "I'm glad",
          2019,
          {
            "come back": "Tony",
            "adhara means": ["base", "foundation"]
          },
          {
            "test": "=!./"
          },
        ]
      ]);
      pprint("Message emitted from '$identifier'...");
    }
  }

  sendMessageWithACK(identifier){
    pprint("Sending ACK message from '$identifier'...");
    List msg = ["Hello world!", 1, true, {"p":1}, [3,'r']];
    sockets[identifier].emitWithAck("ack-message", msg).then( (data) {
      // this callback runs when this specific message is acknowledged by the server
      pprint("ACK recieved from '$identifier' for $msg: $data");
    });
  }

  pprint(data) {
    setState(() {
      if (data is Map) {
        data = json.encode(data);
      }
      print(data);
      toPrint.add(data);
    });
  }

  Container getButtonSet(String identifier){
    bool ipc = isProbablyConnected(identifier);
    return Container(
      height: 60.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: RaisedButton(
              child: Text("Connect"),
              onPressed: ipc?null:()=>initSocket(identifier),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: RaisedButton(
                child: Text("Send Message"),
                onPressed: ipc?()=>sendMessage(identifier):null,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              )
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: RaisedButton(
                child: Text("Send w/ ACK"), //Send message with ACK
                onPressed: ipc?()=>sendMessageWithACK(identifier):null,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              )
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: RaisedButton(
                child: Text("Disconnect"),
                onPressed: ipc?()=>disconnect(identifier):null,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              )
          ),
        ],
      ),
    );
  }*/

  SocketIOManager manager;
  Map<String, SocketIO> sockets = {};
  SocketIO socket;
  TextEditingController _controller = TextEditingController();
  String _chat;
  // StreamController _rcontroller;

  void initState() {
    manager = SocketIOManager();
    // _rcontroller = StreamController();
    _chat = '.text';

    this.socketConnectionJT();
  }

  Future socketConnectionJT() async {
    socket = await manager.createInstance(SocketOptions(
        //Socket IO server URI
        URI,
        //Query params - can be used for authentication
        query: {
          "auth": "--SOME AUTH STRING---",
          "info": "new connection from adhara-socketio",
          "timestamp": DateTime.now().toString()
        },
        //Enable or disable platform channel logging
        enableLogging: false,
        transports: [
          Transports.WEB_SOCKET,
          Transports.POLLING
        ] //Enable required transport
        ));

    socket.onConnect((data) {
      print("connected...");
      print(data);
    });
    socket.connect();
    socket.on('server:chat:message', (data) {
      print(data);

      

      setState(() {
        if (data == null) {
          _chat = '_controller.text'; // TODO: implement setState
        } else {
          _chat = data.toString();
          
        }
      });
   
      
    });

    
  }

  void _sendmsg() {
    socket.emit('chat:message', [
      {
        "message": _controller.text,
      }
      
    ]);

    
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('socket'),
      ),
      body: Container(
        child: RaisedButton(
            child: Text('Launch screen'),            
              onPressed: _sendmsg,
            ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sockets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                //esto captura el dato desde el input grafico
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            Text(_chat),
            /*StreamBuilder(
              stream: _rcontroller.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendmsg,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
