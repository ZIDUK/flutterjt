import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../screen2/usuarios.dart';
import '../screen3/screen3.dart';

class Screen2 extends StatefulWidget {
  Screen2State createState() => new Screen2State();
}

class Screen2State extends State<Screen2> {
  
  List data;
  List<User> users = [];

  Future<List<User>> getDataJT() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/photos"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    
    for(var u in data)
    {
      User user = User(u["albumId"], u["id"], u["title"], u["url"], u["thumbnailUrl"]);

      users.add(user);
    }

    return users;
  }

  void initState() {
    this.getDataJT();
  }

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //Barra superior
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),

      //Cuerpo de la pagina
      body: Container(
        child: FutureBuilder(
          //se llama la data del API
          future: getDataJT(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            print(snapshot.data);
            //Condicional si viene o no data
            if(snapshot.data == null){

                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );

            } else{
              // pinto la data extraida del API
              return ListView.builder(
                itemCount:  snapshot.data.length,
                itemBuilder: (BuildContext context, int index){

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data[index].thumbnailUrl
                      ),
                    ),
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].id.toString()),
                    onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Screen3(snapshot.data[index])));
                    },
                  );
                }
              );              
            }
          },
        ),
      )
      /*appBar: new AppBar(
        title: new Text("Listviews"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),*/
    );
  }
}

