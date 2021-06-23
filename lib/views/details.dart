import 'package:museumkita/data/data_museum.dart';
import 'package:museumkita/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:museumkita/model/museum_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final int indeks;

  Details({
    @required this.indeks
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<CountryModel> country = new List();
  List<MuseumModel> museum = [];

  String bullet = "\u2022";

  @override
  void initState() {
    museum = getMuseum();
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage('assets/image-museum/'+museum[widget.indeks].imgHeader),
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    color: Colors.black12,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                museum[widget.indeks].nama,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    museum[widget.indeks].kota+", "+museum[widget.indeks].provinsi,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  museum[widget.indeks].deskripsi,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff879D95)),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Alamat : ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text(
                        museum[widget.indeks].alamat,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Harga Tiket Masuk : ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.50,
                      child: Text(
                        "Rp. "+museum[widget.indeks].htm,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    ),
                  ]
                )
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Persyaratan : ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff879D95)
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.70,
                      child: museum[widget.indeks].persyaratan.isEmpty ? 
                      Container(
                        child: Text(
                          "Tidak ada persyaratan",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)
                          ),
                        )
                      ) : ListView.builder(
                        itemCount: museum[widget.indeks].persyaratan.length,
                        itemBuilder: (context, index){
                          return Container(
                            child: Text(
                              bullet+" "+museum[widget.indeks].persyaratan[index],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff879D95)
                              ),
                            )
                          );
                        },
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Nomor telepon : ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.60,
                      child: Text(
                        museum[widget.indeks].noTelepon,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    ),
                  ]
                )
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Email : ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text(
                        museum[widget.indeks].email,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    ),
                  ]
                )
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Website : ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff879D95)),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: new InkWell(
                        child: Text(
                          museum[widget.indeks].website,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(160, 160, 255, 1)
                          ),
                        ),
                        onTap: () => launch(museum[widget.indeks].website),
                      ),
                    ),
                  ]
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}