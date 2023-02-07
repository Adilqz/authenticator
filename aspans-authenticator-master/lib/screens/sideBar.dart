import 'package:aspans_authenticator/screens/myProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:aspans_authenticator/screens/loginPage.dart';
import 'package:aspans_authenticator/screens/accountExportPage.dart';
import 'package:aspans_authenticator/screens/settingsPage.dart';
import 'package:aspans_authenticator/screens/documentationPage.dart';

class sideBar extends StatelessWidget {
  const sideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Anton Gauzer'),
            accountEmail: Text('anton@aspans.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Мой профиль'),
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.download),
            title: Text('Экспорт аккаунтов'),
            onTap: () {
                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => accountExport()));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.people),
          //   title: Text('Друзья'),
          //   onTap: () {},
          // ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => settingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Документация'),
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => documentationPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Выйти'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => loginPage()), (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
