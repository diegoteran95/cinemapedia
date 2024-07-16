import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "actors_movie_provider.g.dart";

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

@Riverpod(keepAlive: true)
class ActorsMapNotifier extends _$ActorsMapNotifier {
  @override
  Map<String, List<Actor>> build(GetActorsCallback getActors) {
    ref.onDispose(() {
      print("borrar actors");
      print(state);
    });
    print("provider actors");
    return {};
  }

  Future<void> loadActors(String movieId) async {
    // Se guarda un mapa en donde la clave es el id de la pelicula y el valor el array de actores,
    // verifica si existe para no realizar la peticion http
    if (state[movieId] != null) return;
    final actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
