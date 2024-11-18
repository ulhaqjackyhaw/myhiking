import 'package:equatable/equatable.dart';
import 'package:myhiking/models/jalur_model.dart';
import '../../../core/app_export.dart';
import '../models/detail_mountain_model.dart';
import 'package:myhiking/api/api_service.dart';
part 'detail_mountain_event.dart';
part 'detail_mountain_state.dart';

/// A bloc that manages the state of a DetailMountain according to the event that is dispatched to it.
class DetailMountainBloc
    extends Bloc<DetailMountainEvent, DetailMountainState> {
  final ApiService apiService;

  DetailMountainBloc(this.apiService) : super(DetailMountainState()) {
    on<DetailMountainInitialEvent>(_onInitialize);
  }
  // Future<void> _onInitialize(
  //   DetailMountainInitialEvent event,
  //   Emitter<DetailMountainState> emit,
  // ) async {
  //   try {
  //     // Mengambil data dari API
  //     final ApiResponse detailMountainData =
  //         await apiService.fetchJalur(event.id);

  //     // Pastikan response API memiliki data yang diperlukan
  //     final detailMountainModel = DetailMountainModel(
  //       name: detailMountainData.data.isNotEmpty
  //           ? detailMountainData.data[0].nama // Ambil nama dari data pertama
  //           : 'Nama Gunung Tidak Ditemukan',
  //       height:
  //           3000, // Misalnya data tinggi gunung bisa datang dari API jika tersedia
  //       province: detailMountainData.data.isNotEmpty
  //           ? detailMountainData.data[0].province// Ambil nama dari data pertama
  //           : 'Nama Gunung Tidak Ditemukan',
  //       routes: detailMountainData.data
  //           .map((jalur) => Route(name: jalur.nama))
  //           .toList(),
  //       jalurList: detailMountainData.data, // Menyimpan list Jalur yang lengkap
  //     );

  //     // Emit state dengan detailMountainModel yang baru
  //     emit(state.copyWith(detailMountainModelObj: detailMountainModel));
  //   } catch (e) {
  //     // Handle error
  //     print("Error fetching mountain details: $e");
  //   }
  // }
  Future<void> _onInitialize(
    DetailMountainInitialEvent event,
    Emitter<DetailMountainState> emit,
  ) async {
    try {
      // Ambil data dari API (langsung JSON Map)
      final Map<String, dynamic> detailMountainData =
          await apiService.fetchJalur(event.id);

      // Bangun model langsung dari JSON
      final detailMountainModel =
          DetailMountainModel.fromJson(detailMountainData);

      // Emit state dengan model
      emit(state.copyWith(detailMountainModelObj: detailMountainModel));
    } catch (e) {
      print("Error fetching mountain details: $e");
    }
  }
}
