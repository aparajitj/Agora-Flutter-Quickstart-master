import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp2/constant/data.dart';
import 'package:flutterapp2/constant/globals.dart' as globals;
import 'package:http/http.dart' as http;
class certificateGen extends StatefulWidget {
  @override
  _certificateGenState createState() => _certificateGenState();
}

class _certificateGenState extends State<certificateGen> {
  Future<String> profile_info(context) async {
    userID="6";
    String url = globals.url + "getuserprofile";

    http.post(url, body: {
      'userID':userID,


    }).then((http.Response response) async {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error fetching data");
      }
      var responseArray = json.decode(response.body);
      setState(() {
        editEmailID.text=responseArray['data']['uEmail'].toString();
        editContactNumber.text=responseArray['data']['uMobile'].toString();
        editCollege.text=responseArray['data']['uCollegeName'].toString();
        editInstagramLink.text=responseArray['data']['uInstagram'].toString();
        editFacebookLink.text=responseArray['data']['uFacebook'].toString();
        editLinkedLink.text=responseArray['data']['uLinkedin'].toString();
        editName.text=responseArray['data']['uName'].toString();

        editUserProfile.text=responseArray['userprfpic'].toString();
      });

      // customer_name_controller.text=responseArray['data']['uEmail'].toString();


      print(responseArray);

      var status = responseArray['status'];
      /* if(status == 200 || status == "200"){
        notifyTitle = List.generate(responseArray['data'].length, (i) =>responseArray['data'][i]['notifyTitle'].toString());
        notifyLink = List.generate(responseArray['data'].length, (i)=>responseArray['data'][i]['notifyURL'].toString());
      }else{

      }

      print(notifyTitle);
      print(notifyLink);*/
      //pr.show();


    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Container(
        //decoration:
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            SizedBox(height:50),
          Text("Certificate of completion",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Text("Presented to",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          Text(/*editName.text*/"name",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20),
              child: Text("for completing the course getiing started with flutter ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height:50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
            children: <Widget>[
              Text("12.12.2012"),
              Divider(
                color: Colors.black,
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 0,
              ),
              Text('Date',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
            ],
          ),
              Image.asset(
                  'assets/images/gathrr.png',
                  width: 50,
                  height: 50,
                  fit:BoxFit.fill


              ),
              Column(
                children: <Widget>[
                  Text(""),
                  Divider(
                      height: 20,
                      thickness: 5,
                      indent:20
                  ),
                  Text('Signature',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                ],
              )
            ],
          )
          ],
        ),
      )
    );
  }
}
