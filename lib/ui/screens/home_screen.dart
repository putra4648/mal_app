import 'dart:async';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/logic/bloc/manga/manga_bloc.dart';
import 'package:manga_app/logic/bloc/news/news_bloc.dart';

import '../../logic/logic.dart';
import '../widgets/custom_style_hook.dart';

class HomeScreen extends StatefulWidget {
  final TabController tabController;

  const HomeScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Completer<void> refreshCompleter;

  @override
  void initState() {
    refreshCompleter = Completer<void>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).copyWith(
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 14,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
    return Scaffold(
      bottomNavigationBar: StyleProvider(
        style: CustomStyleHook(),
        child: ConvexAppBar(
          controller: widget.tabController,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          style: TabStyle.flip,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            // TabItem(icon: FontAwesomeIcons.calendarDays, title: 'Schedule'),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('WeaBook'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
        ],
      ),
      // body: BlocConsumer<ConnectivityCubit, ConnectivityState>(
      //   listener: (context, state) {
      //     if (state is ConnectionResult) {
      //       if (state.connectivityResult.contains(ConnectivityResult.none)) {
      //         // listWidgetBody.clear();
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(
      //             content: Text(
      //               'No Connection',
      //               textAlign: TextAlign.center,
      //             ),
      //           ),
      //         );
      //       }
      //     }
      //   },
      //   builder: (context, state) {
      //     if (state is ConnectionLoading) {
      //       return Loading();
      //     }
      //     if (state is ConnectionResult) {
      //       print(state.connectivityResult);
      //       if (!state.connectivityResult.contains(ConnectivityResult.none)) {
      //         return SingleChildScrollView(
      //           child: Column(
      //             children: [
      //               buildContainerLabel('Top Character',
      //                   'Most popular character in 2020', theme, null),
      //               // buildContainerCharacterManga(size),
      //               // buildContainerLabel('Top Manga',
      //               //     'You can see our top manga here', theme, true),
      //               // buildContainerTopManga(size),
      //               buildContainerLabel('Season',
      //                   'List upcoming manga and anime', theme, false),
      //               // buildContainerSeasonManga(size)
      //             ],
      //           ),
      //         );
      //       } else {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     }
      //     return Text("Cannot see");
      //   },
      // ),
      body: BlocBuilder<MangaBloc, MangaState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              if (state.mangas.isNotEmpty)
                Column(
                  children: state.mangas.map((m) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/detail", arguments: {
                          "malId": m.malId.toString(),
                          "title": m.title ?? "",
                        });
                      },
                      child: Card.outlined(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(m.title ?? ""),
                            if (m.images != null &&
                                m.images?['webp'] != null &&
                                m.images?['webp']?.largeImageUrl != null)
                              Image.network(m.images!['webp']!.largeImageUrl!),
                            Text(m.titleSynonyms?.join(", ") ?? ""),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
            ],
          ),
        );
      }),
    );
  }

  // Widget buildContainerCharacterManga(Size size) {
  //   return Container(
  //     height: size.height * 0.35,
  //     child: BlocConsumer<CharacterBloc, CharacterState>(
  //       listener: (context, state) {
  //         if (state is CharacterLoadedSuccess) {
  //           refreshCompleter.complete();
  //           refreshCompleter = Completer();
  //         }
  //       },
  //       builder: (context, state) {
  //         if (state is CharacterLoading) {
  //           return Loading();
  //         }
  //         if (state is CharacterLoadedSuccess) {
  //           return ShowCharacterPage(
  //             listCharacter: state.characters,
  //             size: size,
  //           );
  //         }
  //         if (state is CharacterFailure) {
  //           return Center(
  //             child: Text('Something went wrong'),
  //           );
  //         }
  //         return SizedBox();
  //       },
  //     ),
  //   );
  // }
  //
  // Widget buildContainerSeasonManga(Size size) {
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     height: size.height * 0.5,
  //     child: BlocConsumer<SeasonBloc, SeasonState>(
  //       listener: (context, state) {
  //         if (state is SeasonLoadedSuccess) {
  //           // context.read<CharacterBloc>().add(CharacterInitEvent());
  //           refreshCompleter.complete();
  //           refreshCompleter = Completer();
  //         }
  //       },
  //       builder: (context, state) {
  //         if (state is SeasonLoadedSuccess) {
  //           return ShowMangaPage(listManga: state.seasons);
  //         }
  //         if (state is SeasonFailure) {
  //           return Center(
  //             child: Text('Something went wrong'),
  //           );
  //         }
  //         return SizedBox();
  //       },
  //     ),
  //   );
  // }
  //
  // Widget buildContainerTopManga(Size size) {
  //   return Container(
  //     height: size.height * 0.5,
  //     child: BlocConsumer<TopBloc, TopState>(
  //       listener: (context, state) {
  //         if (state is TopLoadedSuccess) {
  //           refreshCompleter.complete();
  //           refreshCompleter = Completer();
  //         }
  //       },
  //       builder: (context, state) {
  //         if (state is TopLoading) {
  //           return Loading();
  //         }
  //         if (state is TopLoadedSuccess) {
  //           return ShowMangaPage(listManga: state.mangas);
  //         }
  //         if (state is TopFailure) {
  //           return Center(
  //             child: Text('Something went wrong'),
  //           );
  //         }
  //         return SizedBox();
  //       },
  //     ),
  //   );
  // }

  Widget buildContainerLabel(
      String labelName, String description, ThemeData theme, bool? isShow) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelName,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(description),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/show_more', arguments: isShow);
                },
                child: Row(
                  children: [
                    const Text('Show more'),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
