import 'package:equatable/equatable.dart';
import 'paymentmethodslist_item_model.dart';

/// Kelas ini mendefinisikan variabel yang digunakan di layar [pilihan_bank_pembayaran_screen],
/// dan biasanya digunakan untuk menyimpan data yang diteruskan antara berbagai bagian aplikasi.
// ignore_for_file: must_be_immutable
class PilihanBankPembayaranModel extends Equatable {
  PilihanBankPembayaranModel({this.paymentmethodslistItemList = const []});

  List<PaymentmethodslistItemModel> paymentmethodslistItemList;

  PilihanBankPembayaranModel copyWith({
    List<PaymentmethodslistItemModel>? paymentmethodslistItemList,
  }) {
    return PilihanBankPembayaranModel(
      paymentmethodslistItemList: 
          paymentmethodslistItemList ?? this.paymentmethodslistItemList,
    );
  }

  @override
  List<Object?> get props => [paymentmethodslistItemList];
}
