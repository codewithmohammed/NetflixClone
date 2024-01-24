import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/core/constants/constants.dart';
import 'package:netflixclone/features/downloads/presentation/bloc/download_bloc.dart';

class DownloadImage extends StatefulWidget {
  const DownloadImage({
    super.key,
    // required this.snapshot,
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
  State<DownloadImage> createState() => _DownloadImageState();
}

class _DownloadImageState extends State<DownloadImage> {
  @override
  void initState() {
    super.initState();
    context.read<DownloadBloc>().add(FetchMovieRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.margin,
        child: Transform.rotate(
            angle: widget.angle * pi / 180,
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
                final posterPath = data[widget.index].posterPath;
                return Container(
                  width: widget.cWidth * widget.width,
                  height: widget.cWidth * widget.height,
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
