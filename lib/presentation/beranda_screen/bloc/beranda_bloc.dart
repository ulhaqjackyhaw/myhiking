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
      HomelistItemModel(
        malangcentral: "Pemalang, Central Java, Indonesia",
        image: ImageConstant.imgImage156x316,
        gunungmerbabu: "Gunung Slamet",
        jawatengah: "Jawa Tengah",
      ),
      HomelistItemModel(
        malangcentral: "Malang, Central Java, Indonesia",
        image: ImageConstant.imgImage158x314,
        gunungmerbabu: "Gunung Sumbing",
        jawatengah: "Jawa Tengah",
      ),
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

// UI implementation in the screen where the list is displayed
// class BerandaScreen extends StatelessWidget {
//   final List<HomelistItemModel> homelistItemList;

//   BerandaScreen({required this.homelistItemList});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: homelistItemList.length,
//       itemBuilder: (context, index) {
//         HomelistItemModel item = homelistItemList[index];

//         return InkWell(
//           onTap: () {
//             if (item.image == ImageConstant.imgImage156x316) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailMountainScreen(
//                     mountainName: item.gunungmerbabu ?? "Unknown Mountain",
//                     location: item.jawatengah ?? "Unknown Location",
//                   ),
//                 ),
//               );
//             }
//           },
//           child: item.image != null
//               ? Image.asset(item.image!, fit: BoxFit.cover)
//               : const SizedBox(),
//         );
//       },
//     );
//   }
// }

// // DetailMountainScreen to display mountain details
// class DetailMountainScreen extends StatelessWidget {
//   final String mountainName;
//   final String location;

//   DetailMountainScreen({required this.mountainName, required this.location});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(mountainName),
//       ),
//       body: Center(
//         child: Text("Lokasi: $location"),
//       ),
//     );
//   }
// }
