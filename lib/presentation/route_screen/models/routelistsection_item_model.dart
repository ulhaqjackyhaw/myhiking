import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [routelistsection_item_widget] screen.
// ignore_for_file: must_be_immutable
class RoutelistsectionItemModel extends Equatable {
  RoutelistsectionItemModel({
    this.tinggiOne,
    this.height,
    // Hapus zipcode jika tidak perlu
    // this.zipcode,
    // this.meters,
    // this.id,
  }) {
    tinggiOne = tinggiOne ?? ImageConstant.imgSettings;
    height = height ?? "Tinggi"; // Ubah nilai default jika diperlukan
    // zipcode = zipcode ?? "5Km"; // Hapus atau ubah
    // meters = meters ?? "m";
    // id = id ?? "";
  }

  String? tinggiOne;
  String? height;
  // String? zipcode; // Hapus baris ini
  // String? meters;
  // String? id;

  RoutelistsectionItemModel copyWith({
    String? tinggiOne,
    String? height,
    // String? zipcode, // Hapus baris ini
    // String? meters,
    // String? id,
  }) {
    return RoutelistsectionItemModel(
      tinggiOne: tinggiOne ?? this.tinggiOne,
      height: height ?? this.height,
      // zipcode: zipcode ?? this.zipcode, // Hapus baris ini
      // meters: meters ?? this.meters,
      // id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [tinggiOne, height]; // Hapus zipcode dari props
}
