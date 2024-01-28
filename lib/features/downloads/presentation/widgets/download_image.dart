import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/downloads/presentation/bloc/download_bloc.dart';

class DownloadImage extends StatelessWidget {
  const DownloadImage({
    super.key,
    required this.cWidth,
    required this.angle,
    required this.margin,
    required this.index,
    required this.width,
    required this.height,
  });
  final double cWidth;
  final double angle;
  final EdgeInsets margin;
  final int index;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    context.read<DownloadBloc>().add(FetchMovieRequested());
    return Container(
        margin: margin,
        child: Transform.rotate(
            angle: angle * pi / 180,
            child: BlocBuilder<DownloadBloc, DownloadState>(
              builder: (context, state) {
                if (state is DownloadLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is DownloadFailure) {
                  return const Text('some error occured');
                }
                if (state is! DownloadSuccess) {
                  return const CircularProgressIndicator.adaptive();
                }
                final data = state.downloadMovieModel;
                final posterPath = data[index].posterPath;
                return Container(
                  width: cWidth * width,
                  height: cWidth * height,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Image.network(
                    '${Constants.imagePath}$posterPath',
                    fit: BoxFit.cover,
                  ),
                );
              },
            )));
  }
}
