import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/transactionlist_item_model.dart';
import '../models/transaksi_model.dart';

part 'transaksi_event.dart';
part 'transaksi_state.dart';

/// A bloc that manages the state of a Transaksi according to the event that is dispatched to it.
class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  TransaksiBloc(super.initialState) {
    on<TransaksiInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TransaksiInitialEvent event,
    Emitter<TransaksiState> emit,
  ) async {
    emit(
      state.copyWith(
        transaksiModelObj: state.transaksiModelObj?.copyWith(
          transactionlistItemList: fillTransactionlistItemList(),
        ),
      ),
    );
  }

  List<TransactionlistItemModel> fillTransactionlistItemList() {
    return [
      TransactionlistItemModel(
        senintwentyseve: "Senin, 27 Agustus 2024",
        gunungslamet: "Gunung Slamet",
      ),
      TransactionlistItemModel(
        senintwentyseve: "Rabu, 27 Januari 2024",
        gunungslamet: "Gunung Merbabu",
      ),
      TransactionlistItemModel(
        senintwentyseve: "Sabtu, 22 Oktober 2023",
        gunungslamet: "Gunung Andong",
      ),
      TransactionlistItemModel(
        senintwentyseve: "Senin, 2 Maret 2023",
        gunungslamet: "Gunung Sindoro",
      ),
    ];
  }
}
