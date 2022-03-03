import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;


  SonucEkrani({required this.sonuc});



  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,

        title: Text("Sonuç Ekranı"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("resimler/mutluluk.jpg") : Image.asset("resimler/uzgun.jpg"), //true false değerine göre dinamik degisecek
            Text(widget.sonuc ? "kazandınız": "kaybettiniz ", style:TextStyle(color:Colors.pink,fontSize: 36) ,),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar Dene"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),

                ),

                onPressed: (){
                  Navigator.pop(context);
                },
              ),

            ),
          ],
        ),
      ),


    );
  }
}
