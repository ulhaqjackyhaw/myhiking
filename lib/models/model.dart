import 'dart:convert';

ResRouteCentres resRouteCentresFromJson(String str) =>
    ResRouteCentres.fromJson(json.decode(str));

String resRouteCentresToJson(ResRouteCentres data) =>
    json.encode(data.toJson());

class ResRouteCentres {
  bool status;
  String message;
  List<Jalur> data;

  ResRouteCentres({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResRouteCentres.fromJson(Map<String, dynamic> json) =>
      ResRouteCentres(
        status: json["status"],
        message: json["message"],
        data: List<Jalur>.from(
            json["gunung"]["data"].map((x) => Jalur.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "gunung": {
          "data": List<dynamic>.from(data.map((x) => x.toJson())),
        },
      };
}

class Gunung {
  int id;
  String nama;
  int ketinggian;
  String province;
  List<Jalur> data;

  Gunung({
    required this.id,
    required this.nama,
    required this.ketinggian,
    required this.province,
    required this.data,
  });

  factory Gunung.fromJson(Map<String, dynamic> json) => Gunung(
        id: json["id"],
        nama: json["nama"],
        ketinggian: json["ketinggian"],
        province: json["province"],
        data: List<Jalur>.from(json["data"].map((x) => Jalur.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "ketinggian": ketinggian,
        "province": province,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Jalur {
  final int id;
  final String nama;
  final String deskripsi;
  final String mapBasecamp;
  final String village;
  final String district;
  final String regency;
  final String province;
  final int jarak;
  final int biaya;

  Jalur({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.mapBasecamp,
    required this.village,
    required this.district,
    required this.regency,
    required this.province,
    required this.jarak,
    required this.biaya,
  });

  factory Jalur.fromJson(Map<String, dynamic> json) {
    return Jalur(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      mapBasecamp: json['map_basecamp'],
      village: json['village'],
      district: json['district'],
      regency: json['regency'],
      province: json['province'],
      jarak: json['jarak'],
      biaya: json['biaya'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'deskripsi': deskripsi,
      'map_basecamp': mapBasecamp,
      'village': village,
      'district': district,
      'regency': regency,
      'province': province,
      'jarak': jarak,
      'biaya': biaya,
    };
  }
}

class ApiResponse {
  final bool status;
  final String message;
  final Gunung gunung;

  ApiResponse({
    required this.status,
    required this.message,
    required this.gunung,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      gunung: Gunung.fromJson(json['gunung']),
    );
  }
}
