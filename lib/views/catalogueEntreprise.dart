import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalogue_pme/globalVariable.dart' as variable;
import 'package:flutter/services.dart';
import 'package:catalogue_pme/models/entreprise.dart';

class CatalogueEntreprise extends StatelessWidget {
  String inputState = "false";
  List imagesPath =['images/logos/global.png', 'images/logos/allianz.png',
    'images/logos/beer.png', 'images/logos/broli.png', 'images/logos/camtech.png'];
  List entreprisesName =["GLOBAL IT", "ALLIANZ", "WARFTE BEER", "BROLI", "CAMTECH"];
  var entreprisesList = List<Entreprise>();


  Widget buildSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10, right: 10),
          //width: (largeur*5.5)/8,
          //width: 300,
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
          height: 50,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 10, bottom: 14),
                suffixIcon: Icon(
                  Icons.search,
                  color: variable.blueMainColor,
                ),
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
            onTap: () {
            },
          ),
        )
      ],
    );
  }

  Widget buildListItem(BuildContext context, String imagePath, String entrepriseName){
    double largeur = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            height: 150,
            child: Image.asset(imagePath),
          ),
          Container(
            width: largeur-150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      entrepriseName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //SizedBox(width: 70),
                    Text(
                      'HIGH-TECH',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consecteur odipiscing elit, sed do eiusmod tempor incididunt',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child:  Container(
                    width: 115,
                    height: 30,
                    margin: EdgeInsets.only(left: largeur-265),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: variable.blueMainColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Plus d'infos",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                                decoration: BoxDecoration(
                                  color: variable.blueMainColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 20,
                                height: 20,
                                child: IconButton(
                                  padding: EdgeInsets.only(left: 4, right: 4, top: 1),
                                  icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 13,),
                                )
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                  onTap: (){
                    _displayEntrepriseDetail(context, entrepriseName);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    for(int i =0; i<imagesPath.length; i++){
      entreprisesList.add(new Entreprise(imagesPath[i], entreprisesName[i]));

    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Image.asset(
          'images/logo-long.png',
          height: 99.0,
          width: 100.0
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                /*padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),*/
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    buildSearch(),
                    SizedBox(height: 10),
                    new Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Votre recherche a donné 25 résultats',
                          style: TextStyle(
                            color: Colors.black87
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 15),
                    for(int i =0; i<imagesPath.length; i++)
                      buildListItem(context, imagesPath[i], entreprisesName[i]),
                  ],
                )
              )
            )
          ]
        )
      ),
    );
  }

  Future<void> _displayEntrepriseDetail(BuildContext context, String entrepriseName) async{
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Detail sur ${entrepriseName}',
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 23,
                fontWeight: FontWeight.bold
            ),
          ),
          content: Text(
            'Lorem ipsum dolor sit amet, consecteur odipiscing elit, sed do eiusmod tempor incididunt'
            'Lorem ipsum dolor sit amet, consecteur odipiscing elit, sed do eiusmod tempor incididunt',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                "OK",
                style: TextStyle(
                    color: variable.blueMainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                ),
              )
            ),
            SizedBox(width: 95),
          ],
        );
      }
    );
  }

/*for(int i =0; i<imagesPath.length; i++)
  buildListItem(context, imagesPath[i], entreprisesName[i]),*/
}
