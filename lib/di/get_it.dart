import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_coming_soon.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';

final getItInstance = GetIt.I;

Future<void> init() async {
  // Register use cases
  getItInstance.registerLazySingleton<GetTrending>(
      () => GetTrending(GetIt.instance<MovieRepository>()));
  //  Register repository
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(GetIt.instance<MovieRemoteDataSource>()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(HttpClient()));

  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(HttpClient()));

  getItInstance.registerLazySingleton<GetPopular>(
      () => GetPopular(getItInstance<MovieRepository>()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance<MovieRepository>()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance<MovieRepository>()));
  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(() => MovieCarouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));
  getItInstance.registerFactory(() => MovieTabbedBloc(
        getPopular: GetPopular(getItInstance()),
        getPlayingNow: GetPlayingNow(getItInstance()),
        getComingSoon: GetComingSoon(
          getItInstance(),
        ),
      ));
}
