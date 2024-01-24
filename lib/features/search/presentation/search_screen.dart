import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/features/search/presentation/bloc/search_bloc.dart';
import 'package:netflixclone/features/search/presentation/widgets/search_gridview.dart';
import 'package:netflixclone/features/search/presentation/widgets/search_listview.dart';
import 'package:netflixclone/features/search/presentation/widgets/search_textfield.dart';
import 'package:netflixclone/features/search/presentation/widgets/title_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context
        .read<SearchBloc>()
        .add(FetchMovieRequested(searchText: searchController.text));
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(searchController: searchController),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchingState) {
                    return const TitleText(text: 'Movies & TV',);
                  } else if (state is SearchSuccess) {
                    return const TitleText(text: 'Top Searches',);
                  }
                  return const Text('');
                },
              ),
            ),
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
                if (state is SearchFailure) {
                  return Text(state.error);
                }

                if (state is SearchingState) {
                  final data = state.searchingMovieModel;

                  return SearchGridView(data: data);
                }
                if (state is! SearchSuccess) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                final data = state.searchMovieModel;

                return SearchListView(data: data);
              },
            )),
          ],
        ),
      )),
    );
  }
}

