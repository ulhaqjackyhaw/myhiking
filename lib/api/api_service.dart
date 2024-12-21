import 'package:http/http.dart' as http;
import 'package:myhiking/models/bookingModel.dart';
import 'package:myhiking/models/model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/pilihan_bank_pembayaran_screen/models/transaksimodel.dart';

const String baseUrl = 'http://localhost:8000/api';

class ApiService {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, dynamic>> getUser(String token) async {
    // print(
    //     "Token: $token"); // Log token untuk memverifikasi nilai yang digunakan

    final url = Uri.parse('$baseUrl/user');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return {
        'success': true,
        'data': responseData,
      };
    } else {
      final errorData = jsonDecode(response.body);
      return {'success': false, 'errors': errorData};
    }
  }

  Future<List<Gunung>> fetchGunung() async {
    final response = await http.get(Uri.parse('$baseUrl/gunung'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Gunung.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> getUserProfile(String token) async {
    final url = Uri.parse('$baseUrl/user');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return {
        'success': true,
        'data': responseData,
      };
    } else {
      final errorData = jsonDecode(response.body);
      return {'success': false, 'errors': errorData};
    }
  }

  Future<ModelBooking?> createBooking(
    int idGunung,
    int jalurId,
    int userId,
    String formattedDate,
    String tanggalTurun,
    int totalHargaTiket, {
    List<int>? anggotaIds, // Parameter opsional untuk anggota
  }) async {
    try {
      // print('$anggotaIds');
      String? token = await getToken();
      print('Token yang ditemukan: $token');

      // Periksa apakah token ada dan benar
      if (token == null) {
        throw Exception('Token tidak ditemukan');
      }

      // Membuat body request
      Map<String, dynamic> requestBody = {
        "id_gunung": idGunung,
        "id_jalur": jalurId,
        "id_user": userId,
        "tanggal_naik": formattedDate, // Gunakan formattedDate di sini
        "tanggal_turun": tanggalTurun,
        "total_harga_tiket": totalHargaTiket,
      };

      // Menambahkan anggotaIds ke requestBody jika ada
      if (anggotaIds != null && anggotaIds.isNotEmpty) {
        requestBody["anggota_ids"] = anggotaIds;
      }
      print("Anggota Ids: {$anggotaIds}");
      final response = await http.post(
        Uri.parse("http://localhost:8000/api/pesanan"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Menambahkan log untuk memeriksa respons
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      print('Headers: ${response.headers}');

      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        final pesananId = jsonResponse['pesanan']
            ['id']; // Menggunakan jsonResponse, bukan response
        // Cek apakah anggota ada atau tidak dalam response

        if (jsonResponse['pesanan']['anggota'] != null) {
          // Pastikan anggota berupa List
          if (jsonResponse['pesanan']['anggota'] is List) {
            List anggotaData = jsonResponse['pesanan']['anggota'];
            print("Data Anggota: $anggotaData");
          } else {
            print("Data anggota tidak dalam format List yang diharapkan.");
          }
        } else {
          print("Anggota tidak ditemukan");
        }

        print(
            "Pesanan berhasil dibuat! Pesanan ID: ${jsonResponse['pesanan']['id']}");

        getPesananDetail(pesananId);
        return ModelBooking.fromJson(jsonResponse['pesanan']);
      } else if (response.statusCode == 302) {
        throw Exception('Redirect terjadi. Periksa konfigurasi backend.');
      } else {
        throw Exception(
            'Gagal membuat booking. Kode status: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat membuat booking: $e');
      return null;
    }
  }

  Future<void> getPesananDetail(int pesananId) async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/pesanan/$pesananId'),
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      final anggota = responseJson['pesanan']['anggota'];

      print('Data Anggota: $anggota');

      // Lakukan sesuatu dengan data anggota
      if (anggota != null && anggota.isNotEmpty) {
        // Anggota ada, proses sesuai kebutuhan
      }
    } else {
      print('Gagal mendapatkan detail pesanan');
    }
  }

  Future<Map<String, dynamic>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transactions'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch transactions');
    }
  }

  // Fungsi untuk mengambil data Pesanan berdasarkan ID
  Future<Map<String, dynamic>> fetchPesanan(int pesananId) async {
    final response = await http.get(Uri.parse('$baseUrl/pesanan/$pesananId'));
    print(response);
    if (response.statusCode == 200) {
      // Debug: Print the response body to check
      print('Response Body: ${response.body}');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load pesanan');
    }
  }

  Future<TransactionResponseModel> createTransaction(
      int pesananId, String metodePembayaran) async {
    final response = await http.post(
      Uri.parse('$baseUrl/transaksi/store'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id_pesanan': pesananId, // Kirim sebagai int, tidak perlu toString()
        'metode_pembayaran': metodePembayaran, // Tetap sebagai String
      }),
    );

    if (response.statusCode == 201) {
      return TransactionResponseModel.fromJson(json.decode(response.body));
    } else {
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('Failed to create transaction');
    }
  }

  Future<void> uploadBuktiPembayaran(
      String idTransaksi, String filePath) async {
    try {
      // Endpoint API
      final url = Uri.parse(
          'http://127.0.0.1:8000/api/transaksi/update-pembayaran/$idTransaksi');

      // Buat request multipart
      final request = http.MultipartRequest('POST', url);

      // Tambahkan headers
      request.headers.addAll({
        'Accept': 'application/json',
      });

      // Tambahkan waktu_pembayaran ke dalam request fields
      request.fields['waktu_pembayaran'] = DateTime.now().toIso8601String();

      // Tambahkan file ke dalam request
      final file = await http.MultipartFile.fromPath('bukti', filePath);
      request.files.add(file);

      // Kirim request dan tunggu respon
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // Periksa status kode HTTP
      if (response.statusCode == 200) {
        // Parse respon body
        final responseData = jsonDecode(response.body);

        if (responseData['message'] != null) {
          print(responseData['message']); // Cetak pesan sukses
          final transaksi = responseData['transaksi']; // Ambil data transaksi
          print("Detail Transaksi: $transaksi");

          // Tampilkan data yang relevan ke user
          print("Bukti: ${transaksi['bukti']}");
        } else {
          print("Respon tidak valid: ${response.body}");
        }
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
