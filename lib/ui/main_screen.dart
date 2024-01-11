import 'package:flutter/material.dart';
import 'package:image_search_app_05/ui/widget/image_item_widget.dart';
import 'package:image_search_app_05/ui/widget/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEdtingController = TextEditingController();

  final viewModel = MainViewModel();



  @override
  void dispose() {
    searchTextEdtingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEdtingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF4FB6b2), //외곽선 컬러 설정
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6b2), //외곽선 컬러 설정
                    ),
                  ),
                  hintText: '입력하세요',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF4Fb6B2),
                    ),
                    onPressed: () => viewModel.searchImage(
                      searchTextEdtingController.text,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              viewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.imageItems.length,
                        itemBuilder: (context, index) {
                          final imageItem = viewModel.imageItems[index]; //요기 궁금
                          return ImageItemWidget(
                            imageItem: imageItem,
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 32,
                          crossAxisSpacing: 32,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
