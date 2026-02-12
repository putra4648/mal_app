import 'package:flutter/material.dart';
import 'package:mal/mal.dart';
import 'package:manga_app/logic/bloc/manga/manga_bloc.dart';
import 'package:manga_app/logic/bloc/news/news_bloc.dart';
import 'package:manga_app/logic/cubit_observer.dart';
import 'package:manga_app/logic/logic.dart';
import 'package:manga_app/ui/pages/navigation_page.dart';
import 'package:manga_app/ui/screens/detail_news.dart';

void main() {
  Bloc.observer = CubitObserver();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectivityCubit(connectivity: Connectivity()),
        ),
        BlocProvider(
          create: (context) => MangaBloc(
              mangaService: MangaServiceImpl(httpService: HttpService()))
            ..add(MangaInitialEvent()),
        ),
        BlocProvider(
          create: (context) => NewsBloc(
              mangaService: MangaServiceImpl(httpService: HttpService())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   cardColor: Colors.blueGrey[800],
        //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //     backgroundColor: Color(0xff17181c),
        //   ),
        //   canvasColor: Color(0xff17181c),
        //   textTheme: TextTheme(
        //     headlineMedium: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w600,
        //     ),
        //     bodyLarge: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16,
        //     ),
        //     bodyMedium: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16,
        //     ),
        //   ),
        //   iconTheme: IconThemeData(
        //     size: 20,
        //     color: Colors.white,
        //   ),
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: Color(0xff17181c),
        //     elevation: 0,
        //     iconTheme: IconThemeData(
        //       size: 20,
        //       color: Colors.white,
        //     ),
        //     toolbarTextStyle: TextTheme(
        //       titleLarge: TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ).bodyMedium,
        //     titleTextStyle: TextTheme(
        //       titleLarge: TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ).titleLarge,
        //   ),
        // ),
        title: 'Material App',
        // home: NavigationPage(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          final name = settings.name;
          if (name == '/') {
            return MaterialPageRoute(
              builder: (context) => NavigationPage(),
            );
          }
          if (name == '/detail') {
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) {
                context
                    .read<NewsBloc>()
                    .add(NewsGetDetailEvent(args["malId"]!));
                context
                    .read<MangaBloc>()
                    .add(MangaGetDetailEvent(args["malId"]!));
                return DetailNews(args['title']!);
              },
            );
          }
          // if (name == '/show_more') {
          //   final args = settings.arguments as bool;
          //   return MaterialPageRoute(
          //     builder: (context) => ShowMoreScreen(
          //       showMangas: args,
          //     ),
          //   );
          // }
          // if (name == '/search') {
          //   return MaterialPageRoute(builder: (context) => SearchScreen());
          // }
          // if (name == '/detail_search') {
          //   final args = settings.arguments as Manga;
          //   return MaterialPageRoute(
          //       builder: (context) => DetailSearchScreen(anime: args));
          // }
          return null;
        },
      ),
    );
  }
}
