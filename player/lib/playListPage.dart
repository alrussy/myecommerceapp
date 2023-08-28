

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player/constant/colors.dart';
import 'package:player/controller/player_controller.dart';
import 'package:player/home.dart';
import 'package:player/player_audio_page.dart';

class PlayListView extends GetView<PlayerController> {
  const PlayListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int i=controller.playlistIndex!;
    int test=i+1;
    return GetBuilder<PlayerController>(
          builder: (c) => Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              title:Text(controller.boxPlayList.getAt(i)!.name,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 4),),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(onPressed: ()=>controller.setPageIndex2(0,i),icon:Icon(Icons.arrow_back_sharp),),
            ),
            body:Container(
              decoration: BoxDecoration(
                 color:bgColor
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: LoopModelView(list:controller.songModels),
                  ),

                  InkWell(
                    onTap: ()=> controller.setPageIndex2(2,i),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical:10,horizontal: 5),
                      padding:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26,width: 2)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                          Text ('Add To Playlist',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  controller.songModels.isNotEmpty
                  ?Expanded(
                    child:ListView.builder(
                      scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount:controller.songModels.length,
                        itemBuilder: (context, index) =>Visibility(
                          visible:controller.foundSound.contains(controller.mySounds![index])||
                              (!controller.foundSound.isNotEmpty&&controller.valueSearch!.isEmpty),
                          child: CustomListTileAudio(
                            index: index,test: test,
                            title:controller.songModels[index].title ,
                            artist: controller.songModels[index].artist
                                .toString(),
                            duration:
                            controller.songModels[index].duration!,
                            id:controller.songModels[index].id,
                            event: ()async {
                              controller.setSongModels(i);
                              if(controller.test!=test){
                              await controller.setAudioSource(controller.playList,index,test);}
                             controller.playSound(index);
                            },
                            widget:  IconButton(
                              onPressed: ()async{
                                await controller.removeFromPlayList(i,controller.songModels[index].id);
                                controller.setSongModels(i);
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.white,
                            ),
                          ),
                        )
                    ),

                  )
                  :Expanded(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text('Playlist Not content any sound....\n  please..press "Add To playlist" for add sound to this playlist ',
                          style: TextStyle(color:Colors.red.shade100,height:2,),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,

                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),

          )

      );
  }
}
