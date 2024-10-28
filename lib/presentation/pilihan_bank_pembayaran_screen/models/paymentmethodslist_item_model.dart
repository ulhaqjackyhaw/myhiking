import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// Model untuk metode pembayaran yang digunakan di widget [PaymentmethodslistItemWidget].
class PaymentmethodslistItemModel extends Equatable {
  // Constructor
  PaymentmethodslistItemModel({
    String? gopayOne,
    String? debitcard,
    String? radioGroup,
    String? id,
  })  : gopayOne = gopayOne ?? ImageConstant.imgLogo,
        debitcard = debitcard ?? "Gopay",
        radioGroup = radioGroup ?? "",
        id = id ?? "";

  // Properti dari model
  final String gopayOne; // URL gambar untuk Gopay
  final String debitcard; // Nama kartu debit
  final String radioGroup; // Untuk grup radio
  final String id; // ID unik untuk item

  // Method untuk menyalin model dengan modifikasi
  PaymentmethodslistItemModel copyWith({
    String? gopayOne,
    String? debitcard,
    String? radioGroup,
    String? id,
  }) {
    return PaymentmethodslistItemModel(
      gopayOne: gopayOne ?? this.gopayOne,
      debitcard: debitcard ?? this.debitcard,
      radioGroup: radioGroup ?? this.radioGroup,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [gopayOne, debitcard, radioGroup, id];
}
