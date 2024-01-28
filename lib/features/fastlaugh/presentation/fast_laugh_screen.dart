import 'package:flutter/material.dart';
import 'package:netflixclone/features/fastlaugh/presentation/bloc/fast_laugh_bloc.dart';

import 'package:netflixclone/features/fastlaugh/presentation/widgets/video_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/utils/videos/videos.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FastLaughBloc>().add(FetchMovieRequested());
    return Scaffold(body: BlocBuilder<FastLaughBloc, FastLaughState>(
      builder: (context, state) {
        if (state is FastLaughLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is FastLaughFailure) {
          return const Center(child: Text('some error occured'));
        }
        if (state is! FastLaughSuccess) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        
        return PageView.builder(
          itemCount: videos.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final videodata = state.fastLaughMovieTrailerModel[index];
            return VideoListItems(index: index,ytkey: videodata.key,);
          },
        );
      },
    ));
  }
}
// PageView(
//       scrollDirection: Axis.vertical,
//       children: List.generate(
//           10,
//           (index) => VideoListItems(
//                 index: index,
//               )),
//     ),