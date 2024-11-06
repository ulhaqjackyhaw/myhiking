import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/beranda_initial_model.dart';
import '../models/beranda_model.dart';
import '../models/homelist_item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'beranda_event.dart';
part 'beranda_state.dart';

/// A bloc that manages the state of a Beranda according to the event that is dispatched to it.
class BerandaBloc extends Bloc<BerandaEvent, BerandaState> {
  BerandaBloc(BerandaState initialState) : super(initialState) {
    on<BerandaInitialEvent>(_onInitialize);
    // on<BerandaInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    BerandaInitialEvent event,
    Emitter<BerandaState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));

    try {
      List<HomelistItemModel> homelistItems = await fetchGunungData();
      emit(state.copyWith(
        berandaInitialModelObj: state.berandaInitialModelObj?.copyWith(
          homelistItemList: homelistItems,
        ),
      ));
    } catch (e) {
      // Tangani kesalahan jika API tidak berhasil diambil
      print('Error fetching data: $e');
    }
  }

  // Fungsi untuk mengambil data gunung
  Future<List<HomelistItemModel>> fetchGunungData() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/gunung'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => HomelistItemModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<void> _onInitialize(
  //   BerandaInitialEvent event,
  //   Emitter<BerandaState> emit,
  // ) async {
  //   emit(
  //     state.copyWith(
  //       searchController: TextEditingController(),
  //     ),
  //   );
  //   emit(
  //     state.copyWith(
  //       berandaInitialModelObj: state.berandaInitialModelObj?.copyWith(
  //         homelistItemList: fillHomelistItemList(),
  //       ),
  //     ),
  //   );
  // }

  // List<HomelistItemModel> fillHomelistItemList() {
  //   return [
  //     HomelistItemModel(
  //       malangcentral: "Malang, Central Java, Indonesia",
  //       image: ImageConstant.imgImage,
  //       gunungmerbabu: "Gunung Merbabu",
  //       jawatengah: "Jawa Tengah",
  //     ),
  //     HomelistItemModel(
  //       malangcentral: "Pemalang, Central Java, Indonesia",
  //       image: ImageConstant.imgImage156x316,
  //       gunungmerbabu: "Gunung Slamet",
  //       jawatengah: "Jawa Tengah",
  //     ),
  //     HomelistItemModel(
  //       malangcentral: "Malang, Central Java, Indonesia",
  //       image: ImageConstant.imgImage158x314,
  //       gunungmerbabu: "Gunung Sumbing",
  //       jawatengah: "Jawa Tengah",
  //     ),
  //   ];
  // }
}
