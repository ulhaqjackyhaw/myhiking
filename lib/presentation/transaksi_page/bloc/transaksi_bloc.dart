import 'package:equatable/equatable.dart';
import '../../../api/api_service.dart';
import '../../../core/app_export.dart';
import '../models/transactionlist_item_model.dart';
import '../models/transaksi_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'transaksi_event.dart';
part 'transaksi_state.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  String? userId;

  TransaksiBloc(super.initialState) {
    on<TransaksiInitialEvent>(_onInitialize);
    on<TransaksiUserIdEvent>(_onUserIdReceived);
  }

    // Event handler untuk menerima userId dan memanggil fetchRecentClimbingList
  _onUserIdReceived(
    TransaksiUserIdEvent event,
    Emitter<TransaksiState> emit,
  ) async {
    try {
      // Dapatkan userId dari event
      String userId = event.userId;

      // Memanggil fetchRecentClimbingList dengan userId
      List<TransactionlistItemModel> recentClimbingList = await fetchTransaksiList(userId);

      // Emit state dengan userId dan data yang diambil
      emit(
        state.copyWith(
          userId: userId,
          transaksiModelObj: state.transaksiModelObj?.copyWith(
          transactionlistItemList: recentClimbingList,
          ),
          
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
        ),
      );
    }
  }

    // Function untuk mengambil data dari API dengan userId
  Future<List<TransactionlistItemModel>> fetchTransaksiList(String userId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/transaksi'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      print('Data dari API: $data');

      // Filter data berdasarkan userId yang diterima
    final filteredData = data
    .where((item) => item['pemesan'].toString() == userId)
    .map((item) => TransactionlistItemModel.fromJson(item))
    .toList(); 
print('User ID yang digunakan: $userId');
print('Data setelah filter: $filteredData');


      return filteredData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Event handler untuk menginisialisasi data
  _onInitialize(
    TransaksiInitialEvent event,
    Emitter<TransaksiState> emit,
  ) async {
    try {
      // Mengambil data dari API tanpa menggunakan userId (untuk kasus inisialisasi)
      List<TransactionlistItemModel> recentClimbingList = await fetchTransaksiList("");
print('Data diterima: ${recentClimbingList.length}');

      // Emit state dengan data yang diambil
      emit(
        state.copyWith(
          transaksiModelObj: state.transaksiModelObj?.copyWith(
            transactionlistItemList: recentClimbingList,
          ),
        ),
      );
      
    } 
    catch (e) {
      emit(
        state.copyWith(
        ),
      );
    }
  }
}