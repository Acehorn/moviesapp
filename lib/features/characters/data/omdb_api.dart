import 'package:dio/dio.dart';
import '../../../core/models/series.dart';
import '../../../core/network/api_constants.dart';

class OmdbApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.omdbapi.com/',
    ),
  );

  Future<Series> getSeriesInfo(String title) async {
    final response = await _dio.get('', queryParameters: {
      't': title,
      'apikey': ApiConstants.omdbApiKey,
    });

    return Series.fromJson(response.data);
  }
}
