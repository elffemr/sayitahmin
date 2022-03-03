import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahmin/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "" ;

  @override
  void initState() {

    super.initState();
    rastgeleSayi=Random().nextInt(101); // 0 -100 arasında sayı üretir
    print("rastgele sayi : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.pink,
        title: Text("Tahmin Ekrani"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                  Text("Kalan Hak : $kalanHak",style: TextStyle(color: Colors.pink,fontSize: 30),),
                  Text("Yardım : $yonlendirme",style: TextStyle(color: Colors.black,fontSize: 20),),
            TextField(
              controller: tfTahmin, //textfield içerisinde bilgi okumak için
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Tahmin Et",
                floatingLabelStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 22,

                ) ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                icon: Icon(Icons.favorite),
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),

                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tahmin Et",textAlign: TextAlign.center,),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  shadowColor: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),

                ),

                onPressed: (){

                  setState(() {
                    kalanHak = kalanHak-1;

                  });
                  int tahmin = int.parse(tfTahmin.text);
                  if(tahmin== rastgeleSayi){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true)));
                    return;
                  }

                  if(tahmin > rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmini azalt";
                    });
                  }
                  if(tahmin < rastgeleSayi){
                    setState(() {
                      yonlendirme="Tahmini arttır";
                    });
                  }
                  if(kalanHak==0){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false)));
                  }
                  tfTahmin.text=""; //her tahminden sonra text kısmını temizlemek için

                },
              ),

            ),
          ],
        ),
      ),


    );
  }
}
