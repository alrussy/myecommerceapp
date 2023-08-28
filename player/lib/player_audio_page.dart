import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:player/constant/colors.dart';
import 'package:player/controller/player_controller.dart';
import 'package:player/widgets/custom_box.dart';
import 'package:player/widgets/loop_mode.dart';
import 'package:player/widgets/next_control.dart';
import 'package:player/widgets/play_and_pause_control.dart';
import 'package:player/widgets/previous_control.dart';
import 'package:player/widgets/progress_player_control.dart';
import 'package:player/widgets/suffelMode.dart';

class PlayerAudioPage extends StatelessWidget {
  PlayerAudioPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PlayerController());
    return GetBuilder<PlayerController>(
      builder: (controller) => Scaffold(

        backgroundColor: bgColor,

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title:Text('Player Audio',style: Get.theme.textTheme.headlineSmall!.apply(color: Colors.grey.shade100)),
          elevation: 0,
          centerTitle: true,

        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBoxWidget(
                    bgcolor: bgColor,
                    shadowColor2: Colors.white38,
                    shadowColor1: Colors.deepPurple.shade600,
                    boxShape: BoxShape.rectangle,
                    child:Padding(
                      padding: const EdgeInsets.all(20),
                      child: InfoView(),
                    )
                  ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LoopModeWidget(),
                    ShuffleModeWidget(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: ProgressPlayer(color: Colors.white,barCapShape: BarCapShape.round,thumbRadius:5,timeLabelLocation: TimeLabelLocation.below,),
              ),

              CustomBoxWidget(
                bgcolor: bgColor,
                shadowColor2: Colors.white38,
                shadowColor1: Colors.deepPurple.shade600,
                boxShape: BoxShape.rectangle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomBoxWidget(
                          bgcolor: bgColor,
                          shadowColor2: Colors.white38,
                          shadowColor1: Colors.deepPurple.shade600,
                          boxShape: BoxShape.rectangle,
                          child: PreviousControllerWidget(size: 40,)),
                      CustomBoxWidget(
                          bgcolor: bgColor,
                          shadowColor2: Colors.white38,
                          shadowColor1: Colors.deepPurple.shade600,
                          boxShape: BoxShape.rectangle,
                          child: PlayAndPauseControllerWidget(size: 40,)),
                      CustomBoxWidget(
                          bgcolor: bgColor,
                          shadowColor2: Colors.white38,
                          shadowColor1: Colors.deepPurple.shade600,
                          boxShape: BoxShape.rectangle,
                          child: NextControllerWidget(size: 40,)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ), /*
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 40),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LoopModelView(),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProgressPlayer(),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Controllers(audioPlayer: controller.audioPlayer),
*/
      /*SizedBox(
                      height: 240.0,
                      child: StreamBuilder<SequenceState?>(
                          stream: controller.audioPlayer.sequenceStateStream,
                          builder: (context, snapshot) {
                            final state = snapshot.data;
                            final sequence = state?.sequence ?? [];
                            return ReorderableListView(
                                onReorder: (int oldIndex, int newIndex) {
                                  if (oldIndex < newIndex) newIndex--;
                                  controller.playList!.move(oldIndex, newIndex);
                                },
                                children: [
                                  for (var i = 0; i < sequence.length; i++)
                                    Dismissible(
                                      key: ValueKey(sequence[i]),
                                      background: Container(
                                        color: Colors.redAccent,
                                        alignment: Alignment.centerRight,
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(Icons.delete, color: Colors.white),
                                        ),
                                      ),
                                      onDismissed: (dismissDirection) {
                                        controller.playList!.removeAt(i);
                                      },
                                      child: Material(
                                        color: i == state!.currentIndex
                                            ? Colors.grey.shade300
                                            : null,
                                        child: ListTile(
                                          title: Text('title'),
                                          onTap: () {
                                            controller.audioPlayer
                                                .seek(Duration.zero, index: i);
                                          },
                                        ),
                                      ),
                                    ),
                                ]);
                          }),
                    ),
              */

      /*   ),
            ),
          ],
        ),
      ),*/
    );
  }
}

class InfoView extends GetView<PlayerController> {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.audioPlayer.sequenceStateStream,
        builder: (context, snapShot) {
          final state = snapShot.data;
          if (state?.sequence.isEmpty ?? true) {
            return Container(
              margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
              child: Icon(Icons.music_note, size: 50, color: Colors.green),
              decoration:
                  BoxDecoration(color: Colors.red,
                    borderRadius:BorderRadius.circular(50)
                  ),
            );
          }
          if (state!.currentSource!.tag != null) {
            final mediaItem = state.currentSource!.tag as MediaItem;
            return Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: Get.width,
                  height: 250,
                  child: QueryArtworkWidget(
                      keepOldArtwork: false,
                      id: int.parse(mediaItem.id),
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: Icon(
                        Icons.music_note,
                        size: 100,
                        color: listTile_iconColor,
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                      color: Colors.red,),
                  margin: EdgeInsets.only(bottom: 20),
                ),
          Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10),
          height: 30,
              child: Text(mediaItem.album!,
                    style: Theme.of(context).textTheme.titleLarge!.apply(color: Colors.grey.shade300)
                )),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  height: 30,
               child: Text(mediaItem.title,
                    style: Theme.of(context).textTheme.titleSmall!.apply(color: Colors.grey.shade100),overflow: TextOverflow.fade),
                )
              ],
            );
          }
          return Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            child: Icon(Icons.music_note, size: 50, color: Colors.green),
            decoration:
                BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)),
          );
        });
  }
}

class LoopModelView extends GetView<PlayerController> {
  LoopModelView({Key? key, this.list}) : super(key: key);
  final List<SongModel>? list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

        Expanded(
          child: Row(
            children: [

              Flexible(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  autofocus: false,
                  onChanged: (val)=>controller.search(val,list!),
                  onTapOutside:(val)=>Get.focusScope!.unfocus(),
                  decoration:InputDecoration(
                    hintText: 'search of sound',
                    hintStyle:TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 18,),
                    border: OutlineInputBorder( borderSide: BorderSide.none),
                    isDense: true,
                    prefixIcon:  Icon(Icons.search,color: Colors.white,size: 25,),



                  ),

                  style: TextStyle(

                    color: Colors.white,
                      fontSize: 18,),
                ),
              ),

            ],
          ),
        ),

        LoopModeWidget(),
        ShuffleModeWidget(),
      ]),
    );
  }
}
