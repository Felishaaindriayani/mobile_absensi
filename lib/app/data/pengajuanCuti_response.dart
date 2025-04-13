class pengajuanCuti_response {
  bool? status;
  String? message;
  List<Data>? data;

  pengajuanCuti_response({this.status, this.message, this.data});

  pengajuanCuti_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idUser;
  String? tanggalPengajuan;
  String? kategoriCuti;
  String? tanggalMulai;
  String? tanggalSelesai;
  String? alasan;
  String? status;
  String? createdAt;
  String? updatedAt;
  Pegawai? pegawai;

  Data(
      {this.id,
      this.idUser,
      this.tanggalPengajuan,
      this.kategoriCuti,
      this.tanggalMulai,
      this.tanggalSelesai,
      this.alasan,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pegawai});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    tanggalPengajuan = json['tanggal_pengajuan'];
    kategoriCuti = json['kategori_cuti'];
    tanggalMulai = json['tanggal_mulai'];
    tanggalSelesai = json['tanggal_selesai'];
    alasan = json['alasan'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pegawai =
        json['pegawai'] != null ? new Pegawai.fromJson(json['pegawai']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['tanggal_pengajuan'] = this.tanggalPengajuan;
    data['kategori_cuti'] = this.kategoriCuti;
    data['tanggal_mulai'] = this.tanggalMulai;
    data['tanggal_selesai'] = this.tanggalSelesai;
    data['alasan'] = this.alasan;
    data['status'] = this.status;
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
