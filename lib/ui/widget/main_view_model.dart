import 'package:flutter/cupertino.dart';
import 'package:image_search_app_05/data/model/image_item.dart';
import 'package:image_search_app_05/data/repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final repository = PixabayImageItemRepository();

  List<ImageItem> _imageitems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageitems);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageitems = await repository.getImageItems(query);

//강제  UI 업데이트

    _isLoading = false;
    notifyListeners();
  }
}
