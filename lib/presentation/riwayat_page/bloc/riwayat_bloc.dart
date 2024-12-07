import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recentclimbinglist_item_model.dart';
import '../models/riwayat_model.dart';

part 'riwayat_event.dart';
part 'riwayat_state.dart';

/// A bloc that manages the state of a Riwayat according to the event that is dispatched to it.
class RiwayatBloc extends Bloc<RiwayatEvent, RiwayatState> {
  RiwayatBloc(super.initialState) {
    on<RiwayatInitialEvent>(_onInitialize);
  }

  // Function to fetch data from the API
  Future<List<RecentclimbinglistItemModel>> fetchRecentClimbingList() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/pesanan'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data
          .map((item) => RecentclimbinglistItemModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Event handler for initializing data
  _onInitialize(
    RiwayatInitialEvent event,
    Emitter<RiwayatState> emit,
  ) async {
    try {
      // Fetching data from the API
      List<RecentclimbinglistItemModel> recentClimbingList = await fetchRecentClimbingList();

      // Emit the new state with the fetched data
      emit(
        state.copyWith(
          riwayatModelObj: state.riwayatModelObj?.copyWith(
            recentclimbinglistItemList: recentClimbingList,
          ), errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to fetch data: $e',
        ),
      );
    }
  }
}