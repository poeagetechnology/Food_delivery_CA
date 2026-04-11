import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_controller.dart';
import 'widgets/search_bar.dart';
import 'widgets/filter_chips.dart';
import 'widgets/search_results.dart';

class SearchScreen extends StatelessWidget {
  final VoidCallback goToHome;
  const SearchScreen({super.key, required this.goToHome});
  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<SearchControllerProvider>(context);

    if (controller.allFoods.isEmpty){
      controller.fetchAllFoods();
    }

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: goToHome,
        ),
        title: const Text("Search Food"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          SearchBarWidget(
            onChanged: controller.searchFood,
          ),

          FilterChips(),

          const SizedBox(height: 10),

          Expanded(
            child: SearchResults(
              foods: controller.filteredFoods,
            ),
          )
        ],
      ),
    );
  }
}