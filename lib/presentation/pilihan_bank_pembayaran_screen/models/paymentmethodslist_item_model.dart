import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// Model untuk metode pembayaran yang digunakan di widget [PaymentmethodslistItemWidget].
class PaymentmethodslistItemModel extends Equatable {
  // Constructor dengan nilai default jika parameter tidak diberikan
  PaymentmethodslistItemModel({
    String? gopayOne,
    String? debitcard,
    String? radioGroup,
    String? id,
  })  : gopayOne = gopayOne ?? ImageConstant.imgLogo, // Default image
        debitcard = debitcard ?? "Gopay", // Default debit card name
        radioGroup = radioGroup ?? "", // Default empty radioGroup
        id = id ?? ""; // Default empty ID

  // Properti dari model
  final String gopayOne; // URL gambar untuk Gopay atau logo kartu
  final String debitcard; // Nama kartu debit (misal: "Gopay", "BCA")
  final String radioGroup; // ID grup radio button
  final String id; // ID unik untuk item

  // Method untuk menyalin model dengan modifikasi (copyWith)
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
