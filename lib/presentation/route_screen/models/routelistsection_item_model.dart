import 'package:equatable/equatable.dart';
import 'package:myhiking/models/model.dart';
import '../../../core/app_export.dart';

/// This class is used in the [routelistsection_item_widget] screen.
// ignore_for_file: must_be_immutable
class RoutelistsectionItemModel extends Equatable {
  RoutelistsectionItemModel({
    this.id,
    this.nama,
    this.deskripsi,
    this.mapBasecamp,
    this.village,
    this.district,
    this.regency,
    this.province,
    this.jarak,
    this.biaya,
    this.gunung, // Menambahkan objek gunung
  });

  final int? id; // id jalur
  final String? nama; // nama jalur
  final String? deskripsi; // deskripsi jalur
  final String? mapBasecamp; // basecamp jalur
  final String? village; // desa
  final String? district; // kecamatan
  final String? regency; // kabupaten
  final String? province; // provinsi
  final double? jarak; // jarak jalur
  final int? biaya; // biaya jalur
  final Gunung? gunung; // Model Gunung

  String get jarakString {
    // Mengonversi jarak ke string dengan format yang sesuai (misalnya, dengan 2 angka di belakang koma)
    return jarak != null ? "${jarak!.toStringAsFixed(2)} km" : "Tidak tersedia";
  }

  RoutelistsectionItemModel copyWith({
    int? id,
    String? nama,
    String? deskripsi,
    String? mapBasecamp,
    String? village,
    String? district,
    String? regency,
    String? province,
    double? jarak,
    int? biaya,
    Gunung? gunung,
  }) {
    return RoutelistsectionItemModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      deskripsi: deskripsi ?? this.deskripsi,
      mapBasecamp: mapBasecamp ?? this.mapBasecamp,
      village: village ?? this.village,
      district: district ?? this.district,
      regency: regency ?? this.regency,
      province: province ?? this.province,
      jarak: jarak ?? this.jarak,
      biaya: biaya ?? this.biaya,
      gunung: gunung ?? this.gunung,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nama,
        deskripsi,
        mapBasecamp,
        village,
        district,
        regency,
        province,
        jarak,
        biaya,
        gunung,
      ];
}
