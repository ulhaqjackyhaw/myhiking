import 'package:myhiking/models/model.dart';

/// This class defines the variables used in the [route_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RouteModel {
  final String name;
  final String description;
  final String basecamp;
  final String village;
  final String district;
  final String regency;
  final String province;
  final int jarak;
  final int biaya;
  final Gunung gunung;

  RouteModel({
    required this.name,
    required this.description,
    required this.basecamp,
    required this.village,
    required this.district,
    required this.regency,
    required this.province,
    required this.jarak,
    required this.biaya,
    required this.gunung,
  });

  /// Membuat `RouteModel` dari objek `ResDetailRouteCentres`
  factory RouteModel.fromResDetailRouteCentres(
      ResDetailRouteCentres resDetailRouteCentres) {
    final jalur = resDetailRouteCentres.jalur;

    return RouteModel(
      name: jalur.nama,
      description: jalur.deskripsi ?? '',
      basecamp: jalur.mapBasecamp ?? '',
      village: jalur.village ?? '',
      district: jalur.district ?? '',
      regency: jalur.regency ?? '',
      province: jalur.province ?? '',
      jarak: jalur.jarak,
      biaya: jalur.biaya,
      gunung: resDetailRouteCentres.gunung, // Data gunung diambil langsung
    );
  }

  /// Konversi `RouteModel` ke Map (untuk kebutuhan JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'basecamp': basecamp,
      'village': village,
      'district': district,
      'regency': regency,
      'province': province,
      'jarak': jarak,
      'biaya': biaya,
      'gunung': gunung.toJson(),
    };
  }
}
