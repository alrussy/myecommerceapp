
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataview extends StatelessWidget {
 final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataview({Key? key,required this.statusRequest,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        statusRequest==StatusRequest.LOADING?
        Center(
     child: CircularProgressIndicator(),)
            : statusRequest==StatusRequest.OFFLINE_FAILURE ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(ImageAssets.LOTTIE_OFFLINE,),
              Container(
                child: Text('Offline',style: TextStyle(fontSize: 30,fontFamily: FontsApp.sriracha),
                ),
              )
            ],
          ),
        )
            : statusRequest==StatusRequest.SERVER_FAILURE ?
        Center(
          child:Lottie.asset(ImageAssets.LOTTIE_SERVER_FAILURE,),)
            :
    statusRequest==StatusRequest.FAILURE ?
        Center(
          child: Container(
            child: Text('No Data',style: TextStyle(fontSize: 30),),
          ),
        ):
        widget;

  }
}

class HandlingDatRequest extends StatelessWidget {
final StatusRequest statusRequest;
final Widget widget;
const HandlingDatRequest({Key? key,required this.statusRequest,required this.widget}) : super(key: key);

@override
Widget build(BuildContext context) {
return
statusRequest==StatusRequest.LOADING?
 Center(
child:Lottie.asset(ImageAssets.LOTTIE_LOADING,),
 )
    : statusRequest==StatusRequest.OFFLINE_FAILURE?
Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Lottie.asset(ImageAssets.LOTTIE_OFFLINE,),
Container(
child: Text('Offline',style: TextStyle(fontSize: 30,fontFamily: FontsApp.sriracha),),),

],
),
)
    : statusRequest==StatusRequest.SERVER_FAILURE?
Center(
child:  Lottie.asset(ImageAssets.LOTTIE_SERVER_FAILURE,),
): widget;

}
}
