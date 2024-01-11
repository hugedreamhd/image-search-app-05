import 'dart:convert';
import 'package:image_search_app_05/data/dto/pixabay_dto.dart';
import 'package:http/http.dart' as http;


class PixabayApi {
  Future<PixabayDto> getImageResult(String query) async {
    final response =
    await http.get(Uri.parse(
          'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo&pretty=true'));
    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}
