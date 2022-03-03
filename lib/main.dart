import 'package:flutter/material.dart';
import 'package:sayitahmin/TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlueAccent,
        primarySwatch: Colors.pink,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.pink,
        title: Text("Anasayfa"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                Text("Tahmin Oyunu",style: TextStyle(color: Colors.black,fontSize: 46,),),
              Image.asset("resimler/zar2.png",width: 300,height: 300,),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Oyuna Başla"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),

                ),

                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
              ),

            ),

          ],
        ),
      ),


    );
  }
}
