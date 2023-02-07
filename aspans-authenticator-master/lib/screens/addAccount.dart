import 'package:flutter/material.dart';
import 'package:aspans_authenticator/screens/mainPage.dart';
import 'package:aspans_authenticator/actions/createTile.dart';
import 'package:aspans_authenticator/models/account_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:get/get.dart';

class addAccount extends StatefulWidget {
  const addAccount({Key? key}) : super(key: key);

  @override
  _addAccountState createState() => _addAccountState();
}

class _addAccountState extends State<addAccount> {
  var _textControllerLogin = new TextEditingController();
  var _textControllerKey = new TextEditingController();
  bool _isLoading = false;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController keyController = new TextEditingController();

  var _controller = TextEditingController();

  String dropdownValue = 'По времени';
  var items = ['По времени', 'По счетчику'];

  late String domain;
  late String key;

  @override
  Widget build(BuildContext context) {
    // emailController.addListener(() {
    //   setState(() {});
    // });
    // keyController.addListener(() {
    //   setState(() {});
    // });
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              setState(() {
                    
                  });
                  // Get.to(mainPage());
                  
                  Future.delayed(Duration.zero, () {
                    Navigator.pop(context);
                  });
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Введите данные аккаунта',
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          child: ListView(
            children: <Widget>[textFieldSection(), buttonSection()],
          ),
        ));
  }

  Container textFieldSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: false,
            controller: emailController,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: "Аккаунт",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54)),
                hintStyle: TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.black12,
                suffixIcon: emailController.text.length > 0
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          emailController.clear();
                        },
                      )
                    : null),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          TextFormField(
              controller: keyController,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Ключ",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                  hintStyle: TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.black12,
                  suffixIcon: keyController.text.length > 0
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            keyController.clear();
                          },
                        )
                      : null)),
        ],
      ),
    );
  }

  Container buttonSection() {
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // DecoratedBox(
          //   decoration: ShapeDecoration(
          //     color: Colors.white,
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.black12),
          //       borderRadius: BorderRadius.all(Radius.circular(4.0)),
          //     ),
          //   ),
          //   child: Padding(

          //     padding: const EdgeInsets.only(left: 14.0, right: 14, top: 0,  bottom: 0),
          //     child:
          Container(
            width: 130,
            height: 40,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(4.0))),
            // width: 100,
            child: DropdownButton(
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              underline: Container(
                  // height: 0,
                  ),
              value: dropdownValue,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.blueAccent,
              ),
              items: items.map((String items) {
                return DropdownMenuItem(
                  // alignment: Alignment.center,
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          ),

          // ),
          // ),
          Container(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  // side: BorderSide(color: Colors.red)
                ))),
                onPressed: () async {
                  // addTile(emailController);
                  await addToArray(emailController.text, keyController.text);
                //  await initDomainsInPref();
                  setState(() {
                    
                  });
                  // Get.to(mainPage());
                  
                  Future.delayed(Duration.zero, () {
                    Navigator.pop(context);
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => mainPage()));
                },
                child: Text(
                  'Добавить',
                  style: TextStyle(fontSize: 14),
                ),
              )),
        ],
      ),
    );
  }

  Future<void> addToArray(String domain, String key) async {
    print(domain);
    print(key);

    List<dynamic> accounts = [];
    SharedPreferences pref = await SharedPreferences.getInstance();

    var domains = pref.getString("domains");
    print('asd: $domains');

    accounts = jsonDecode(domains!);

    accounts.add(
      AccountList(domain: domain, key: key)
    );

    // // var encodedAccounts = jsonEncode(accounts);
    // // print(encodedAccounts);
    String json = jsonEncode(accounts);
    pref.setString('domains', json);
    print('JSON: $json');

    
    // pref.setString("domain", json);
    // Map decode_options = jsonDecode(json);
    //         String user = jsonEncode(AccountList.fromJson(decode_options));
    //         pref.setString('domain', user);
  }

}
