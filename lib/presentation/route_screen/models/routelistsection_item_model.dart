import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [routelistsection_item_widget] screen.
// ignore_for_file: must_be_immutable
class RoutelistsectionItemModel extends Equatable {
  RoutelistsectionItemModel({
    this.tinggiOne,
    this.height,
    this.zipcode,
    // this.meters,
    // this.id,
  }) {
    tinggiOne = tinggiOne ?? ImageConstant.imgSettings;
    height = height ?? "Jarak";
    zipcode = zipcode ?? "5Km";
    // meters = meters ?? "m";
    // id = id ?? "";
  }

  String? tinggiOne;
  String? height;
  String? zipcode;
  // String? meters;
  // String? id;

  RoutelistsectionItemModel copyWith({
    String? tinggiOne,
    String? height,
    String? zipcode,
    // String? meters,
    // String? id,
  }) {
    return RoutelistsectionItemModel(
      tinggiOne: tinggiOne ?? this.tinggiOne,
      height: height ?? this.height,
      zipcode: zipcode ?? this.zipcode,
      // meters: meters ?? this.meters,
      // id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [tinggiOne, height, zipcode];
}
