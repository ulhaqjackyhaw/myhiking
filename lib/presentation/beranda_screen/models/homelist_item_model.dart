import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [homelist_item_widget] screen.
// ignore_for_file: must_be_immutable
class HomelistItemModel extends Equatable {
  
  HomelistItemModel({
    this.malangcentral,
    this.image,
    this.gunungmerbabu,
    this.jawatengah,
    this.id,
  }) {
    malangcentral = malangcentral ?? "Malang, Central Java, Indonesia";
    image = image ?? ImageConstant.imgImage;
    gunungmerbabu = gunungmerbabu ?? "Gunung Merbabu";
    jawatengah = jawatengah ?? "Jawa Tengah";
    id = id ?? "";
  }

  String? malangcentral;
  String? image;
  String? gunungmerbabu;
  String? jawatengah;
  String? id;

  HomelistItemModel copyWith({
    String? malangcentral,
    String? image,
    String? gunungmerbabu,
    String? jawatengah,
    String? id,
  }) {
    return HomelistItemModel(
      malangcentral: malangcentral ?? this.malangcentral,
      image: image ?? this.image,
      gunungmerbabu: gunungmerbabu ?? this.gunungmerbabu,
      jawatengah: jawatengah ?? this.jawatengah,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        malangcentral,
        image,
        gunungmerbabu,
        jawatengah,
        id,
      ];
}
