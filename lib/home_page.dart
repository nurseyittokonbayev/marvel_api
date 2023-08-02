import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/models/models.dart';
import 'package:marvel_api/movie_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    try {
      final res = await dio.get('https://mcuapi.herokuapp.com/api/v1/movies');
      if (res.statusCode == 200) {
        List<dynamic> dataList = res.data?['data'];

        List<Movie> fetchedData = dataList.map((movieData) {
          return Movie(
            id: movieData['id'],
            title: movieData['title'],
            coverUrl: movieData['cover_url'],
            directedBy: movieData['directed_by'],
            trailerUrl: movieData['trailer_url'],
            overview: movieData['overview'],
            releaseDate: movieData['release_date'],
          );
        }).toList();

        setState(() {
          movies = fetchedData;
        });
      } else {
        print(
            'Ошибка: Не удалось получить данные. Код ответа: ${res.statusCode}');
      }
    } catch (e) {
      print('Ошибка: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: movies.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieItem(
                    movie: movies[index],
                    releaseDate: movies[index].releaseDate.toString(),
                    overview: movies[index].overview ?? "",
                    directedBy: movies[index].directedBy ?? '',
                  );
                },
              ));
  }
}
