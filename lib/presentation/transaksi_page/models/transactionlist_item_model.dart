import 'package:equatable/equatable.dart';

/// This class is used in the [transactionlist_item_widget] screen.
// ignore_for_file: must_be_immutable
class TransactionlistItemModel extends Equatable {
  TransactionlistItemModel({this.senintwentyseve, this.gunungslamet, this.id}) {
    senintwentyseve = senintwentyseve ?? "Senin, 27 Agustus 2024";
    gunungslamet = gunungslamet ?? "Gunung Slamet";
    id = id ?? "";
  }

  String? senintwentyseve;
  String? gunungslamet;
  String? id;

  TransactionlistItemModel copyWith({
    String? senintwentyseve,
    String? gunungslamet,
    String? id,
  }) {
    return TransactionlistItemModel(
      senintwentyseve: senintwentyseve ?? this.senintwentyseve,
      gunungslamet: gunungslamet ?? this.gunungslamet,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [senintwentyseve, gunungslamet, id];
}
