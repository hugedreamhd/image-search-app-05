import 'package:image_search_app_05/data/data_source/pixabay_api.dart';
import 'package:image_search_app_05/data/mapper/image_mapper.dart';
import 'package:image_search_app_05/data/model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImageResult(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}

// class MockImageItemRepository {
//   Future<List<ImageItem>> getImageItems(String query) async {
//     return [
//       ImageItem(
//           imageUrl:
//               'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
//           tags: ''),
//       ImageItem(
//           imageUrl:
//               'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
//           tags: ''),
//       ImageItem(
//           imageUrl:
//               'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
//           tags: ''),
//     ];
//   }
// }
