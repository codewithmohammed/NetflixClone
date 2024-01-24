import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/search/data/models/search_movie_model.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.data,
  });

  final List<SearchMovieModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final currentModel = data[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    height: 70,
                    width: 120,
                    child: Image.network(
                        '${Constants.imagePath}${currentModel.backdropPath}',
                        fit: BoxFit.fill),
                  ),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        currentModel.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800),
                        maxLines: 1,
                      ),
                    )),
                const CircleAvatar(
                  radius: 20,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.play_arrow,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 2,
            ),
        itemCount: data.length);
  }
}



