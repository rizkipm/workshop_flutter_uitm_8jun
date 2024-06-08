import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uitm_8jun/models/model_university.dart';

class PageListUniversity extends StatefulWidget {
  const PageListUniversity({super.key});

  @override
  State<PageListUniversity> createState() => _PageListUniversityState();
}

class _PageListUniversityState extends State<PageListUniversity> {

  Future<List<Datum>?> getData() async{
    try{
      //localhost:8080/server_university/getData.php
      //192.168.1.3
      http.Response res = await http.get(Uri.parse
        ('http://192.168.1.3:8080/server_university/getData.php'));
      return modelDataUniversityFromJson(res.body).data;
    }catch(e){
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List University',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index){
                Datum? data = snapshot.data?[index];
                return Padding(padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: (){
                      //untuk detail page
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network('http://192.168.1.3:8080/server_university/images/${data?.univImage}',
                              height: 35,
                              fit: BoxFit.fill,
                            ),
                            Divider(),
                            Text('${data?.univName}', style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),),
                            Text('${data?.univAddress}', style: TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }else if (snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(color: Colors.purple,)
            );
          }
        },
      ),
    );
  }
}
