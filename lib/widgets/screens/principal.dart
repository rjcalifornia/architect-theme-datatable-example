import 'package:flutter/material.dart';
import 'package:architect_theme/api/users_list_api.dart';
import 'package:architect_theme/models/users.dart';
import 'package:architect_theme/widgets/ui/dashboard.dart';
import 'dart:async';
import 'dart:convert';



class HomePage extends StatefulWidget {
  // name({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    //var activeUsers = new List<UsersModel>();
    List<UsersModel> _activeUsers;
    Timer timer;
    int counter = 0;
    
    Future _getFromApi() async {
    UsersList.getActiveUsers().then((response) {

      var list = json.decode(response.body);
        List<UsersModel> activeUsers = [];
        for(var u in list)
        {
          UsersModel users = UsersModel(u['id'], u['name'], u['username'], u['email'],u['phone']);
          activeUsers.add(users);
         // print(users.id);

          //      PetrolItem petrol = PetrolItem(u["logo"], u["location"], u["distance"], u["price"], u["facilities"]);

        }
      setState(() {
        

        _activeUsers = activeUsers;
        //activeUsers = list.map((model) => UsersModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getFromApi();
    _activeUsers = [];
    timer = Timer.periodic(Duration(seconds: 100), (Timer t) => _getFromApi());

  }



  @override
  Widget build(BuildContext context) {
    return DashboardWidget(
      pageTitle: '',
     // appBar: GentelellaAppBar(),
      body: SingleChildScrollView(
        child:
        Container(
          color: Color(0xffebedef),
        child: Column(
        children: <Widget>[
          

          Container(
            color: Color(0xfff2f4f5),
            child: Column(
              children: <Widget>[
                Container(
                  padding:  EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                  children: <Widget>[
                    
                    Container(
                       width: 72,
                       height: 72,
                      decoration:  BoxDecoration(
          // borderRadius: BorderRadius.circular(25.0),
          color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[350],
                                    blurRadius: 20.0,
                                    spreadRadius: 0.01,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                     // child: Container(
                        
                       
             //color: Color(0xffffffff),
                        child: Icon(Icons.phone_android),
                     // ),
                    ),
                              ),
                    
                    SizedBox(width: 24,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
Text("Analytics Dashboard", style: TextStyle(fontSize: 24, color: Color(0xff495057)),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
 Text("This is an example dashboard created using build-in elements and components.", style: TextStyle(color: Color(0xff8f9498),fontSize: 11.5,),),
                            ],
                          )
                           
                           
                        ],
                      ),
                    ),
                   
                  ],
                ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
           Container(
            height: MediaQuery.of(context).size.height / 2.5,
            color: Color(0xffebedef),
            
            width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[400],
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(
                                          "https://cdn.pixabay.com/photo/2015/05/28/14/53/ux-788002_1280.jpg",
                                          fit: BoxFit.cover,
                                        ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                   
                    
                  ],
                ),
          ),

  ClipRRect(
  borderRadius: BorderRadius.circular(40.0),
  child: Container(
             //height: MediaQuery.of(context).size.height / 1,
             decoration: new BoxDecoration(
          // borderRadius: BorderRadius.circular(25.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[400],
                                    blurRadius: 5.0,
                                    //spreadRadius: 0.78,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
            width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    
 Container(
    width: double.infinity,
             color: Color(0xffffffff),
             
             padding:  EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 Text('USERS ADDED',
                 style: TextStyle(color: Color(0xff535D76), fontSize: 14.08, fontWeight: FontWeight.w200),
                 ),
                
                
                 
                  DataTable(
             columns: [
               DataColumn(label: Text('ID')),
               DataColumn(label: Text('Name')),
               DataColumn(label: Text('Username')),
               DataColumn(label: Text('Email')),
               DataColumn(label: Text('Phone Number'))
             ],
             rows:
                _activeUsers
               .map(
                 ((user) => DataRow(
                   cells: [
                     DataCell(Text('${user.id}')),
                   DataCell(Text('${user.name}')),
                   DataCell(Text('${user.userName}')),
                   DataCell(Text('${user.email}')),
                   DataCell(Text('${user.phone}')),
                   ],
                 )),
               ).toList(),
                     ),
               ],

             )
                    

             
           ),

                  ],
                ),
          ),

  ),
          
         
          SizedBox(height: 50,)

           
          

        ],
      ),
      )  ),
    );
  
  }
}
