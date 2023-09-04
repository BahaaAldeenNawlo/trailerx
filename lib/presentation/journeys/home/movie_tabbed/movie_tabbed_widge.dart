// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';
import 'package:movieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/movieTabbed_constatns.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movieapp/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({super.key});

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;
  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTabTabbed(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: Sizes.dimen_4.h as double,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (var i = 0; i < MovieTabbedConstant.movieTabs.length; i++)
                    TabTitleWidget(
                      title: MovieTabbedConstant.movieTabs[i].title,
                      onTap: () => _onTabTabbed(i),
                      isSelected: MovieTabbedConstant.movieTabs[i].index ==
                          state.currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                Expanded(child: MovieListViewBuilder(movies: state.movies))
            ],
          ),
        );
      },
    );
  }
}