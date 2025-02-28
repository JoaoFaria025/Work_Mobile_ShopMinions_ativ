import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_minions/logic/manage_db/manage_db_event.dart';
import 'package:shop_minions/logic/manage_db/manage_local_db_bloc.dart';
import 'package:shop_minions/view/Tab_Bar_layout.dart';
import 'package:shop_minions/model/login.dart';

import 'package:shop_minions/view/tela_cadastro/tela_cadastro_main.dart';

class MainTelaAtvd4 extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Login login_insert = new Login();

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/img-login.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 330),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(116, 128, 139, 1),
                            size: 30,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                          ),
                          usernameFormFieldEmail('Email', false, login_insert),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Color.fromRGBO(116, 128, 139, 1),
                            size: 30,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                          ),
                          usernameFormFieldSenha('Senha', true, login_insert),
                        ],
                      ),
                      SizedBox(height: 50),
                      submitButton(context, login_insert),
                      SizedBox(height: 10),
                      gestureLink(context),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context, Login login_insert) {
    return SizedBox(
      height: 50,
      width: 380,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Color.fromRGBO(43, 105, 161, 1)),
          ),
          color: Color.fromRGBO(43, 105, 161, 1),
          textColor: Colors.white,
          child: Text("Fazer Login".toUpperCase(),
              style: TextStyle(fontSize: 20, fontFamily: 'PT Sans Bold')),
          onPressed: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              BlocProvider.of<ManageLocalBloc>(context)
                  .add(SubmitEvent(login: login_insert));
            }
          }),
    );
  }

  Widget gestureLink(BuildContext context) {
    return GestureDetector(
      child: Text(
        "Registre-se aqui",
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
            fontSize: 16),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyTelaCadastro()),
        );
      },
    );
  }

  Widget usernameFormFieldEmail(valuetxt, obscure, Login login_insert) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        obscureText: obscure,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontFamily: 'PT Sans bold',
          fontSize: 20,
          color: Color.fromRGBO(116, 128, 139, 1),
        ),
        decoration: InputDecoration(
          hintText: '$valuetxt',
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value.length == 0) {
            return "Adicione seu email";
          }
          return null;
        },
        onSaved: (value) {
          login_insert.email = value;
        },
      ),
    );
  }

  Widget usernameFormFieldSenha(valuetxt, obscure, Login login_insert) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        obscureText: obscure,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontFamily: 'PT Sans bold',
          fontSize: 20,
          color: Color.fromRGBO(116, 128, 139, 1),
        ),
        decoration: InputDecoration(
          hintText: '$valuetxt',
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value.length == 0) {
            return "Adicione seu usuario";
          }
          return null;
        },
        onSaved: (value) {
          login_insert.senha = value;
        },
      ),
    );
  }
}
