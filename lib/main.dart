import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green,),
    );
  }
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies=[];
  List topratedmovies=[];
  List tv=[];
  final String apikey='07dc1abe8a9ba027b7594d9d546a4794';
  final readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwN2RjMWFiZThhOWJhMDI3Yjc1OTRkOWQ1NDZhNDc5NCIsInN1YiI6IjYyOWFkNDk0OGFjM2QwMDA2NzcxMGNkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lKq6UVauMC4HyU2zMyaMfkd_r-kWMOVcx3ztwBmgb5g';

@override
  void initState()
  {loadmovies();
    super.initState();
  }
 loadmovies()async{

   TMDB tmdbWithCustomLogs=TMDB(ApiKeys(apikey, readaccesstoken),
  logConfig:ConfigLogger(
     showLogs: true,
     showErrorLogs: true,
   ));

   Map trendingresult =await tmdbWithCustomLogs.v3.trending.getTrending();
   Map topratedresult =await tmdbWithCustomLogs.v3.movies.getTopRated();
   Map tvresult =await tmdbWithCustomLogs.v3.tv.getPopular();



   setState((){
     trendingmovies=trendingresult['results'];
     topratedmovies=topratedresult['results'];
     tv=tvresult['results'];


   });
   print(tv);
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Modified_text(text:'Flutter Movie App❤️',color:Colors.orange,size: 20,),

      ),
      body: ListView(
        children:[
          TV(tv: tv),
          TopRated(toprated: topratedmovies),
        TrendingMovies(trending:trendingmovies,)
        ],
      ),
    );
  }
}


