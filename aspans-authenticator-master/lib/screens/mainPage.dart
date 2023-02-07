import 'dart:io';
import 'package:aspans_authenticator/components/DomainCard.dart';
import 'package:aspans_authenticator/models/account_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:aspans_authenticator/screens/qrScanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:aspans_authenticator/screens/loginPage.dart';
import 'package:aspans_authenticator/screens/sideBar.dart';
import 'package:aspans_authenticator/screens/addAccount.dart';
import 'package:aspans_authenticator/actions/createTile.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'dart:async';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class mainPage extends StatefulWidget {
  // final String value;

  // mainPage({Key? key, required this.value}) : super(key: key);

  mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  static const oneSec = Duration(seconds: 1);

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  List<AccountList> accounts = [];

  // List<AccountList> accounts = [
  //   AccountList(domain: 'trustedcoin.com', key: '432 064'),
  //   AccountList(domain: 'aspans.com', key: '286 145'),
  //   AccountList(domain: 'tes.com', key: '286 145'),
  // ];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) => initDomainsInPref());
    // initDomainsInPref();
    // loadList();
    checkLoginStatus();

    // startTimer();
    randomNumber();
  }

  // loadList() async {
  //   await initDomainsInPref();
  // }

  initDomainsInPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var domains = prefs.getString("domains");
    // accounts = jsonDecode(domains!);
    // var json = jsonEncode(accounts);
    // final List<AccountList> accounts = jsonDecode(domains!);

    // var tagObjsJson = jsonDecode(domains!) as List;
    var tagObjsJson = jsonDecode(domains!);

    for (var i = 0; i < tagObjsJson.length; i++) {
      accounts.add(AccountList(
          domain: tagObjsJson[i]['domain'], key: tagObjsJson[i]['key']));
      print(accounts);
    }

    // List<AccountList> accounts =
    //     tagObjsJson.map((tagJson) => AccountList.fromJson(tagJson)).toList();
    // // print('JSON: $json');
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        seconds--;
      });
    });
  }

  randomNumber() {
    Random random = new Random();
    int randomNumber = random.nextInt(900000) + 100000;
    print('$randomNumber');
  }

  Future<Widget> createTile(var seconds, maxSeconds, randomNumber) async {
    await initDomainsInPref();

    return Future.value(Container(
        padding: EdgeInsets.only(top: 8, bottom: 10, left: 30, right: 30),
        child: SingleChildScrollView(
            child: accounts.isNotEmpty
                ? ListView.builder(
                    key: UniqueKey(),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: accounts.length,
                    itemBuilder: (context, int i) {
                      return DomainCard(accounts[i].domain, accounts[i].key, seconds, maxSeconds);
                    })
                : SizedBox())));
  }

  checkLoginStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => loginPage()),
          (Route<dynamic> route) => false);

      // Map userMap = jsonDecode(sharedPreferences.getString('domain')!);
      // var user = AccountList.fromJson(userMap);
      // print(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sideBar(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Colors.blue, Colors.teal],
            )),
          ),
          title: Text('Aspans Authenticator'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Container(
            // child: createTile(seconds, maxSeconds, randomNumber),
            child: FutureBuilder(
                future: initDomainsInPref(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Container(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 10, left: 25, right: 25),
                      child: SingleChildScrollView(
                          child: accounts.isNotEmpty
                              ? ListView.builder(
                                  key: UniqueKey(),
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: accounts.length,
                                  itemBuilder: (context, int i) {
                                    return DomainCard(
                                        accounts[i].domain, accounts[i].key, seconds, maxSeconds);
                                  })
                              : SizedBox()));
                })
            // createNewTile(seconds, maxSeconds, randomNumber),
            ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.teal,
          spacing: 6,
          animatedIcon: AnimatedIcons.menu_close,
          buttonSize: Size(60.0, 60.0),
          childrenButtonSize: Size(60.0, 60.0),
          elevation: 10,
          children: [
            SpeedDialChild(
                child: Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
                label: 'Сканировать QR-код',
                backgroundColor: Colors.teal,
                onTap: () {
                 Navigator.push(context,
                      MaterialPageRoute(builder: (context) => qrScanner()));
                }),
            SpeedDialChild(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: 'Добавить аккаунт',
                backgroundColor: Colors.teal,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addAccount()));
                }),
          ],
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Aspans'
        'Automation'
        'Car'
        'Football'
  ];

  @override
  List<Widget> buildActions(BuildContext) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
