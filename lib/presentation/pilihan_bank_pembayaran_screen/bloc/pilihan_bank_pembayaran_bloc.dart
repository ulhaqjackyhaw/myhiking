import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/paymentmethodslist_item_model.dart';
import '../models/pilihan_bank_pembayaran_model.dart';

part 'pilihan_bank_pembayaran_event.dart';
part 'pilihan_bank_pembayaran_state.dart';

/// A bloc that manages the state of a PilihanBankPembayaran
/// according to the event that is dispatched to it.
class PilihanBankPembayaranBloc
    extends Bloc<PilihanBankPembayaranEvent, PilihanBankPembayaranState> {
  PilihanBankPembayaranBloc(super.initialState) {
    on<PilihanBankPembayaranInitialEvent>(_onInitialize);
    on<PaymentmethodslistItemEvent>(_paymentmethodslistItem);
  }

  /// Initializes the state with a list of payment methods.
  void _onInitialize(
    PilihanBankPembayaranInitialEvent event,
    Emitter<PilihanBankPembayaranState> emit,
  ) async {
    final updatedModel = state.pilihanBankPembayaranModelObj?.copyWith(
      paymentmethodslistItemList: fillPaymentmethodslistItemList(),
    );

    emit(state.copyWith(pilihanBankPembayaranModelObj: updatedModel));
  }

  /// Updates the selected payment method index based on the event.
  void _paymentmethodslistItem(
    PaymentmethodslistItemEvent event,
    Emitter<PilihanBankPembayaranState> emit,
  ) {
    final updatedModel = state.pilihanBankPembayaranModelObj?.copyWith(
      selectedPaymentMethodIndex: event.index,
    );

    emit(state.copyWith(pilihanBankPembayaranModelObj: updatedModel));
  }

  /// Fills the list of available payment methods.
  List<PaymentmethodslistItemModel> fillPaymentmethodslistItemList() {
    return [
      PaymentmethodslistItemModel(
        gopayOne: ImageConstant.imgLogo,
        debitcard: "Gopay",
      ),
      PaymentmethodslistItemModel(
        gopayOne: ImageConstant.imgPngwingCom1,
        debitcard: "Bank Central Asia",
      ),
      PaymentmethodslistItemModel(
        gopayOne: ImageConstant.imgLogoBankBri,
        debitcard: "Bank Rakyat Indonesia",
      ),
    ];
  }
}
