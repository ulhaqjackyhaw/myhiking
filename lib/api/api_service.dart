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

  Future<Booking?> createBooking(
    int idGunung,
    int jalurId,
    int userId,
    String tanggalNaik,
    String tanggalTurun,
    String totalHargaTiket,
  ) async {
    try {
      // Fetch token
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      // Send POST request to create a new booking
      final response = await http.post(
        Uri.parse("$baseUrl/pesanan"), // API URL
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "id_gunung": idGunung,
          "id_jalur": jalurId,
          "id_user": userId, // Use the correct user_id key
          "tanggal_naik": tanggalNaik,
          "tanggal_turun": tanggalTurun,
          "total_harga_tiket":
              totalHargaTiket, // Renamed to match the API response
        }),
      );

      if (response.statusCode == 201) {
        // Successfully created booking, parse the response
        final jsonResponse = jsonDecode(response.body);

        // Assuming the response contains a "pesanan" object
        final pesananData = jsonResponse['pesanan'];

        // Convert the "pesanan" data to the Booking model
        return Booking.fromJson(pesananData);
      } else {
        // Handle non-201 responses
        print('Failed to create booking: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error creating booking: $e');
      return null;
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
