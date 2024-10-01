// Project: 	   concierge_networking
// File:    	   category_screen
// Path:    	   lib/screens/main/home/category_screen.dart
// Author:       Ali Akbar
// Date:        01-10-24 16:30:44 -- Tuesday
// Description:

import 'package:concierge_networking/blocs/category/category_bloc.dart';
import 'package:concierge_networking/blocs/category/category_state.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/manager/cache/category_cache.dart';
import 'package:concierge_networking/models/category_model.dart';
import 'package:concierge_networking/screens/main/home/services_screen.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:concierge_networking/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_title_textfield.dart';
import '../../../components/text_widget.dart';
import '../components/gradient_image_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> categories = CategoryCache().categories;
  bool isFetchingMore = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryStateFetching ||
            state is CategoryStateFetched ||
            state is CategoryStateFetchFailure) {
          setState(() {
            isFetchingMore = state.isLoading;
          });

          if (state is CategoryStateFetched) {
            setState(() {
              categories.addAll(state.categories);
            });
          }
        }
      },
      child: Scaffold(
        appBar: customAppBar(title: "Category"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(
            children: [
              const SearchTextField(hintText: "Search Categories"),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: SizedBox(
                        height: 160,
                        child: GradientImageWidget(
                          onPressed: () {
                            NavigationService.go(const ServicesScreen());
                          },
                          coverUrl: categories[index].cover,
                          child: Center(
                            child: PrimaryText(
                              categories[index].title.firstCapitalize(),
                              size: 16,
                              weight: FontWeight.w700,
                              color: Colors.white,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
