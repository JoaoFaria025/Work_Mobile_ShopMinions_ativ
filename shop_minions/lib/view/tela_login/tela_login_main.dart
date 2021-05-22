import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_minions/view/tela_login_atvd4/tela_atvd4.dart';
import 'package:shop_minions/view/tela02/tela02_main.dart';

class MainTelaLogin extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Atvd.4",
                  style: TextStyle(
                      color: Color.fromRGBO(12, 59, 102, 1),
                      fontSize: 30,
                      fontFamily: 'Bree Serif'),
                ),
                Image.asset('assets/images/logo_app_bar.png'),
              ],
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.shopping_bag_outlined), text: 'Login'),
                Tab(icon: Icon(Icons.people), text: 'Visualizar Dados'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MainTelaAtvd4(),
              MainTela02(),
            ],
          ),
        ));
  }
}
