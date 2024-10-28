import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/recentclimbinglist_item_model.dart';
import '../models/riwayat_model.dart';

part 'riwayat_event.dart';
part 'riwayat_state.dart';

/// A bloc that manages the state of a Riwayat according to the event that is dispatched to it.
class RiwayatBloc extends Bloc<RiwayatEvent, RiwayatState> {
  RiwayatBloc(super.initialState) {
    on<RiwayatInitialEvent>(_onInitialize);
    // on<ChangeStatusEvent>(_onChangeStatus);
  }

  _onInitialize(
    RiwayatInitialEvent event,
    Emitter<RiwayatState> emit,
  ) async {
    emit(
      state.copyWith(
        riwayatModelObj: state.riwayatModelObj?.copyWith(
          recentclimbinglistItemList : fillRecentclimbinglistItemList(),
        ),
      ),
    );
  }

  // _onChangeStatus(
  //   ChangeStatusEvent event,
  //   Emitter<RiwayatState> emit,
  // ) {
  //   final updatedList =
  //       state.riwayatModelObj?.recentclimbinglistItemList.map((item) {
  //     if (item.id == event.riwayatId && item.status == "Mendaki") {
  //       return item.copyWith(
  //           status: "Selesai"); // Ubah status menjadi Selesai
  //     }
  //     return item; // Kembalikan item yang tidak berubah
  //   }).toList();

  //   final updatedModel = state.riwayatModelObj?.copyWith(
  //     recentclimbinglistItemList: updatedList,
  //   );

  //   emit(state.copyWith(riwayatModelObj: updatedModel)); // Emit state baru
  // }

  List<RecentclimbinglistItemModel> fillRecentclimbinglistItemList() {
    return [
      RecentclimbinglistItemModel(
        rabu27agustus: "Rabu, 27 Agustus 2024",
        gunungslamet: "Gunung Slamet",
        status: "Mendaki", // Status Mendaki
      ),
      RecentclimbinglistItemModel(
        rabu27agustus: "Rabu, 27 Januari 2024",
        gunungslamet: "Gunung Merbabu",
        status: "Selesai", // Status Selesai
      ),
      RecentclimbinglistItemModel(
        rabu27agustus: "Sabtu, 22 Oktober 2023",
        gunungslamet: "Gunung Andong",
        status: "Selesai", // Status Selesai
      ),
      RecentclimbinglistItemModel(
        rabu27agustus: "Senin, 2 Maret 2023",
        gunungslamet: "Gunung Sindoro",
        status: "Selesai", // Status Selesai
      ),
    ];
  }
}
