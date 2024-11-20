import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myhiking/presentation/route_screen/route_screen.dart';
import '../../../core/app_export.dart';
import '../models/route_model.dart';
import '../models/routelistsection_item_model.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc(super.initialState) {
    on<RouteInitialEvent>(_onInitialize);
    on<RouteSelectEvent>(_onRouteSelect); // Menangani event pemilihan jalur
  }

  // Inisialisasi data awal
  _onInitialize(
    RouteInitialEvent event,
    Emitter<RouteState> emit,
  ) async {
    emit(
      state.copyWith(
        routeModelObj: state.routeModelObj?.copyWith(
          routelistsectionItemList: fillRoutelistsectionItemList(),
        ),
      ),
    );
  }

  // Menangani pemilihan jalur
  _onRouteSelect(
    RouteSelectEvent event,
    Emitter<RouteState> emit,
  ) async {
    try {
      // Mengambil data jalur berdasarkan ID yang dipilih
      final selectedRoute = await fetchRouteData(event.selectedRouteId);

      // Setelah data didapat, perbarui state tanpa error
      emit(
        state.copyWith(
          routeModelObj: state.routeModelObj?.copyWith(
            routelistsectionItemList: selectedRoute,
          ),
          error: null, // Clear the error
        ),
      );
    } catch (e) {
      // Emit error message if fetching data fails
      emit(
          state.copyWith(error: 'Gagal mengambil data jalur: ${e.toString()}'));
    }
  }

  // Fungsi untuk mengambil data jalur berdasarkan ID
  Future<List<RoutelistsectionItemModel>> fetchRouteData(String routeId) async {
    // Misalnya kita ambil data dari API atau database berdasarkan ID jalur
    try {
      // Anda bisa menyesuaikan dengan sumber data Anda (API atau database)
      return [
        RoutelistsectionItemModel(
          // tinggiOne: ImageConstant.imgDownload,
          jarak: 5.0, // Ini adalah contoh, sesuaikan dengan data yang ada
        ),
      ];
    } catch (e) {
      throw Exception('Gagal mengambil data jalur: $e');
    }
  }

  // Data awal (bisa diisi sesuai kebutuhan)
  List<RoutelistsectionItemModel> fillRoutelistsectionItemList() {
    return [
      RoutelistsectionItemModel(
        // tinggiOne: ImageConstant.imgDownload,
        jarak: 5.0, // Ini adalah contoh, sesuaikan dengan data yang ada
      ),
    ];
  }
}
