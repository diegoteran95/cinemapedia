import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeScreen(childView: navigationShell),
      branches: [
        // El numero de branches debe ser igual al numero de botones en el navigation bar
        StatefulShellBranch(routes: [
          GoRoute(
              path: "/",
              name: HomeScreen.name,
              builder: (context, state) => HomeView(),
              routes: [
                // Aqui se define las rutas hijas para poder redireccionar en caso de entrar a la pantalla hija directo
                GoRoute(
                  path: "movie/:id",
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final String movieId =
                        state.pathParameters["id"] ?? "no-id";
                    return MovieScreen(movieId: movieId);
                  },
                )
              ]),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: "/categories",
            builder: (context, state) => const Center(
              child: Text("Categorias"),
            ),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: "/favorites",
            name: FavoritesView.name,
            builder: (context, state) => const FavoritesView(),
          )
        ])
      ])
  // GoRoute(
  //     path: "/",
  //     name: HomeScreen.name,
  //     builder: (context, state) => const HomeScreen(childView: ,),
  //     routes: [ // Aqui se define las rutas hijas para poder redireccionar en caso de entrar a la pantalla hija directo
  //       GoRoute(
  //         path: "movie/:id",
  //         name: MovieScreen.name,
  //         builder: (context, state) {
  //           final String movieId = state.pathParameters["id"] ?? "no-id";
  //           return MovieScreen(movieId: movieId);
  //         },
  //       )
  //     ]),
]);
