import 'package:http/http.dart' as http;
import 'package:myhiking/models/bookingModel.dart';
import 'package:myhiking/models/model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
        Uri.parse("http://localhost:8000/api/pesanan/buatpesanan"),
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

  // Future<Map<String, dynamic>> fetchJalur(int idGunung) async {
  //   final url = Uri.parse('$baseUrl/gunung/$idGunung');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to fetch jalur');
  //   }
  // }

  // ApiService.dart
  // Future<Map<String, dynamic>> fetchRouteDetails(
  //     int? idGunung, int? jalurid) async {
  //   if (idGunung == null || jalurid == null) {
  //     throw Exception('ID Gunung atau ID Jalur tidak valid');
  //   }

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to fetch jalur');
  //   }
  // }

  Future<Map<String, dynamic>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transactions'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch transactions');
    }
  }
  //   final url = Uri.parse('$baseUrl/gunung/$idGunung/jalur/$jalurid');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to fetch jalur');
  //   }
  // }

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
}
