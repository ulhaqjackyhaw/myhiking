import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myhiking/api/api_service.dart';
import 'package:myhiking/presentation/beranda_screen/beranda_initial_page.dart';
import 'package:myhiking/presentation/profile_screen/profile_screen.dart';
import 'package:myhiking/presentation/riwayat_page/riwayat_page.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/data_profile_bloc.dart';
import 'models/data_profile_model.dart';
import 'package:myhiking/widgets/custom_elevated_button.dart';
import '../../theme/custom_button_style.dart';
import 'package:file_picker/file_picker.dart';

// ignore_for_file: must_be_immutable
class DataProfileScreen extends StatefulWidget {
  final int userId;
  const DataProfileScreen({super.key, required this.userId});

  // static Widget builder(BuildContext context) {
  //   return BlocProvider<DataProfileBloc>(
  //     create: (context) => DataProfileBloc(
  //       apiService: context.read<ApiService>(), // Inject repository
  //     ),
  //     child: const DataProfileScreen(),
  //   );
  // }

  @override
  State<DataProfileScreen> createState() => _DataProfileScreenState();
}

class _DataProfileScreenState extends State<DataProfileScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  int userId1 = 0;
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  bool isLoading = true;
  String? _fileNameIdentity; // Menyimpan nama file yang diunggah
  String? _filePathIdentity;

  @override
  void initState() {
    super.initState();
    context.read<DataProfileBloc>();
    _getUser();
  }

  Future<void> _getUser() async {
    final token = await ApiService().getToken();

    // Cek apakah token null atau kosong
    if (token == null || token.isEmpty) {
      // Jika token tidak tersedia, tampilkan pesan atau ambil tindakan lain
      // print("Token is null or empty");
      if (mounted) {
        setState(() {
          isLoading =
              false; // Menyelesaikan status loading jika token tidak ada
        });
      }
      return; // Keluar dari fungsi jika token tidak ada
    }

    // print("Token: $token"); // Debugging, pastikan token ada

    try {
      final response = await ApiService().getUser(token);
      if (response['success']) {
        if (mounted) {
          setState(() {
            userId1 = response['data']['id'];
            userName = response['data']['name'];
            userEmail = response['data']['email'];
            userPassword = response['data']['password'];
            isLoading = false;
          });
        }
      } else {
        // Menangani error jika API gagal
        // print("Error: ${response['message']}");
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      // Tangani error jaringan atau kesalahan lainnya
      // print("Error fetching user: $e");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: appTheme.gray50,
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                _buildProfileHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 26.h, right: 14.h, top: 10.h),
                        child: Column(
                          children: [
                            SizedBox(
                              // height: 35.h,
                              width: 334.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_nama_lengkap".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray50004
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  _buildFullNameInput(context),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "lbl_nik".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray50003
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  _buildNikInput(context),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "lbl_no_telepon".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray50003
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  _buildPhoneNumberInput(context),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "Tanggal Lahir".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray50003
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  _buildDateOfBirthInput(context),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "msg_no_telepon_darurat".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray50003
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  _buildEmergencyContactInput(context),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "lbl_alamat".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray50003
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  _buildAddressInput(context),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "lbl_email2".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyMediumGray50003
                                        .copyWith(
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  _buildEmailInput(context),
                                  SizedBox(height: 4.h),
                                  _buildIdentityUploadSection(context),
                                  CustomElevatedButton(
                                    margin: EdgeInsets.symmetric(vertical: 0.0),
                                    buttonStyle:
                                        CustomButtonStyles.fillPrimaryTL12,
                                    buttonTextStyle: CustomTextStyles
                                        .labelLargePrimarySemiBoldw,
                                    text: "Simpan".tr,
                                    alignment: Alignment.centerRight,
                                    onPressed: () async {
                                      await updateProfile(context, state);
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      onTapTxtIdCounter(context);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Text(
                                        "Ubah Password",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 4, 57, 101),
                                          fontSize: 15.fSize,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 45.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            width: double.maxFinite,
            child: _buildBottomNavigation(context),
          ),
        ),
      );
    });
  }

  Future<void> updateProfile(
      BuildContext context, DataProfileState state) async {
    print("Button Simpan ditekan!");

    try {
      // Ambil data dari form
      final userId = userId1; // Ganti dengan ID pengguna yang sesuai
      final name = state.fullNameInputController?.text;
      final email = state.emailInputController?.text;
      // final password = state.passwordController.text.isEmpty
      //     ? null
      //     : state.passwordController.text;
      final address = state.addressInputController?.text;
      final nik = state.nikInputController?.text;
      final phone = state.phoneNumberInputController?.text;
      final emergencyPhone = state.emergencyContactInputController?.text;
      final dateOfBirth = state.dateOfBirthController?.text;
      final level = 1; // Contoh level default
      File? profilePicture;

      // Jika ada file gambar yang dipilih, gunakan profilePicturePath
      if (_fileNameIdentity != null) {
        profilePicture = File(_fileNameIdentity!);
        print("Profile picture path: $_fileNameIdentity");
      }
      if (_filePathIdentity != null) {
        profilePicture = File(_filePathIdentity!); // Gunakan path lengkap
      }

      print("Mengirim data ke API:");
      print("User ID: $userId");
      print("Name: $name");
      print("Email: $email");
      print("Address: $address");
      print("NIK: $nik");
      print("Phone: $phone");
      print("Emergency Phone: $emergencyPhone");
      print("Date of Birth: $dateOfBirth");
      print("Level: $level");
      print("Profile Picture: ${profilePicture?.path}");

      // Panggil fungsi API untuk memperbarui profil pengguna
      final response = await ApiService().updateUserProfile(
        userId: userId,
        name: name.toString(),
        email: email.toString(),
        // password: password,
        address: address,
        nik: nik,
        phone: phone,
        emergencyPhone: emergencyPhone,
        dateOfBirth: dateOfBirth,
        profilePicture: profilePicture,
        level: level,
      );

      print("Response API: $response");

      // Jika berhasil, tampilkan dialog sukses
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 24.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60,
                ),
                SizedBox(height: 16),
                Text(
                  "Data Berhasil Disimpan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 33, 117, 84),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    "Lanjut",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      // Cetak log error lebih detail
      print("Error saat mengupdate profil:");
      print(e);
      print(stackTrace);

      // Tampilkan dialog error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Terjadi Kesalahan"),
            content: Text("Gagal menyimpan data. Pesan error: $e"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  // Method to show password change dialog
  void onTapTxtIdCounter(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Text("Ubah Password"),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPasswordField("Password Lama"),
                _buildPasswordField("Password Baru"),
                _buildPasswordField("Konfirmasi Password"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Simpan Password Baru"),
              onPressed: () {
                // Tambahkan logika untuk menyimpan password
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
      ),
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      height: 164.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.h),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 202.h,
            margin: EdgeInsets.only(bottom: 30.h),
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 28.h,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "lbl_data_profile".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUserProfileDetails,
            height: 164.h,
            width: 170.h,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFullNameInput(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: 334.h, // Menyesuaikan dengan ukuran referensi
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label text untuk input Nama Lengkap
              // Uncomment jika diperlukan
              // Text(
              //   "lbl_nama_lengkap".tr, // Menggunakan localization
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: CustomTextStyles.bodyMediumGray50004.copyWith(
              //     height: 1.40,
              //   ),
              // ),
              SizedBox(height: 8.h),
              TextField(
                controller: state.fullNameInputController,
                onChanged: (value) {
                  context
                      .read<DataProfileBloc>()
                      .add(FullNameChangedEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Lengkap',
                  hintStyle: CustomTextStyles
                      .bodySmallGray50003Light, // Sesuai referensi gaya teks
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(
                      color: appTheme.gray400, // Warna border dari referensi
                      width: 1.h,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.h,
                  ),
                ),
                style:
                    CustomTextStyles.bodyMediumBlack900Light, // Gaya teks input
                keyboardType: TextInputType.name, // Keyboard untuk nama
                textInputAction:
                    TextInputAction.next, // Menambahkan aksi next pada keyboard
              ),
              // Opsional: Bisa menambahkan error message jika diperlukan
              if (state.statusMessage != null &&
                  state.statusMessage!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(state.statusMessage!,
                      style: CustomTextStyles.bodySmallBlack900),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDateOfBirthInput(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: 334.h, // Menyesuaikan ukuran sesuai referensi
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => onTapDateOfBirthInput(context),
                child: AbsorbPointer(
                  // Mencegah keyboard muncul saat mengetuk TextField
                  child: TextField(
                    controller: state.dateOfBirthController,
                    decoration: InputDecoration(
                      hintText: 'Pilih Tanggal Lahir',
                      hintStyle: CustomTextStyles.bodySmallGray50003Light,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.h),
                        borderSide: BorderSide(
                          color: appTheme.gray400,
                          width: 1.h,
                        ),
                      ),
                      suffixIcon: Icon(Icons.calendar_today, size: 20.h),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 12.h,
                      ),
                    ),
                    style: CustomTextStyles.bodyMediumBlack900Light,
                    readOnly: true, // Membuat input hanya dapat dibaca
                  ),
                ),
              ),
              // Tampilkan pesan error jika ada
              if (state.statusMessage != null &&
                  state.statusMessage!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    state.statusMessage!,
                    style: CustomTextStyles.bodySmallBlack900.copyWith(
                      color: Colors.red, // Warna teks error
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void onTapDateOfBirthInput(BuildContext context) async {
    // Mendapatkan tanggal saat ini
    DateTime currentDate = DateTime.now();

    // Menampilkan date picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate, // Tanggal saat ini sebagai tanggal awal
      firstDate: DateTime(
          1900), // Membatasi agar tidak bisa memilih sebelum tahun 1900
      lastDate: currentDate, // Membatasi hingga tanggal saat ini
    );

    if (pickedDate != null) {
      // Format tanggal menjadi 'yyyy-MM-dd'
      String dateOfBirth = DateFormat('yyyy-MM-dd').format(pickedDate);
      print('$dateOfBirth');

      // Dispatch event ke Bloc untuk memperbarui state
      BlocProvider.of<DataProfileBloc>(context)
          .add(DateOfBirthChangedEvent(dateOfBirth));
    } else {
      print("Pemilihan tanggal dibatalkan");
    }
  }

  Widget _buildNikInput(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: 334.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label text untuk input NIK
              // Uncomment jika diperlukan
              // Text(
              //   "lbl_nik".tr, // Menggunakan localization
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: CustomTextStyles.bodyMediumGray50004.copyWith(
              //     height: 1.40,
              //   ),
              // ),
              SizedBox(height: 8.h),
              TextField(
                controller: state.nikInputController,
                onChanged: (value) {
                  context.read<DataProfileBloc>().add(NikChangedEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan NIK',
                  hintStyle: CustomTextStyles
                      .bodySmallGray50003Light, // Sesuai referensi gaya teks
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(
                      color: appTheme.gray400, // Warna border dari referensi
                      width: 1.h,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.h,
                  ),
                ),
                style:
                    CustomTextStyles.bodyMediumBlack900Light, // Gaya teks input
                keyboardType:
                    TextInputType.number, // Keyboard untuk NIK (angka)
                textInputAction:
                    TextInputAction.next, // Aksi next pada keyboard
              ),
              // Menampilkan pesan status jika ada
              if (state.statusMessage != null &&
                  state.statusMessage!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    state.statusMessage!,
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPhoneNumberInput(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: 334.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label text untuk input Nomor Telepon
              // Uncomment jika diperlukan
              // Text(
              //   "lbl_nomor_telepon".tr, // Menggunakan localization
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: CustomTextStyles.bodyMediumGray50004.copyWith(
              //     height: 1.40,
              //   ),
              // ),
              SizedBox(height: 8.h),
              TextField(
                controller: state.phoneNumberInputController,
                onChanged: (value) {
                  context
                      .read<DataProfileBloc>()
                      .add(PhoneNumberChangedEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Nomor Telepon',
                  hintStyle: CustomTextStyles
                      .bodySmallGray50003Light, // Sesuai referensi gaya teks
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(
                      color: appTheme.gray400, // Warna border dari referensi
                      width: 1.h,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.h,
                  ),
                ),
                style:
                    CustomTextStyles.bodyMediumBlack900Light, // Gaya teks input
                keyboardType:
                    TextInputType.phone, // Keyboard untuk nomor telepon
                textInputAction:
                    TextInputAction.next, // Aksi next pada keyboard
              ),
              // Menampilkan pesan status jika ada
              if (state.statusMessage != null &&
                  state.statusMessage!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    state.statusMessage!,
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmergencyContactInput(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: 334.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label text untuk input Nomor Kontak Darurat
              // Uncomment jika diperlukan
              // Text(
              //   "lbl_kontak_darurat".tr, // Menggunakan localization
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: CustomTextStyles.bodyMediumGray50004.copyWith(
              //     height: 1.40,
              //   ),
              // ),
              SizedBox(height: 8.h),
              TextField(
                controller: state.emergencyContactInputController,
                onChanged: (value) {
                  context
                      .read<DataProfileBloc>()
                      .add(EmergencyContactChangedEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Nomor Kontak Darurat',
                  hintStyle: CustomTextStyles
                      .bodySmallGray50003Light, // Sesuai referensi gaya teks
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(
                      color: appTheme.gray400, // Warna border dari referensi
                      width: 1.h,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.h,
                  ),
                ),
                style:
                    CustomTextStyles.bodyMediumBlack900Light, // Gaya teks input
                keyboardType:
                    TextInputType.phone, // Keyboard untuk nomor telepon
                textInputAction:
                    TextInputAction.next, // Aksi next pada keyboard
              ),
              // Menampilkan pesan status jika ada
              if (state.statusMessage != null &&
                  state.statusMessage!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    state.statusMessage!,
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressInput(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: 334.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label text untuk input alamat
              // Uncomment jika diperlukan
              // Text(
              //   "lbl_alamat".tr, // Menggunakan localization
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: CustomTextStyles.bodyMediumGray50004.copyWith(
              //     height: 1.40,
              //   ),
              // ),
              SizedBox(height: 8.h),
              TextField(
                controller: state.addressInputController,
                onChanged: (value) {
                  context
                      .read<DataProfileBloc>()
                      .add(AddressChangedEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Alamat',
                  hintStyle: CustomTextStyles
                      .bodySmallGray50003Light, // Sesuai referensi gaya teks
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(
                      color: appTheme.gray400, // Warna border dari referensi
                      width: 1.h,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.h,
                  ),
                ),
                style:
                    CustomTextStyles.bodyMediumBlack900Light, // Gaya teks input
                keyboardType:
                    TextInputType.streetAddress, // Keyboard untuk alamat
                textInputAction:
                    TextInputAction.next, // Aksi next pada keyboard
                maxLines: null, // Mengizinkan input alamat dengan banyak baris
              ),
              // Menampilkan pesan status jika ada
              if (state.statusMessage != null &&
                  state.statusMessage!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(state.statusMessage!,
                      style: CustomTextStyles
                          .bodySmallBlack900 // Gaya teks pesan error
                      ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return BlocBuilder<DataProfileBloc, DataProfileState>(
      builder: (context, state) {
        return SizedBox(
          width: 334.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label untuk email
              // Uncomment jika diperlukan
              // Text(
              //   "lbl_email".tr, // Localization
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   style: CustomTextStyles.bodyMediumGray50004.copyWith(
              //     height: 1.40,
              //   ),
              // ),
              SizedBox(height: 8.h),
              TextField(
                controller: state.emailInputController,
                onChanged: (value) {
                  context.read<DataProfileBloc>().add(EmailChangedEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  hintStyle: CustomTextStyles.bodySmallGray50003Light,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(
                      color: appTheme.gray400,
                      width: 1.h,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.h,
                  ),
                  errorText: state.isEmailValid
                      ? null
                      : 'Format email tidak valid', // Validasi email
                ),
                style: CustomTextStyles.bodyMediumBlack900Light,
                keyboardType: TextInputType.emailAddress, // Keyboard email
                textInputAction:
                    TextInputAction.done, // Aksi selesai di keyboard
              ),
              // Menampilkan pesan status jika ada
              if (state.statusMessage != null &&
                  state.statusMessage!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    state.statusMessage!,
                    style: CustomTextStyles
                        .bodySmallBlack900, // Gaya teks error/status
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildIdentityUploadSection(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Text(
                  "msg_unggah_kartu_identitas".tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumGray50003.copyWith(
                    height: 1.40,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.all(6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder6,
                    border: Border.all(
                      color: appTheme.gray400,
                      width: 1.h,
                    ),
                  ),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text(
                            _fileNameIdentity ?? "msg_upload_file_jpeg".tr,
                            style: CustomTextStyles.bodySmallGray50003Light,
                            overflow:
                                TextOverflow.ellipsis, // Menghindari overflow
                            maxLines: 1,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // Implementasi File Picker
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: [
                              'jpg',
                              'jpeg',
                              'png'
                            ], // Hanya file gambar
                          );

                          if (result != null) {
                            // Mendapatkan file yang dipilih
                            PlatformFile file = result.files.first;
                            setState(() {
                              _fileNameIdentity =
                                  file.name; // Tampilkan nama file
                              _filePathIdentity = file.path; // Simpan path file
                            });
                            print('File dipilih: ${file.name}');
                            print('Path lengkap: ${file.path}');
                          } else {
                            // Pengguna membatalkan pemilihan file
                            print('Pemilihan file dibatalkan');
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          decoration: BoxDecoration(
                            color: appTheme.blueGray10001,
                            borderRadius: BorderRadiusStyle.roundedBorder6,
                            border: Border.all(
                              color: appTheme.gray400,
                              width: 1.h,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "lbl_pilih_file".tr,
                                style: CustomTextStyles.bodySmallBlack900Light,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return const SizedBox(
      width: double.maxFinite,
      // child: CustomBottomBar(
      //   onChanged: (BottomBarEnum type) {
      //     Navigator.pushNamed(
      //         navigatorKey.currentContext!, getCurrentRoute(type));
      //   },
      // ),
    );
  }
}
