import 'package:equatable/equatable.dart';
import 'paymentmethodslist_item_model.dart';

/// Kelas ini mendefinisikan variabel yang digunakan di layar [PilihanBankPembayaranScreen],
/// dan biasanya digunakan untuk menyimpan data yang diteruskan antara berbagai bagian aplikasi.
class PilihanBankPembayaranModel extends Equatable {
  // Constructor dengan nilai default untuk list dan indeks terpilih
  PilihanBankPembayaranModel({
    List<PaymentmethodslistItemModel>? paymentmethodslistItemList,
    this.selectedPaymentMethodIndex,
  }) : paymentmethodslistItemList = paymentmethodslistItemList ?? const [];

  final List<PaymentmethodslistItemModel>
      paymentmethodslistItemList; // Daftar metode pembayaran
  final int?
      selectedPaymentMethodIndex; // Menyimpan indeks pilihan yang dipilih

  // Method untuk menyalin model dengan modifikasi
  PilihanBankPembayaranModel copyWith({
    List<PaymentmethodslistItemModel>? paymentmethodslistItemList,
    int? selectedPaymentMethodIndex,
  }) {
    return PilihanBankPembayaranModel(
      paymentmethodslistItemList:
          paymentmethodslistItemList ?? this.paymentmethodslistItemList,
      selectedPaymentMethodIndex:
          selectedPaymentMethodIndex ?? this.selectedPaymentMethodIndex,
    );
  }

  @override
  List<Object?> get props => [
        paymentmethodslistItemList,
        selectedPaymentMethodIndex,
      ];
}
