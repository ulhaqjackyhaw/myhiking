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
  }

  _onInitialize(
    RiwayatInitialEvent event,
    Emitter<RiwayatState> emit,
  ) async {
    emit(
      state.copyWith(
        riwayatModelObj: state.riwayatModelObj?.copyWith(
          recentclimbinglistItemList: fillRecentclimbinglistItemList(),
        ),
      ),
    );
  }

  List<RecentclimbinglistItemModel> fillRecentclimbinglistItemList() {
    return [
      RecentclimbinglistItemModel(
        rabu27agustus: "Rabu, 27 Agustus 2024",
        gunungslamet: "Gunung Slamet",
      ),
      RecentclimbinglistItemModel(
        rabu27agustus: "Rabu, 27 Januari 2024",
        gunungslamet: "Gunung Merbabu",
      ),
      RecentclimbinglistItemModel(
        rabu27agustus: "Sabtu, 22 Oktober 2023",
        gunungslamet: "Gunung Andong",
      ),
      RecentclimbinglistItemModel(
        rabu27agustus: "Senin, 2 Maret 2023",
        gunungslamet: "Gunung Sindoro",
      ),
    ];
  }
}
