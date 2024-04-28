import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
      if (state is NewestBooksSuccess) {
      return BestSellerListView(
        newestBooks: state.books,
      );
      } else if (state is NewestBooksError) {
        return Center(child: Text(state.errorMessage));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}