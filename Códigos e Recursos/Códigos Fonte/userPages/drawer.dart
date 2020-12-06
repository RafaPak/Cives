import 'package:cives_app/loginPages/home.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.indigo,
          ),
          ListView(
            padding: EdgeInsets.only(left: 30.0, top: 70.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 16.0, 0.0),
                height: 150.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0.0,
                      left: 20.0,
                      child: Image.asset(
                        "images/CivesLogo.png",
                      ),
                    ),
                  ],
                ),
              ),
              buildInkWell(
                  Icons.location_on, "Mapa", context, pageController, 0),
              buildInkWell(Icons.event, "Eventos", context, pageController, 1),
              buildInkWell(
                  Icons.contact_mail, "Perfil", context, pageController, 2),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                    height: 50.0,
                    child: Row(children: <Widget>[
                      Icon(Icons.exit_to_app,
                          size: 32.0,
                          color: pageController.page == 3
                              ? Colors.white
                              : Colors.lightBlue),
                      SizedBox(
                        width: 32.0,
                      ),
                      Text(
                        "Sair",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: pageController.page == 3
                                ? Colors.white
                                : Colors.lightBlue),
                      ),
                    ])),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget buildInkWell(IconData icon, String text, BuildContext context,
    PageController pControl, int page) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
      pControl.jumpToPage(page);
    },
    child: Container(
        height: 50.0,
        child: Row(children: <Widget>[
          Icon(icon,
              size: 32.0,
              color: pControl.page == page ? Colors.white : Colors.lightBlue),
          SizedBox(
            width: 32.0,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 16.0,
                color: pControl.page == page ? Colors.white : Colors.lightBlue),
          ),
        ])),
  );
}
