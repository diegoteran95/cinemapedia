import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [ // Aqui se define las rutas hijas para poder redireccionar en caso de entrar a la pantalla hija directo 
        GoRoute(
          path: "movie/:id",
          name: MovieScreen.name,
          builder: (context, state) {
            final String movieId = state.pathParameters["id"] ?? "no-id";
            return MovieScreen(movieId: movieId);
          },
        )
      ]),
]);
