import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player/constant/colors.dart';
import 'package:player/controller/player_controller.dart';

class MyPlayListPage extends StatelessWidget {
  const MyPlayListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PlayerController());
    return GetBuilder<PlayerController>(
        builder: (controller) => Container(
                decoration: BoxDecoration(
                 color: bgColor
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: ()=> Get.defaultDialog(
                        titlePadding: EdgeInsets.symmetric(vertical: 15),
            title: 'new playlist',
            content: Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formState,
                    autovalidateMode:AutovalidateMode.always ,
                    child: TextFormField(
                      validator: (value)=>value!.isNotEmpty?null:'name is empty...!!',
                      autofocus: true,
                      controller: controller.name,
                      decoration: InputDecoration(
                        hintText: 'playlist name',
                        errorStyle: TextStyle(color:
                       Colors.red
                        )
                      ),
                    ),
                  ),
                )),


            onCancel:()=> Get.back(),
            onConfirm: () async=>controller.createPlayList(),
        ),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical:10,horizontal: 5),
                        padding:EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26,width: 2)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.add,color: Colors.white,size: 30,),
                            Text ('Add Playlist...',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),

                    controller.boxPlayList.isNotEmpty
                    ?Expanded(
                      child: ListView.builder(
                          itemCount:  controller.boxPlayList.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(10),
                                padding: EdgeInsets.only(bottom: 5),
                                child: InkWell(
                                  onTap: ()async{
                                    await controller.setPageIndex2(1, index);
                                    controller.setSongModels(index);
                                    },
                                     // Get.to(PlayListView(),arguments:index);},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 70,
                                            color: Colors.red,
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text( controller.boxPlayList.getAt(index)!.name,style:TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500),),
                                                SizedBox(height: 10,),
                                                Text('${ controller.boxPlayList.getAt(index)!.songModelsId.length} Sound',style:TextStyle(color: Colors.grey,fontSize: 15,fontWeight:FontWeight.w500)),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      IconButton(onPressed: (){controller.removePlayLists(index);}, icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),)
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey, width: 1))),
                              )),
                    )
                    :Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Playlist Is Empty....!\n  please..press "Add Playlist" for add playlist ',
                            style: TextStyle(color:Colors.red.shade100,height:2,),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,

                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),


                  ],
                ),
              ),

    );
  }
}

class MyCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 5, size.height, size.width / 2.25, size.height - 40);
    path.quadraticBezierTo(size.width - (size.width / 3.2), size.height - 90,
        size.width, size.height - 10);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
// SizedBox(
//   height: 80,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       CustomBoxWidget(
//         child: Icon(Icons.skip_previous,
//             color: Colors.white, size: 30),
//         bgcolor: Colors.deepPurple.shade400,
//         shadowColor1: Colors.deepPurple.shade600,
//         shadowColor2: Colors.deepPurple.shade300,
//         boxShape: BoxShape.circle,
//       ),
//       CustomBoxWidget(
//         child: Icon(Icons.play_arrow,
//             color: Colors.white, size: 30),
//         bgcolor: Colors.deepPurple.shade400,
//         shadowColor1: Colors.deepPurple.shade600,
//         shadowColor2: Colors.deepPurple.shade300,
//         boxShape: BoxShape.circle,
//       ),
//       CustomBoxWidget(
//         child: Icon(Icons.skip_next,
//             color: Colors.white, size: 30),
//         bgcolor: Colors.deepPurple.shade400,
//         shadowColor1: Colors.deepPurple.shade600,
//         shadowColor2: Colors.deepPurple.shade300,
//         boxShape: BoxShape.circle,
//       ),
//     ],
//   ),
// )