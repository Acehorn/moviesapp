import 'package:dio/dio.dart';
import '../../../core/models/character.dart';

class FuturamaApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://futuramaapi.com/api',
    ),
  );

  Future<List<Character>> getCharacters({int page = 1}) async {
    final response = await _dio.get(
      '/characters',
      queryParameters: {
        'page': page,
      },
    );

    final items = response.data['items'] as List;

    return items
        .map((json) => Character.fromJson(json))
        .toList();
  }
}
