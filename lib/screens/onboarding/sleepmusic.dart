import 'package:flutter/material.dart';
import 'package:meditation_app/services/size_config.dart';
import 'package:meditation_app/services/youtube_player_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_api/youtube_api.dart';




class SleepMed extends StatefulWidget {
  @override
  _SleepMedState createState() => _SleepMedState();
}

class _SleepMedState extends State<SleepMed> {
  static String key = "AIzaSyBdSA3T2atHtHI4EQsRS_RNKzlJ9t3sXws";
  YoutubeAPI youtube = YoutubeAPI(key,maxResults:50);
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    String query = "Sleep Meditation";
    print('Hello World');
    videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {});
  }
  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    callAPI();

    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
        title:
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(right:16.0),
            child: Text('Sleep Music',style: TextStyle(
              fontFamily:'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: ListView(
          children:  videoResult.map<Widget>(listItem).toList(),
        ),
      ),
    );
  }
  // Image.network(
  // video.thumbnail.small.url ?? '',
  // width: 120.0,
  // ),
//   InkWell(
//   onTap: () async{
//   await Navigator.push(context,MaterialPageRoute(builder:(context)=>CustomYoutubePlayer(video.url)));
// },
  Widget listItem(YouTubeVideo video){
    return Container(
      child: InkWell(
        onTap: () async{
          await Navigator.push(context,MaterialPageRoute(builder:(context)=>CustomYoutubePlayer(video.url)));
        },
        child: Container(
          height: SizeConfig.safeVertical!*0.23,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.all(Radius.circular(12.0)),
          ),
          margin: EdgeInsets.only(bottom: 12.0),
          child:Card(
            color: Colors.white,
            elevation: 8.0,
            child: Row(
              children: [
                Image.network(
                  video.thumbnail.small.url ?? '',
                  height: 120.0,
                ),
                Flexible(child: Text(video.title,style: TextStyle(color: Colors.black),)),

              ],
            ),
          ),
        ),
      ),


    );
  }
}
Shimmer getShimmerLoading(){
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[200]!,
    child: Container(
        height: SizeConfig.safeVertical!*0.23,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.all(Radius.circular(12.0)),
        ),
        margin: EdgeInsets.only(bottom: 12.0),
        child:Card(
          elevation: 8.0,
          child: Row(
            children: [
              Container(
                height: 120.0,
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
              ),

            ],
          ),
        )
    ),
  );
}
