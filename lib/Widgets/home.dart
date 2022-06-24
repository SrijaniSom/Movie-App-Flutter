import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apiKey = '12d8c69160b3983b0a9db34e018aac82';
  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMmQ4YzY5MTYwYjM5ODNiMGE5ZGIzNGUwMThhYWM4MiIsInN1YiI6IjYyYjA4ZDM0M2M0MzQ0MDgwYjMxOWVjOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WHV9SYk12uf-ERgOTl8m-Vckqpi5zzCiCBTaFXJqvJE';

  @override
  void initstate() {
    loadingmovies();
    super.initState();
  }

  loadingmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, accessToken));
    logConfig:
    ConfigLogger(showErrorLogs: true, showLogs: true);

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topmovieresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvshows = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
    trendingmovies = trendingresult['results'];
    topratedmovies = topmovieresults['results'];
    tv = tvshows['results'];
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
        centerTitle: true,
      ),
    );
  }
}
