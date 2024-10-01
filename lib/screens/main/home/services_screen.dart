// Project: 	   concierge_networking
// File:    	   services_screen
// Path:    	   lib/screens/main/home/services_screen.dart
// Author:       Ali Akbar
// Date:        01-10-24 17:40:43 -- Tuesday
// Description:

import 'package:concierge_networking/blocs/service/service_bloc.dart';
import 'package:concierge_networking/blocs/service/service_event.dart';
import 'package:concierge_networking/blocs/service/service_state.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/models/category_model.dart';
import 'package:concierge_networking/models/service_model.dart';
import 'package:concierge_networking/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/custom_title_textfield.dart';
import '../../../components/text_widget.dart';
import '../../../utils/extensions/navigation_service.dart';
import '../components/content_widget.dart';
import 'detail_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key, required this.category});
  final CategoryModel category;
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<ServiceModel> services = [];
  bool isLoading = false;

  void triggerFetchServicesEvent() {
    context
        .read<ServiceBloc>()
        .add(ServiceEventFetchAll(categoryId: widget.category.uuid));
  }

  @override
  void initState() {
    triggerFetchServicesEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceBloc, ServiceState>(
      listener: (context, state) {
        if (state is ServiceStateFetching ||
            state is ServiceStateFetched ||
            state is ServiceStateFetchFailure) {
          setState(() {
            isLoading = state.isLoading;
          });

          if (state is ServiceStateFetched) {
            setState(() {
              services = state.services;
            });
          }
        }
      },
      child: Scaffold(
        appBar: customAppBar(title: widget.category.title.firstCapitalize()),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : services.isEmpty
                ? const Center(
                    child: PrimaryText(
                      "No services for this category.",
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 18),
                    child: Column(
                      children: [
                        const SearchTextField(),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              final service = services[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: ContentWidget(
                                  height: 160,
                                  onPressed: () {
                                    NavigationService.go(
                                        DetailScreen(service: service));
                                  },
                                  coverUrl: service.images.first,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PrimaryText(
                                        service.title.firstCapitalize(),
                                        size: 14,
                                        weight: FontWeight.w600,
                                        color: Colors.white,
                                        maxLines: 2,
                                      ),
                                      PrimaryText(
                                        service.description,
                                        size: 8,
                                        weight: FontWeight.w400,
                                        color: Colors.white,
                                        maxLines: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
