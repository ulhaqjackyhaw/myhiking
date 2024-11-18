class Gunung {
  final int id;
  final String nama;
  final String deskripsi;
  final int ketinggian;
  final String province;
  final String gambar;
  final List<Jalur> jalur; // Relasi dengan jalur

  Gunung({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.ketinggian,
    required this.province,
    required this.gambar,
    required this.jalur, // Menerima relasi jalur
  });

  factory Gunung.fromJson(Map<String, dynamic> json) {
    var jalurList = json['jalur'] as List;
    List<Jalur> jalurItems = jalurList.map((i) => Jalur.fromJson(i)).toList();

    return Gunung(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      ketinggian: json['ketinggian'],
      province: json['province'],
      gambar: json['gambar'],
      jalur: jalurItems, // Menyimpan data jalur
    );
  }
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
    required this.biaya,
  });

  // Factory method untuk membuat instance Jalur dari JSON
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
      biaya: json['biaya'],
    );
  }
}

class ApiResponse {
  final bool status;
  final String message;
  final List<Jalur> data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  // Factory method untuk membuat instance ApiResponse dari JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Jalur> jalurList = list.map((i) => Jalur.fromJson(i)).toList();
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: jalurList,
    );
  }
}
