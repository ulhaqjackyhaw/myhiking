import 'package:equatable/equatable.dart';
import 'homelist_item_model.dart';

/// This class is used in the [beranda_initial_page] screen.
// ignore_for_file: must_be_immutable
class BerandaInitialModel extends Equatable {
  BerandaInitialModel({this.homelistItemList = const []});

  List<HomelistItemModel> homelistItemList;

  BerandaInitialModel copyWith({List<HomelistItemModel>? homelistItemList}) {
    return BerandaInitialModel(
      homelistItemList: homelistItemList ?? this.homelistItemList,
    );
  }

  @override
  List<Object?> get props => [homelistItemList];
}
