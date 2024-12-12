import 'package:equatable/equatable.dart';
import 'transactionlist_item_model.dart';

/// This class defines the variables used in the [transaksi_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class TransaksiModel extends Equatable {
  TransaksiModel({this.transactionlistItemList = const []});

  List<TransactionlistItemModel> transactionlistItemList;

  TransaksiModel copyWith({
    List<TransactionlistItemModel>? transactionlistItemList,
  }) {
    return TransaksiModel(
      transactionlistItemList: transactionlistItemList ?? this.transactionlistItemList,
    );
  }

  @override
  List<Object?> get props => [transactionlistItemList];
}