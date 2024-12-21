import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../api/api_service.dart';
import '../../../core/app_export.dart';
import '../models/rincian_pembayaran_upload_model.dart';

part 'rincian_pembayaran_upload_event.dart';
part 'rincian_pembayaran_upload_state.dart';

/// A bloc that manages the state of RincianPembayaranUpload according to
/// the event that is dispatched to it.
class RincianPembayaranUploadBloc
    extends Bloc<RincianPembayaranUploadEvent, RincianPembayaranUploadState> {
  final ApiService apiService;

  // Constructor accepting the apiService as a parameter
  RincianPembayaranUploadBloc({required this.apiService})
      : super(RincianPembayaranUploadState.initial()) {
    on<RincianPembayaranUploadEvent>(_onInitialize);
    on<FetchRincianPembayaranUploadEvent>(_onFetchRincianPembayaranUpload);
  }

  // Initialization event handler (Can be used for setup tasks)
  Future<void> _onInitialize(
    RincianPembayaranUploadEvent event,
    Emitter<RincianPembayaranUploadState> emit,
  ) async {
    // Perform any setup or initialization tasks here if needed
  }

  // Event handler for fetching rincian pembayaran data
  Future<void> _onFetchRincianPembayaranUpload(
    FetchRincianPembayaranUploadEvent event,
    Emitter<RincianPembayaranUploadState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: '')); // Show loading state

    try {
      // Get the token for authentication
      String? token = await apiService.getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      // Make the API call to fetch the rincian pembayaran data
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/pesanan'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        // Handle successful response
        final responseData = jsonDecode(response.body);
        print('Response Data: $responseData');

        // Map the response data to your model
        final rincianPembayaran =
            RincianPembayaranUploadModel.resPesananFromJson(responseData);

        // Update the state with fetched data
        emit(state.copyWith(
          isLoading: false,
          rincianPembayaranUploadModelObj: rincianPembayaran,
          error: '', // Clear any previous errors
        ));
      } else {
        // Handle non-200 status codes
        throw Exception(
            'Failed to fetch rincian pembayaran. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors during API call
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to fetch data: $e', // Provide detailed error message
      ));
    }
  }
}
