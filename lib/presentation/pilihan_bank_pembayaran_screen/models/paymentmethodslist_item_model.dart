import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// Class ini digunakan di layar [paymentmethodslist_item_widget].
// ignore_for_file: must_be_immutable
class PaymentmethodslistItemModel extends Equatable {
  PaymentmethodslistItemModel({
    this.gopayOne,
    this.debitcard,
    this.radioGroup,
    this.id,
  }) {
    gopayOne = gopayOne ?? ImageConstant.imgLogo;
    debitcard = debitcard ?? "Gopay";
    radioGroup = radioGroup ?? "";
    id = id ?? "";
  }

  String? gopayOne;
  String? debitcard;
  String? radioGroup;
  String? id;

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
