import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/features/search/presentation/bloc/search_bloc.dart';
import 'package:netflixclone/utils/colors/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: AppColors.white),
      controller: searchController,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          prefixIcon: const Icon(CupertinoIcons.search),
          prefixIconColor: AppColors.white,
          hintText: 'Search for titles, genres or people',
          hintStyle: const TextStyle(
            color: AppColors.greylight1,
          ),
          suffixIcon: const Icon(CupertinoIcons.mic),
          suffixIconColor: AppColors.white,
          border: InputBorder.none),
      onChanged: (value) {
        context.read<SearchBloc>().add(
            FetchMovieRequested(searchText: searchController.text));
      },
    );
  }
}
