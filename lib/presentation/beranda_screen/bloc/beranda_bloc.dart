import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/beranda_initial_model.dart';
import '../models/beranda_model.dart';
import '../models/homelist_item_model.dart';

part 'beranda_event.dart';
part 'beranda_state.dart';

/// A bloc that manages the state of a Beranda according to the event that is dispatched to it.
class BerandaBloc extends Bloc<BerandaEvent, BerandaState> {
  BerandaBloc(super.initialState) {
    on<BerandaInitialEvent>(_onInitialize);
  }

  List<HomelistItemModel> fillHomelistItemList() {
    return [
      HomelistItemModel(
        malangcentral: "Malang, Central Java, Indonesia",
        image: ImageConstant.imgImage,
        gunungmerbabu: "Gunung Merbabu",
        jawatengah: "Jawa Tengah",
      ),
      HomelistItemModel(),
      HomelistItemModel(),
    ];
  }

  _onInitialize(
    BerandaInitialEvent event,
    Emitter<BerandaState> emit,
  ) async {
    emit(
      state.copyWith(
        searchController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        berandaInitialModelObj: state.berandaInitialModelObj?.copyWith(
          homelistItemList: fillHomelistItemList(),
        ),
      ),
    );
  }
}
