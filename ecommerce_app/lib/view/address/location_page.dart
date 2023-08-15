


import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor:AppColors.primary,
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Text('data'),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                  height: 250,
                  width: 150,
                  padding: EdgeInsets.only(top: 10,left: 8,right: 8),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/test/f.jpg',
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 10,),
                      Text('item 1',style: TextStyle(fontFamily: FontsApp.alkatra,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('200\$',style: TextStyle(color:ColorApp.primary,fontFamily: FontsApp.alkatra,fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                          }, icon: Icon(Icons.favorite) ,color: ColorApp.primary)
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: Offset(5,1),
                      )
                    ],
                  )),
            ),

            Positioned(
              left:-15,
              top: -20,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: ColorApp.primary,
                child: Text('20%',style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: Colors.white),),

                ),
              ),
          ],
        ),
      ),
    );
  }
}
