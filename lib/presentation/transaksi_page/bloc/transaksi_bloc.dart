import 'package:equatable/equatable.dart';
import '../../../api/api_service.dart';
import '../../../core/app_export.dart';
import '../models/transactionlist_item_model.dart';
import '../models/transaksi_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'transaksi_event.dart';
part 'transaksi_state.dart';

/// A bloc that manages the state of a Transaksi according to the event that is dispatched to it.
class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  TransaksiBloc(super.initialState) {
    on<TransaksiInitialEvent>(_onInitialize);
    on<ChangeStatusEvent>(_onChangeStatus); // Tambahkan event handler ini
  }

  _onInitialize(
    TransaksiInitialEvent event,
    Emitter<TransaksiState> emit,
  ) async {
    try {
      List<TransactionlistItemModel> transactionListItems =
          await fetchTransactions();

      emit(
        state.copyWith(
          transaksiModelObj: state.transaksiModelObj?.copyWith(
            transactionlistItemList: transactionListItems,
          ),
        ),
      );
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  // Logika untuk mengubah status transaksi
  _onChangeStatus(
    ChangeStatusEvent event,
    Emitter<TransaksiState> emit,
  ) {
    //   final updatedList =
    //       state.transaksiModelObj?.transactionlistItemList.map((item) {
    //     if (item.id == event.transactionId && item.status == "Proses") {
    //       return item.copyWith(
    //           status: "Berhasil"); // Ubah status menjadi Berhasil
    //     }
    //     return item; // Kembalikan item yang tidak berubah
    //   }).toList();

    //   final updatedModel = state.transaksiModelObj?.copyWith(
    //     transactionlistItemList: updatedList,
    //   );

    //   emit(state.copyWith(transaksiModelObj: updatedModel)); // Emit state baru
  }

  Future<List<TransactionlistItemModel>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transactions'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      // print(jsonData); // Menampilkan data JSON yang diterima

      return jsonData
          .map((data) => TransactionlistItemModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to fetch transactions');
    }
  }

  List<TransactionlistItemModel> fillTransactionlistItemList() {
    return [
      TransactionlistItemModel(
        senintwentyseve: "Senin, 27 Agustus 2024",
        gunungslamet: "Gunung Slamet",
        id: "1", // ID unik
      ),
      TransactionlistItemModel(
        senintwentyseve: "Rabu, 27 Januari 2024",
        gunungslamet: "Gunung Merbabu",
        id: "2", // ID unik
        status: "Selesai",
      ),
      TransactionlistItemModel(
        senintwentyseve: "Sabtu, 22 Oktober 2023",
        gunungslamet: "Gunung Andong",
        id: "3", // ID unik
        status: "Selesai",
      ),
      TransactionlistItemModel(
        senintwentyseve: "Senin, 2 Maret 2023",
        gunungslamet: "Gunung Sindoro",
        id: "4", // ID unik
        status: "Selesai",
      ),
    ];
  }
}
