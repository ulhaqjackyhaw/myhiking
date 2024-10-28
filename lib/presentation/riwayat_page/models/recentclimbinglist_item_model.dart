import 'package:equatable/equatable.dart';

/// This class is used in the [recentclimbinglist_item_widget] screen.
// ignore_for_file: must_be_immutable
class RecentclimbinglistItemModel extends Equatable {
  RecentclimbinglistItemModel({
    this.rabu27agustus,
    this.gunungslamet,
    this.id,
    this.status,
    
  }) {
    rabu27agustus = rabu27agustus ?? "Rabu, 27 Agustus 2024";
    gunungslamet = gunungslamet ?? "Gunung Slamet";
    id = id ?? "";
    status = status ?? "Mendaki";
  }

  String? rabu27agustus;
  String? gunungslamet;
  String? id;
  String? status;

  RecentclimbinglistItemModel copyWith({
    String? rabu27agustus,
    String? gunungslamet,
    String? id,
    String? status,
  }) {
    return RecentclimbinglistItemModel(
      rabu27agustus: rabu27agustus ?? this.rabu27agustus,
      gunungslamet: gunungslamet ?? this.gunungslamet,
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [rabu27agustus, gunungslamet, id, status];
}
