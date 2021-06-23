import 'package:museumkita/data/data_museum.dart';
import 'package:museumkita/model/museum_model.dart';
import 'package:museumkita/views/details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MuseumModel> museum = [];

  @override
  void initState() {
    museum = getMuseum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Container(
            padding: EdgeInsets.all(7),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Image.asset(
                "assets/menu.png",
                height: 20,
                width: 20,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 30,
            ),
            Text(
              "Museum Kita",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 30,
                  ),
                  Text(
                    " Museum Kita",
                    style:
                      TextStyle(
                        color: Colors.black54, 
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                      ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Menu Utama",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4E6059)
                ),
              ),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => Home()
                  )
                );
              },
            ),
            ListTile(
                title: Text(
                  "Credit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4E6059)
                  ),
                ),
              )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Temukan museum pilihanmu",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 240,
                child: ListView.builder(
                    itemCount: museum.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MuseumListTile(
                        nama: museum[index].nama,
                        kota: museum[index].kota,
                        provinsi: museum[index].provinsi,
                        imgHeader: museum[index].imgHeader,
                        indeks: index,
                      );
                    }),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "List Museum",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: museum.length,
                itemBuilder: (context, index) {
                  return ListMuseum(
                    nama: museum[index].nama,
                    kota: museum[index].kota,
                    provinsi: museum[index].provinsi,
                    imgHeader: museum[index].imgHeader,
                    indeks: index,
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListMuseum extends StatelessWidget {
  final int indeks;
  final String imgHeader;
  final String nama;
  final String kota;
  final String provinsi;
  // final double rating;
  
  ListMuseum({
    @required this.indeks,
    @required this.imgHeader,
    @required this.nama,
    @required this.kota,
    @required this.provinsi
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => Details(indeks: indeks)
            )
          );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Image(
                image: AssetImage('assets/image-museum/'+imgHeader),
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4E6059)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    kota+', '+provinsi,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff89A097)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MuseumListTile extends StatelessWidget {
  final String nama;
  final String kota;
  final String provinsi;
  final String imgHeader;
  final int indeks;

  MuseumListTile({
    @required this.nama,
    @required this.kota,
    @required this.provinsi,
    @required this.imgHeader,
    @required this.indeks
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => Details(indeks: indeks)
            )
          );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage('assets/image-museum/'+imgHeader),
                height: 220,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              height: 220,
              width: 150,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              child: Text(
                                nama,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 120,
                              child: Text(
                                kota,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}