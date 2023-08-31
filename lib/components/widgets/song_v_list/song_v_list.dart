import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/services/response/song_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:popcorn_sound_mobile/components/widgets/cus_audioplayers/player.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';

class SongVList extends StatefulWidget {
  final List<SongResponse> items;
  final AudioPlayer audioPlayer;

  const SongVList({
    Key? key,
    required this.items,
    required this.audioPlayer,
  }) : super(key: key);

  @override
  SongVListState createState() => SongVListState();
}

class SongVListState extends State<SongVList> {
  int currentPlay = -1;
  int currentFocus = -1;
  late List<SongResponse> songs;

  // target url
  void launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    songs = widget.items;

    widget.audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state != PlayerState.playing) {
        setState(() {
          currentPlay = -1;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(top: ResDimens.d10),
            child: Container(
              decoration: BoxDecoration(
                  color: ResColors.black2,
                  borderRadius:
                      BorderRadius.all(Radius.circular(ResDimens.d8))),
              child: Padding(
                padding: const EdgeInsets.all(ResDimens.d4),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(ResDimens.d10)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black26,
                                  ),
                                  width: 50,
                                  height: 50,
                                  child: IconButton(
                                      onPressed: () async {
                                        if (currentPlay == index) {
                                          print(
                                              "Stop -----------------------------------");
                                          widget.audioPlayer.pause();
                                          setState(() {
                                            currentPlay = -1;
                                          });
                                        } else {
                                          widget.audioPlayer.play(UrlSource(
                                              widget.items[index].ituneLink
                                                  .toString()));
                                          setState(() {
                                            currentPlay = index;
                                            currentFocus = index;
                                          });
                                        }
                                      },
                                      icon: (currentPlay == index)
                                          ? Icon(Icons.pause)
                                          : Icon(Icons.play_arrow)),
                                ),
                              ),
                              ResSpace.w8(),
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                          child: Text(
                                            songs[index].name!,
                                        style: ResText.songName,
                                      )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Artist ",
                                        style: ResText.grey,
                                      ),
                                      Text("${songs[index].artist}"),
                                    ],
                                  ),
                                ],
                              )),
                              ResSpace.w8(),
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: songs[index].amazonLink,
                              child: Text('Amazon'),
                            ),
                            PopupMenuItem(
                              value: songs[index].youtubeLink,
                              child: Text('Youtube'),
                            ),
                            PopupMenuItem(
                              value: songs[index].spotifyLink,
                              child: Text('Spotify'),
                            ),
                            PopupMenuItem(
                              value: songs[index].appleLink,
                              child: Text('Apple'),
                            ),
                          ],
                          onSelected: (value) {
                            launchURL(value);
                          },
                        ),
                      ],
                    ),
                    (currentFocus == index)
                        ? Player(player: widget.audioPlayer)
                        : Container()
                  ],
                ),
              ),
            ));
      },
    );
  }
}
