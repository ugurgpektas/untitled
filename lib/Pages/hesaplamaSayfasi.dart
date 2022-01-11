import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

final _formkey = GlobalKey<FormState>();
int _deger = 0;
int _faturaLimit = 150 ;
int _extra = (_deger > _faturaLimit) ? (_deger - _faturaLimit) : 0 ;
double _hamFiyat = (_deger - _extra) * 1.37 ;
double _asmisFiyat = _extra * 2.06 ;
double _toplamFiyat = _hamFiyat + _asmisFiyat ;


class HesaplamaSayfasi extends StatelessWidget {
  const HesaplamaSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Controller(),
      builder: (Controller c) => Scaffold(backgroundColor: Colors.white60,
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
                        if (deger!.length < 2) {
                          return " LÜTFEN EN AZ 2 basamaklı DEGER GİRİNİZ ";
                        } else {
                          return null;
                        }
                      },

                      onSaved: (deger) {
                        _deger = int.tryParse(deger.toString()) ?? 0 ;
                        _extra = (_deger > _faturaLimit) ? (_deger - _faturaLimit) : 0 ;
                        int _hamFiyat = (_deger - _extra) * 1.37 .toInt() ;
                        double _asmisFiyat = _extra * 2.06 ;
                        double _toplamFiyat = (_hamFiyat + _asmisFiyat) ;
                        c.update();
                        print("$_deger");
                        print("$_toplamFiyat");
                        print("$_extra");
                      },
                      decoration: const InputDecoration(
                          hintText:
                              "Elektrik Tüketim miktarını Kwh olarak giriniz"),
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
                      onPressed: () {
                        bool _validation = _formkey.currentState!.validate();
                        if (_validation) {
                          _formkey.currentState!.save();
                          c.update();
                          print("$_deger");
                        }

                      },
                      child: const Text(
                        "HESAPLA",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                              //color: Colors.purple.shade200,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                          child:  ListTile(
                            title: Text("TAHMİNİ ELEKTRİK FATURANIZ",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                          ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //color: Colors.purple.shade200,
                            decoration: BoxDecoration(
                                color: Colors.purple.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child:  ListTile(
                              title: Text("150 Kwh ' a kadar ${_hamFiyat.toString()} TL",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          SizedBox(
                              height: 10
                          ),
                          Container(
                            //color: Colors.purple.shade200,
                            decoration: BoxDecoration(
                                color: Colors.purple.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child:  ListTile(
                              title: Text("150 Kwh aşan fiyat $_extra TL",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //color: Colors.purple.shade200,
                            decoration: BoxDecoration(
                                color: Colors.purple.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child:  ListTile(
                              title: Text("TOPLAM FATURANIZ $_toplamFiyat TL",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
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
