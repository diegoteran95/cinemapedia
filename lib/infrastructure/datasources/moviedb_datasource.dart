import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
      BaseOptions(baseUrl: "https://api.themoviedb.org/3", queryParameters: {
    "language": "es-MX"
  }, headers: {
    "Authorization": "Bearer ${Environment.movieDBKey}",
  }));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    dio.options.queryParameters = {
      ...dio.options.queryParameters,
      "page": page
    };
    final response = await dio.get("/movie/now_playing");
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where(
          (movieDb) => movieDb.posterPath != "no-poster",
        )
        .map((movieDb) => MovieMapper.movieDBToEntity(movieDb))
        .toList();
    return movies;
  }
}
