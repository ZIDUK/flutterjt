import 'package:flutter/material.dart';
import '../screen2/screen2.dart';
import './screen1.dart';
import '../screen3/screen3.dart'; 
import '../screen2/usuarios.dart';
import '../socketscreen/socketscreen.dart';

class HamburMenu extends StatefulWidget {
  HamburMenuState createState() => new HamburMenuState();
}

class HamburMenuState extends State<HamburMenu> {
  String mainProfilePicture =
      'https://media.wired.com/photos/598e35994ab8482c0d6946e0/master/w_2560%2Cc_limit/phonepicutres-TA.jpg';
  String otherProfilePicture =
      'https://images.askmen.com/1080x540/2016/01/25-021526-facebook_profile_picture_affects_chances_of_getting_hired.jpg';

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: GestureDetector(
              onTap: () => print('Current Picture'),
              child: CircleAvatar(
                backgroundImage: NetworkImage(mainProfilePicture),
              ),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () => switchUser(),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(otherProfilePicture),
                ),
              ),
            ],
            accountName: Text('Jonathan Pardo'),
            accountEmail: Text('jonapardo92@gmail.com'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c261afbb-1184-467a-afaf-f412e9368190/ddflf9e-19c80715-5ec0-4dc5-b224-0eb6e67d5375.png/v1/fill/w_1280,h_720,strp/the_valshar_by_istrandar_ddflf9e-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6IlwvZlwvYzI2MWFmYmItMTE4NC00NjdhLWFmYWYtZjQxMmU5MzY4MTkwXC9kZGZsZjllLTE5YzgwNzE1LTVlYzAtNGRjNS1iMjI0LTBlYjZlNjdkNTM3NS5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.IDGScoREoGNGJw3uHefSJABYB-tTx8uUh4X7tQsk8mg'))),
          ),
          ListTile(
            title: Text('First Page'),
            trailing: Icon(Icons.arrow_upward),
            onTap: (){
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => Screen2()));
            },
          ),
          ListTile(
            title: Text('Second Page'),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => Screen1()));
            },
          ),
          ListTile(
            title: Text('Second Page'),
            trailing: Icon(Icons.arrow_left),
            onTap: (){
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => Socketscreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Close'),
            trailing: Icon(Icons.cancel),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
