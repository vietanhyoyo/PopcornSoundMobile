import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_sound_mobile/components/widgets/audioplayers/player_widget.dart';
import 'package:popcorn_sound_mobile/components/widgets/audioplayers/stream_widget.dart';
import 'package:popcorn_sound_mobile/components/widgets/cus_audioplayers/player.dart';
import 'package:popcorn_sound_mobile/constants/res_colors.dart';
import 'package:popcorn_sound_mobile/constants/res_dimens.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/movie_detail/movie_detail_controller.dart';

class SongVList extends StatefulWidget {
  final List<Song> items;
  final AudioPlayer audioPlayer;

  const SongVList(
      {Key? key,
      required this.items,
      required this.audioPlayer,})
      : super(key: key);

  @override
  SongVListState createState() => SongVListState();
}

class SongVListState extends State<SongVList> {

  int currentPlay = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(top: ResDimens.d10),
            child: Container(
              decoration: BoxDecoration(
                color: ResColors.black2,
                borderRadius: BorderRadius.all(Radius.circular(ResDimens.d8))
              ),
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
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black26,
                                  ),
                                  width: 50,
                                  height: 50,
                                  child: IconButton(
                                      onPressed: () async {
                                        if(currentPlay == index){
                                          print("Stop -----------------------------------");
                                          widget.audioPlayer.stop();
                                          setState(() {
                                            currentPlay = -1;
                                          });
                                        } else {
                                          widget.audioPlayer.play(UrlSource(widget.items[index].ituneLink.toString()));
                                          setState(() {
                                            currentPlay = index;
                                          });
                                        }

                                      }, icon: (currentPlay == index) ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
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
                                        widget.items[index].name,
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
                                      Text("${widget.items[index].artist}"),
                                    ],
                                  ),
                                ],
                              )),
                              ResSpace.w8(),
                            ],
                          ),
                        ),
                        Icon(Icons.menu),
                      ],
                    ),
                    (currentPlay == index) ? Player(player: widget.audioPlayer) :Container()
                  ],
                ),
              ),
            ));
      },
    );
  }
}
