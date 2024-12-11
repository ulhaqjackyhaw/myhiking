import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/utils/image_constant.dart';
import '../models/paymentmethodslist_item_model.dart';
import '../models/pilihan_bank_pembayaran_model.dart';

part 'pilihan_bank_pembayaran_event.dart';
part 'pilihan_bank_pembayaran_state.dart';

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
    // Handler for the initial event
    on<PilihanBankPembayaranInitialEvent>((event, emit) {
      // Emit the current state to initialize the BLoC with the initial values
      emit(state);
    });

    // Handler for the PaymentmethodslistItemEvent
    on<PaymentmethodslistItemEvent>((event, emit) {
      // Update state with the selected payment method index
      final updatedModel = state.pilihanBankPembayaranModelObj?.copyWith(
        selectedPaymentMethodIndex: event.index,
      );
      emit(state.copyWith(
        pilihanBankPembayaranModelObj: updatedModel,
      ));
    });
  }
}
