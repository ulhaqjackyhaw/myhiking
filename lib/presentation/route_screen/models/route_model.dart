import 'package:equatable/equatable.dart';
import 'package:myhiking/models/model.dart';
import 'routelistsection_item_model.dart';

/// This class defines the variables used in the [route_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class RouteModel extends Equatable {
  RouteModel({
    this.routelistsectionItemList = const [],
    this.jalurList = const [],
  });

  // Data untuk tampilan
  List<RoutelistsectionItemModel> routelistsectionItemList;

  // Data dari model Jalur
  List<Jalur> jalurList;

  RouteModel copyWith({
    List<RoutelistsectionItemModel>? routelistsectionItemList,
    List<Jalur>? jalurList,
  }) {
    return RouteModel(
      routelistsectionItemList:
          routelistsectionItemList ?? this.routelistsectionItemList,
      jalurList: jalurList ?? this.jalurList,
    );
  }

  @override
  List<Object?> get props => [routelistsectionItemList, jalurList];
}
