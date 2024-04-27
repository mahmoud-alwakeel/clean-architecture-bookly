import 'package:bookly/Features/home/presentation/views/widgets/loading_indicators/custom_book_image_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class CustomFeaturedBookListViewLoadingIndicator extends StatelessWidget {
  const CustomFeaturedBookListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImageLoadingIndicator());
            }),
      ),
    );
  }
}
