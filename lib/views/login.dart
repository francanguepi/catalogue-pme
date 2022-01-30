import 'package:flutter/material.dart';
import 'package:catalogue_pme/globalVariable.dart' as variable;
import 'package:catalogue_pme/views/searchEnterprise.dart';
import 'package:flutter/services.dart';
import 'package:catalogue_pme/globalVariable.dart' as variable;

class Login extends StatelessWidget {
  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        //changer et retourner uniquement le container car il n'y a pas de label
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              )
            ]
          ),
          height: 60,
         child: TextField(
           keyboardType: TextInputType.emailAddress,
           style: TextStyle(
             color: Colors.black87,
           ),
           decoration: InputDecoration(
             border: InputBorder.none,
             contentPadding: EdgeInsets.only(top: 14, left: 10, bottom: 14),
             prefixIcon: Icon(
               Icons.email,
               color: Colors.black38,
             ),
             hintText: 'name@domain.com',
             hintStyle: TextStyle(
               color: Colors.black38
             )
           ),
         ),
        )
      ],
    );
  }
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              )
            ]
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 10, bottom: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black38,
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildForgotPassBtn(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Mot de passe oublié"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Mot de passe oublié',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color.fromRGBO(137, 198, 243, 1),
            fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
  Widget buildSignInBtn(){
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print("Inscrivez-vous"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Inscrivez-vous',
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: variable.blueMainColor,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
  Widget buildRememberChechBox(){
    return new Container(
      height: 20,
      child: new Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: new Checkbox(
              value: isRememberMe,
              checkColor: Colors.blue,
              activeColor: Colors.black26,
              /*onChanged: (value) {
                setState(() {
                  isRememberMe = value;
                });
              },*/
            )
          ),
          Text(
            'Se rappeler',
          )
        ],
      ),
    );
  }
  Widget buildLoginBtn(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        color: variable.blueMainColor,
        elevation: 3,
        onPressed: ()=>{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchEnterprise()))
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'Se connecter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        'images/logo-long.png',
                          //height: 250.0,
                          width: 180.0
                      ),
                      new Text(
                        'Veuillez vous connecter ou créer un compte',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 80),
                      buildEmail(),
                      SizedBox(height: 30),
                      buildPassword(),
                      SizedBox(height: 10),
                      buildForgotPassBtn(),
                      buildRememberChechBox(),
                      buildLoginBtn(context),
                      SizedBox(height: 10),
                      new Text("Vous n'avez pas encore de compte"),
                      buildSignInBtn(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


