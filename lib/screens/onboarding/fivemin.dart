import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

import '../../services/size_config.dart';
import '../../services/youtube_player_screen.dart';




class FiveMed extends StatefulWidget {
  @override
  _FiveMedState createState() => _FiveMedState();
}

class _FiveMedState extends State<FiveMed> {
  ScrollController _scrollController = new ScrollController();
  static String key = "AIzaSyBdSA3T2atHtHI4EQsRS_RNKzlJ9t3sXws";

  YoutubeAPI youtube = YoutubeAPI(key,maxResults:50);
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    String query = "Five Minute Meditation";
    videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        callAPI();
        print("New Videos are loading....");
      }
    });

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
              padding:  EdgeInsets.only(right:16.0),
              child: Text('5 Minutes Meditation',style: TextStyle(
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
          children: videoResult.map<Widget>(listItem).toList(),
        ),
      ),
    );
  }

  Widget listItem(YouTubeVideo video) {
    return InkWell(
      onTap: () async{
        await Navigator.push(context,MaterialPageRoute(builder:(context)=>CustomYoutubePlayer(video.url)));
      },
        child:Container(
            height: SizeConfig.safeVertical!*0.23,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(12.0)),
            ),
            margin: EdgeInsets.only(bottom: 12.0),
            child:Card(
              elevation: 8.0,
              child: Row(
                children: [
                  Image.network(
                     video.thumbnail.small.url ?? '',
                     height: 120.0,
                   ) ,
                  Flexible(child: Text(video.title,style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),)),

                ],
              ),
            )
        )
    );
  }
}