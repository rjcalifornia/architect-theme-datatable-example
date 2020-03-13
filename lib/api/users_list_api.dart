import 'dart:async';
import 'package:http/http.dart' as http;

//const api_v1 = "https://api.myjson.com/bins";
const api_v1 = "http://api.swsocialweb.com/sextan_api/public/api/v1";
//const api_v1 = "http://api.swsocialweb.com/sextan_api/public/api/v1";
String api_v2 = api_v1 + "/save-contact/";

class UsersList {
  static Future getActiveUsers() {
    //var urlUsrList = api_v1 + "/86ekq";
    var urlUsrList = api_v1 + "/show-contacts/";
    return http.get(urlUsrList);
  }

  
}
