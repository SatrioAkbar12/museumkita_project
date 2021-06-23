import 'package:museumkita/model/museum_model.dart';

List<MuseumModel> getMuseum() {
  List<MuseumModel> museum = [];
  MuseumModel museumModel = new MuseumModel();

  museumModel.nama = "Museum Bank Rakyat Indonesia";
  museumModel.kota = "Kabupaten Banyumas";
  museumModel.provinsi = "Jawa Tengah";
  museumModel.imgHeader = "museum-bri";
  museumModel.deskripsi = "Museum BRI merupakan bekas gedung lama dan pertama Bank BRI. Museum ini menyimpan banyak sekali koleksi barang dan peralatan yang dulunya dipakai untuk operasional Bank BRI seperti mesin pembukuan dari berbagai merk, pesawat telepon, peti besi, lemari besi, mesin penghitung uang dan lainnya. Ada juga koleksi uang kertas dan koin lama dari berbagai negara. ";
  museumModel.alamat = "Jl. Jend. Soedirman No.57, Pesayangan, Kedungwuluh, Purwokerto Bar., Kabupaten Banyumas, Jawa Tengah";
  museumModel.htm = "5000";
  museumModel.persyaratan = [];
  museumModel.noTelepon = "(0281) 635098";
  museumModel.email = "museumbri@gmail.com";
  museumModel.website = "http://brimuseum.blogspot.com/";
  museum.add(museumModel);
  museumModel = new MuseumModel();

  museumModel.nama = "Museum BPK";
  museumModel.kota = "Magelang";
  museumModel.provinsi = "Jawa Tengah";
  museumModel.imgHeader = "museum-bpk";
  museumModel.deskripsi = "Badan Pemeriksa Keuangan (BPK) membangun sebuah museum yang mencatat sejarah perjalanan lembaga tinggi negara tersebut agar lebih dikenal oleh masyarakat luas. Museum BPK merupakan gedung tua dengan nuansa arsitektur Belanda tersebut pada mulanya merupakan salah satu bagian dari kantor Karesidenan Kedu. Museum ini memiliki koleksi berupa benda hiraldika, buku, grafika, reflika, koleksi hasil abstraksi, etnografika, dan miniatur.";
  museumModel.alamat = "Jl. Pangeran Diponegoro No.1, Magelang, Kec. Magelang Tengah, Kota Magelang, Jawa Tengah";
  museumModel.htm = "Gratis";
  museumModel.persyaratan = [];
  museumModel.noTelepon = "(0293) 310230";
  museumModel.email = "museum.bpkri@bpk.go.id";
  museumModel.website = "https://museum.bpk.go.id/";
  museum.add(museumModel);
  museumModel = new MuseumModel();

  museumModel.nama = "Museum Batik Kota Pekalongan";
  museumModel.kota = "Pekalongan";
  museumModel.provinsi = "Jawa Tengah";
  museumModel.imgHeader = "museum-batik-kota-pekalongan";
  museumModel.deskripsi = "Museum Batik Pekalongan memiliki luas tanah dan bangunan sebesar 40 meter persegi dan memiliki 1149 koleksi batik, antara lain wayang beber dari kain batik yang berusia ratusan tahun dan alat tenun tradisional atau dikenal sebagai alat tenun bukan mesin.";
  museumModel.alamat = "Jl. Jatayu No.3, Panjang Wetan, Pekalongan Utara, Kota Pekalongan, Jawa Tengah";
  museumModel.htm = "2000-10000";
  museumModel.persyaratan = [];
  museumModel.noTelepon = "(0285) 431698";
  museumModel.email = "museum.batik@yahoo.com";
  museumModel.website = "https://museumbatikpekalongan.info/";
  museum.add(museumModel);
  museumModel = new MuseumModel();

  // museumModel.nama = "";
  // museumModel.kota = "";
  // museumModel.provinsi = "";
  // museumModel.imgHeader = "";
  // museumModel.deskripsi = "";
  // museumModel.alamat = "";
  // museumModel.htm = "";
  // museumModel.persyaratan = [];
  // museumModel.noTelepon = "";
  // museumModel.email = "";
  // museumModel.website = "";

  return museum;
}