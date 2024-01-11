import 'package:image_search_app_05/data/dto/pixabay_dto.dart';
import 'package:image_search_app_05/data/model/image_item.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem() {
    return ImageItem(
      imageUrl: previewURL ??
          'https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg',
      tags: tags ?? '',
    );
  }
}
