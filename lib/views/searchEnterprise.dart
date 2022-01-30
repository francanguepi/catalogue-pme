import 'package:flutter/material.dart';
import 'package:catalogue_pme/globalVariable.dart' as variable;
import 'package:catalogue_pme/views/catalogueEntreprise.dart';


class SearchEnterprise extends StatelessWidget {
  double largeur;

  @override
  Widget build(BuildContext context) {
    largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: variable.blueMainColor,
        title: new Image.asset(
          'images/logo-long.png',
          height: 99.0,
          width: 100.0
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.white)
          ),
          IconButton(
              icon: Icon(Icons.sms_rounded, color: Colors.white)
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white)
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/entreprise.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(29, 80, 135, 0.9),
                      Color.fromRGBO(29, 80, 135, 0.9),
                      Color.fromRGBO(29, 80, 135, 0.9),
                      Color.fromRGBO(29, 80, 135, 0.9),
                      Color.fromRGBO(29, 80, 135, 0.9),
                    ]
                )
            ),
            child: SearchEnterpriseStatefulWidget(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: variable.blueMainColor,
        unselectedItemColor: Colors.black54,
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Consulting'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('High-Tech'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('E-Com'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Télécom'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Génie Civil'),
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}


class SearchEnterpriseStatefulWidget extends StatefulWidget{
  const SearchEnterpriseStatefulWidget({Key key}) : super(key: key);

  @override
  State<SearchEnterpriseStatefulWidget> createState() => _SearchEnterpriseStatefulWidget();
}


class _SearchEnterpriseStatefulWidget extends State<SearchEnterpriseStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 100
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Faites croître la visibilité de votre Entreprise',
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 100),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildSearch(context),
              //buildSearchBtn(),
            ],
          ),
          SizedBox(height: 100),
          new Text(
            "Rejoignez une multitude d'entreprises et touchez une plus "
                "grande cible grâce à notre performance",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }


  Widget buildSearch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          //width: (largeur*5.5)/8,
          width: 300,
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
              _displaySearchDialog(context);
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CatalogueEntreprise()));

              //print('francaa');
            },
          ),
        )
      ],
    );
  }

  Widget buildSearchBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      //width: largeur/8,
      child: RaisedButton(
        color: Colors.red,
        elevation: 3,
        //onPressed: ()=>,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'S',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Future<void> _displaySearchDialog(BuildContext context) async{
    return showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          title: Text(
            'Filtres',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildTitleOptions('régions'),
                    SizedBox(height: 5),
                    buildDropDownRegion(),
                    SizedBox(height: 15),
                    buildTitleOptions('villes'),
                    buildRegionCheBox(),
                    SizedBox(height: 15),
                    buildTitleOptions('catégories'),
                    SizedBox(height: 5),
                    buildDropDownCategory(),
                    SizedBox(height: 35),
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              width: 230,
              child: RaisedButton(
                color: variable.blueMainColor,
                elevation: 3,
                onPressed: ()=>{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CatalogueEntreprise()))
                },
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Appliquer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(width: 10)
          ],
        );
      }
    );
  }

  Widget buildDropDownCategory(){
    List<String> categoriesList = ['Toutes', 'Génie Civil', 'IT', 'Ressources humaines'];
    String dropdownValue = 'Toutes';
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0,2)
            )
          ]
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        /*hint: Text('Toutes'),
      dropdownColor: Colors.red,*/
        icon: Icon(Icons.arrow_drop_down, color: Colors.black87),
        iconSize: 25,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(
          color: Colors.black87,
          //fontSize: 15
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: categoriesList.map<DropdownMenuItem<String>>((String valueItem) {
          return DropdownMenuItem<String>(
              value: valueItem,
              child: Text(valueItem));
        }).toList(),
      ),
    );
  }

  Widget buildTitleOptions(String title){
    return new Text(
        title,
        //textAlign: TextAlign.left,
        style: TextStyle(
            color: variable.blueMainColor,
            fontWeight: FontWeight.bold
        )
    );

  }

  Widget buildDropDownRegion(){
    List<String> regionList = ['Littoral', 'Centre', 'Sud', 'Nord', 'Adamaoua'];
    String dropdownValue = 'Littoral';
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0,2)
            )
          ]
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        /*hint: Text('Toutes'),
      dropdownColor: Colors.red,*/
        icon: Icon(Icons.arrow_drop_down, color: Colors.black87),
        iconSize: 25,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(
          color: Colors.black87,
          //fontSize: 15
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
            print(dropdownValue);
          });
        },
        items: regionList.map<DropdownMenuItem<String>>((String valueItem) {
          return DropdownMenuItem<String>(
              value: valueItem,
              child: Text(valueItem));
        }).toList(),
      ),
    );
  }

  Widget buildRegionCheBox() {
    /*List<String> townList= ['Yaoundé', 'Douala', 'Limbé', 'Bafoussam', 'Buea',
      'Ebolowa', 'Monatele', 'Dschang', 'Baganté'];*/
    List<String> townList= ['Yaoundé', 'Douala', 'Limbé'];
    return Column(
      children: <Widget>[
        for(var i = 0; i <townList.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: i == 1 ? true : false,
              ),
              Text(
                  townList[i],
                  style: TextStyle(
                      color: variable.blueMainColor
                  )
              )
            ],
          ),
        SizedBox(height: 5),
      ],
    );
  }
}



