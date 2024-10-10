import 'package:equatable/equatable.dart';
import 'routelistsection_item_model.dart';

/// This class defines the variables used in the [route_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class RouteModel extends Equatable {
  RouteModel({this.routelistsectionItemList = const []});

  List<RoutelistsectionItemModel> routelistsectionItemList;

  RouteModel copyWith({List<RoutelistsectionItemModel>? routelistsectionItemList}) {
    return RouteModel(
      routelistsectionItemList: routelistsectionItemList ?? this.routelistsectionItemList,
    );
  }

  @override
  List<Object?> get props => [routelistsectionItemList];
}
