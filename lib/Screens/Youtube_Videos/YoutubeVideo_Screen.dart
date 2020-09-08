import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:vtm/Models/Channel_Model.dart';
import 'package:vtm/Models/Video_Model.dart';
import 'package:vtm/Screens/Play_Video.dart';
import 'package:vtm/Services/Api_Services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtubevidepage extends StatefulWidget {
  VoidCallback refreshScreen;

  Youtubevidepage({this.refreshScreen});

  @override
  _YoutubevidepageState createState() => _YoutubevidepageState();
}

class _YoutubevidepageState extends State<Youtubevidepage> {

  //api key:AIzaSyAAk_8rXF2rK_Mll3Hhi50UYjUEMzZLZtM
  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCjEn6jqeMuCZzJJGfE-vLsg');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoScreen(id: video.id),
          ),
        ),
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),

          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(

                height: MediaQuery.of(context).size.width*0.25,
                image: NetworkImage(video.thumbnailUrl),
              ),

              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        video.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  /*YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'VTMStein',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );*/

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        refresh: widget.refreshScreen,
      ),
      //bottomNavigationBar: CustomBottomBar(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomAppBar(
                    text: "YT VIDEO",
                    menuiconclr: VtmBlue,
                    addiconclr: Colors.transparent,
                    clickonmenuicon: () {
                      print("clicked");
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _channel != null
                    ? NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollDetails) {
                    if (!_isLoading &&
                        _channel.videos.length != int.parse(_channel.videoCount) &&
                        scrollDetails.metrics.pixels ==
                            scrollDetails.metrics.maxScrollExtent) {
                      _loadMoreVideos();
                    }
                    return false;
                  },
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: 1 + _channel.videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return _buildProfileInfo();
                        }
                        Video video = _channel.videos[index - 1];
                        return _buildVideo(video);
                      },
                    ),
                  ),
                )
                    : Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor, // Red
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
