import 'package:equatable/equatable.dart';
import 'transactionlist_item_model.dart';

class TransaksiModel extends Equatable {
  TransaksiModel({this.transactionlistItemList = const [],});

  List<TransactionlistItemModel> transactionlistItemList;

  TransaksiModel copyWith({
    List<TransactionlistItemModel>? transactionlistItemList,
  }) {
    return TransaksiModel(
      transactionlistItemList:
          transactionlistItemList ?? this.transactionlistItemList,
    );
  }

  @override
  List<Object?> get props => [transactionlistItemList];
}