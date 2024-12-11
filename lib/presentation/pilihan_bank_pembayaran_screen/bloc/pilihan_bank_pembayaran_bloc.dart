import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/utils/image_constant.dart';
import '../models/paymentmethodslist_item_model.dart';
import '../models/pilihan_bank_pembayaran_model.dart';

part 'pilihan_bank_pembayaran_event.dart';
part 'pilihan_bank_pembayaran_state.dart';

// BLoC untuk PilihanBankPembayaran
class PilihanBankPembayaranBloc
    extends Bloc<PilihanBankPembayaranEvent, PilihanBankPembayaranState> {
  PilihanBankPembayaranBloc()
      : super(PilihanBankPembayaranState(
        pilihanBankPembayaranModelObj: PilihanBankPembayaranModel(
          paymentmethodslistItemList: [
            PaymentmethodslistItemModel(
              gopayOne: ImageConstant.imgLogo,
              debitcard: 'GoPay',
            ),
            PaymentmethodslistItemModel(
              gopayOne: ImageConstant.imgPngwingCom1,
              debitcard: 'Bank Central Asia',
            ),
            PaymentmethodslistItemModel(
              gopayOne: ImageConstant.imgLogoBankBri,
              debitcard: 'Bank Rakyat Indonesia',
            ),
          ],
        ),
      )) {
    on<PaymentmethodslistItemEvent>((event, emit) {
      // Tangani event di sini
      // Misalnya, mengupdate state berdasarkan event.index
      final updatedModel = state.pilihanBankPembayaranModelObj?.copyWith(
        selectedPaymentMethodIndex: event.index,
      );
      emit(state.copyWith(
        pilihanBankPembayaranModelObj: updatedModel,
      ));
    });
  }
}


//   @override
//   Stream<PilihanBankPembayaranState> mapEventToState(
//     PilihanBankPembayaranEvent event,
//   ) async* {
//     if (event is PilihanBankPembayaranInitialEvent) {
//       // Tidak perlu menambahkan data lagi di sini
//       yield state; // Hanya yield state yang sudah ada
//     } else if (event is PaymentmethodslistItemEvent) {
//       yield* _handlePaymentMethodSelection(event);
//     }
//   }

//   Stream<PilihanBankPembayaranState> _handlePaymentMethodSelection(
//       PaymentmethodslistItemEvent event) async* {
//     // Mengupdate pilihan metode pembayaran
//     final updatedModel = state.pilihanBankPembayaranModelObj?.copyWith(
//       selectedPaymentMethodIndex: event.index,
//     );

//     yield state.copyWith(
//       pilihanBankPembayaranModelObj: updatedModel,
//     );
//   }
// }
