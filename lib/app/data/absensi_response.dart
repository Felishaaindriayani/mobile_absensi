class absensi_response {
  bool? success;
  List<Data>? data;

  absensi_response({this.success, this.data});

  absensi_response.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idUser;
  String? tanggal;
  String? jamMasuk;
  String? jamKeluar;
  String? status;
  String? jamKerja;
  String? photo;
  String? createdAt;
  String? updatedAt;
  Pegawai? pegawai;

  Data(
      {this.id,
      this.idUser,
      this.tanggal,
      this.jamMasuk,
      this.jamKeluar,
      this.status,
      this.jamKerja,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.pegawai});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    tanggal = json['tanggal'];
    jamMasuk = json['jam_masuk'];
    jamKeluar = json['jam_keluar'];
    status = json['status'];
    jamKerja = json['jam_kerja'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pegawai =
        json['pegawai'] != null ? new Pegawai.fromJson(json['pegawai']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['tanggal'] = this.tanggal;
    data['jam_masuk'] = this.jamMasuk;
    data['jam_keluar'] = this.jamKeluar;
    data['status'] = this.status;
    data['jam_kerja'] = this.jamKerja;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pegawai != null) {
      data['pegawai'] = this.pegawai!.toJson();
    }
    return data;
  }
}

class Pegawai {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  int? idJabatan;
  int? nip;
  int? telepon;
  String? jenisKelamin;
  String? tempatLahir;
  String? tglLahir;
  int? statusPegawai;
  String? agama;
  String? alamat;
  String? profile;
  String? createdAt;
  String? updatedAt;

  Pegawai(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.idJabatan,
      this.nip,
      this.telepon,
      this.jenisKelamin,
      this.tempatLahir,
      this.tglLahir,
      this.statusPegawai,
      this.agama,
      this.alamat,
      this.profile,
      this.createdAt,
      this.updatedAt});

  Pegawai.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    idJabatan = json['id_jabatan'];
    nip = json['nip'];
    telepon = json['telepon'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    statusPegawai = json['status_pegawai'];
    agama = json['agama'];
    alamat = json['alamat'];
    profile = json['profile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['id_jabatan'] = this.idJabatan;
    data['nip'] = this.nip;
    data['telepon'] = this.telepon;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tgl_lahir'] = this.tglLahir;
    data['status_pegawai'] = this.statusPegawai;
    data['agama'] = this.agama;
    data['alamat'] = this.alamat;
    data['profile'] = this.profile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}