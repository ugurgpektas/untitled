import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



final _formkey = GlobalKey<FormState>();
int _deger=10;

class HesaplamaSayfasi extends StatelessWidget {
  const HesaplamaSayfasi({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            //autovalidateMode: AutovalidateMode.always,
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Title(
                  color: Colors.blueGrey,
                  child: const Text("2022 YILI ELEKTRİK FATURASI HESAPLAMA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueGrey)),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent.shade100),
                  //color: Colors.amberAccent,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    //initialValue: 0.toString(),
                    validator: (deger) {

                      if (deger!.length < 2 ) {
                        return " LÜTFEN 2 basamaklı DEGER GİRİNİZ ";
                      } else {
                        return null;
                      }
                    },


                    onSaved: (deger) {
                       deger = _deger as String;
                    },
                    decoration:
                    const InputDecoration(
                        hintText: "Elektrik Tüketim miktarını Kwh olarak giriniz"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent.shade100),
                  //color: Colors.amberAccent,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  child: TextButton(
                    onPressed: (){
                      bool _validation = _formkey.currentState!.validate();
                      if(_validation){
                        _formkey.currentState!.save();
                      }
                    },
                    child: const Text(
                      "HESAPLA",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

    /*  Kaydet() {
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();

    }
  }
}*/
