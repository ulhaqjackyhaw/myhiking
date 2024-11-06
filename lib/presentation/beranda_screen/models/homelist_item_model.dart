// import 'package:equatable/equatable.dart';
// import '../../../core/app_export.dart';

// /// This class is used in the [homelist_item_widget] screen.
// // ignore_for_file: must_be_immutable
// class HomelistItemModel extends Equatable {
//   HomelistItemModel({
//     this.namaGunung = '',
//     this.image = '',
//     // this.gunungmerbabu,
//     this.jawatengah,
//     // this.id,
//   }) {
//     namaGunung = namaGunung ?? "Malang, Central Java, Indonesia";
//     image = image ?? ImageConstant.imgImage;
//     // gunungmerbabu = gunungmerbabu ?? "Gunung Merbabu";
//     jawatengah = jawatengah ?? "Jawa Tengah";
//     // id = id ?? "";
//   }

//   String? namaGunung;
//   String? image;
//   // String? gunungmerbabu;
//   String? jawatengah;
//   // String? id;
//   factory HomelistItemModel.fromJson(Map<String, dynamic> json) {
//     return HomelistItemModel(
//       namaGunung: json['nama'],
//       image: json['gambar'], // Pastikan ini sesuai dengan data Anda
//       // gunungmerbabu: json['gunungmerbabu'],
//       jawatengah: json['jawatengah'],
//       // id: json['id'],
//     );
//   }

//   HomelistItemModel copyWith({
//     String? namaGunung,
//     String? image,
//     // String? gunungmerbabu,
//     String? jawatengah,
//     // String? id,
//   }) {
//     return HomelistItemModel(
//       namaGunung: namaGunung ?? this.namaGunung,
//       image: image ?? this.image,
//       // gunungmerbabu: gunungmerbabu ?? this.gunungmerbabu,
//       jawatengah: jawatengah ?? this.jawatengah,
//       // id: id ?? this.id,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         namaGunung,
//         image,
//         // gunungmerbabu,
//         // jawatengah,
//         // id,
//       ];
// }
class HomelistItemModel {
  String? id;
  String? namaGunung;
  String? gambar;
  String? province;

  HomelistItemModel({
    this.id,
    this.namaGunung,
    this.gambar,
    this.province,
  });

  factory HomelistItemModel.fromJson(Map<String, dynamic> json) {
    return HomelistItemModel(
      id: json['id']?.toString(),
      namaGunung: json['nama'] ?? 'Nama Gunung Tidak Tersedia',
      gambar: json['gambar'] ?? 'URL Gambar Tidak Tersedia',
      province: json['province'] ?? 'Provinsi Tidak Tersedia',
    );
  }

  // Mengonversi dari objek model ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': namaGunung,
      'gambar': gambar,
      'province': province,
    };
  }

  // Optional: Mengonversi list JSON ke list model
  static List<HomelistItemModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => HomelistItemModel.fromJson(item)).toList();
  }
}
