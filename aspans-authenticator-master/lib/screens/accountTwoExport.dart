import 'package:flutter/material.dart';
import 'package:aspans_authenticator/screens/sideBar.dart';
import 'package:aspans_authenticator/screens/mainPage.dart';

class accountTwoExport extends StatefulWidget {
  const accountTwoExport({Key? key}) : super(key: key);

  @override
  _accountTwoExport createState() => _accountTwoExport();
}

class _accountTwoExport extends State<accountTwoExport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('3 из 3', style: TextStyle(color: Colors.black54, fontSize: 20),),
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              setState(() {});
              // Get.to(mainPage());

              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => mainPage()));
                setState(() {
                  
                });
                Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
              },
              child: Text("ОТМЕНА", style: TextStyle(fontSize: 14, color: Colors.black54),),
            )
          ],
        ),
        body: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Row(children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.blueAccent,
                          ),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'trustedcoin.com',
                            style: TextStyle(fontSize: 18),
                          ),
                        ]),
                        // Padding(padding: EdgeInsets.only(left: 20)),
                        Container(
                          margin: EdgeInsets.only(left: 43, right: 10),
                          padding: EdgeInsets.only(right: 175, top: 20),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom:
                                BorderSide(color: Colors.grey, width: 0.25),
                          )),
                          //   child: Column(
                          //   children: [
                          //     Text('trustedcoin.com', style: TextStyle(fontSize: 18),),
                          //   ],
                          // ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20))
                      ],
                      
                    ),
                    Column(
                      children: [
                        Row(children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.blueAccent,
                          ),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'aspans.com',
                            style: TextStyle(fontSize: 18),
                          ),
                        ]),
                        // Padding(padding: EdgeInsets.only(left: 20)),
                        Container(
                          margin: EdgeInsets.only(left: 43, right: 10),
                          padding: EdgeInsets.only(right: 175, top: 20),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom:
                                BorderSide(color: Colors.grey, width: 0.25),
                          )),
                          //   child: Column(
                          //   children: [
                          //     Text('trustedcoin.com', style: TextStyle(fontSize: 18),),
                          //   ],
                          // ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20))
                      ],
                    ),
                    Column(
                      children: [
                        Row(children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.blueAccent,
                          ),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'anton@gmail.com',
                            style: TextStyle(fontSize: 18),
                          ),
                        ]),
                        // Padding(padding: EdgeInsets.only(left: 20)),
                        Container(
                          margin: EdgeInsets.only(left: 43, right: 10),
                          padding: EdgeInsets.only(right: 175, top: 20),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom:
                                BorderSide(color: Colors.grey, width: 0.25),
                          )),
                          //   child: Column(
                          //   children: [
                          //     Text('trustedcoin.com', style: TextStyle(fontSize: 18),),
                          //   ],
                          // ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20))
                  ],
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.blueAccent
                      // ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          color: Colors.white),
                      child: TextButton.icon(
                        icon: Icon(Icons.download),
                        label: Text(
                          'Экспорт',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 17.0, right: 17, top: 10, bottom: 10),
                          // backgroundColor: Colors.white
                        ),
                        onPressed: () {},
                      ),
                      margin: EdgeInsets.only(bottom: 25),
                    ),
                  ],
                ),
                // Padding(padding: EdgeInsets.only(bottom: 5),)
              ],
            )));
  }
}
