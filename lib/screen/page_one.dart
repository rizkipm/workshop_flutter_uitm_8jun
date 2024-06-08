import 'package:flutter/material.dart';
import 'package:uitm_8jun/screen/page_achievement.dart';
import 'package:uitm_8jun/screen/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text('UiTM Melaka',
          style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor : Colors.purple,
      ),

      //child : ini hanya mampu menampung 1 widhet
        //children : ini mampu put more than 1 widget
        //JSON : Javascript object notation
        //XML : xml file
        //step :
        //dapatkan webservice beserta endpoint
        //respond JSON --> POSTMAN atau imsomesia
        //Generate model dari respond JSON
        //get data atau wrap data dari flutter project

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset('gambar/logo.png', height: 100,),
          SizedBox(height: 10,),
          Container(
            child: Center(
              child: Text('Welcome to UiTM Melaka',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: MaterialButton(
                onPressed: (){
                  //untuk move to the next page
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                    => PageTwo()
                  ));
                },
                child: Text('Our Profile',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: MaterialButton(
                  onPressed: (){
                    //untuk move to the next page
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    => PageAchievement()
                    ));
                  },
                  child: Text('Our Achievement',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple,
                )
            ),
          ),
        ],
      )
    );
  }
}
