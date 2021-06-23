class MuseumModel {
  String nama;
  String kota;
  String provinsi;
  String imgHeader;
  String deskripsi;
  String alamat;
  String htm;
  // List<String> imgGaleri;
  List<String> persyaratan;
  String noTelepon;
  String email;
  String website;

  MuseumModel(
    {this.nama, this.kota, this.provinsi, this.imgHeader, this.deskripsi, this.alamat, this.htm, this.persyaratan, this.noTelepon, this.email, this.website}
  );
}