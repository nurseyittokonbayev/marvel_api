import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/movie_detail.dart';

import 'models/models.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final String overview;
  final String releaseDate;
  final String directedBy;

  const MovieItem({
    super.key,
    required this.movie,
    required this.overview,
    required this.releaseDate,
    required this.directedBy,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (conte) => MovieDetailsScreen(
                      movie: movie,
                      releaseDate: releaseDate,
                      overview: overview,
                      directedBy: directedBy,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            movie.coverUrl != null
                ? CachedNetworkImage(imageUrl: movie.coverUrl.toString())
                : Image.asset('assets/Mar.jpg')
          ],
        ),
      ),
    );
  }
}
