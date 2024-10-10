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

  _onInitialize(
    PilihanBankPembayaranInitialEvent event,
    Emitter<PilihanBankPembayaranState> emit,
  ) async {
    emit(
      state.copyWith(
        pilihanBankPembayaranModelObj: state.pilihanBankPembayaranModelObj?.copyWith(
          paymentmethodslistItemList: fillPaymentmethodslistItemList(),
        ),
      ),
    );
  }

  _paymentmethodslistItem(
    PaymentmethodslistItemEvent event,
    Emitter<PilihanBankPembayaranState> emit,
  ) {
    List<PaymentmethodslistItemModel> newList =
        List<PaymentmethodslistItemModel>.from(
            state.pilihanBankPembayaranModelObj!.paymentmethodslistItemList);
    newList[event.index] = newList[event.index].copyWith(
      radioGroup: event.radioGroup,
    );
    emit(
      state.copyWith(
        pilihanBankPembayaranModelObj: state.pilihanBankPembayaranModelObj
            ?.copyWith(paymentmethodslistItemList: newList),
      ),
    );
  }

  List<PaymentmethodslistItemModel> fillPaymentmethodslistItemList() {
    return [
      PaymentmethodslistItemModel(
          gopayOne: ImageConstant.imgLogo, debitcard: "Gopay"),
      PaymentmethodslistItemModel(
          gopayOne: ImageConstant.imgPngwingCom1, debitcard: "Bank Central Asia"),
      PaymentmethodslistItemModel(
          gopayOne: ImageConstant.imgLogoBankBri, debitcard: "Bank Rakyat Indonesia"),
    ];
  }
}
