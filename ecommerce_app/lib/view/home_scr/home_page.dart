
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/app_exceptions.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  ServiceApp serviceApp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GetBuilder<HomeController>(builder: (controller)=>
                HandlingDataview(statusRequest: controller.statusRequest, widget:ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    customHead(),
                    SizedBox(height: 30,),
                    customSearch(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 10),
                      child: Text('Product', style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge),
                    ),
                    customListProducts(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:20),
                      child: Text('Continue...', style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge),
                    ),
                    // customListCategories(),
                    //  customCard()
                    customListGroups(context)


                  ],
                ),
                )
            ),
          ),


        )
    );
  }

  customListProducts() {
    return
      Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [

          ...List.generate(controller.product!.length, (index) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text(

                      '${controller.product![index].name}',
                      style: TextStyle(
                        color:index == controller.selectProd
                            ?Colors.white
                            :Colors.grey.shade600 ,

                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 10)),
                        backgroundColor: MaterialStatePropertyAll(
                            index == controller.selectProd ? Colors.blue.shade400 : Colors.grey
                                .shade200),
                        fixedSize: MaterialStatePropertyAll(Size(Get.width/4.8,50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))
                    ), onPressed: () {
                    controller.changeSelectPro(index);
                    controller.goToItemsByProductPage(controller.product![index]);
                    print(controller.product![index].name);
                  },
                  ),
                ],
              )
          ),
        ],

      );
  }

  customListCategories() {
    return
      SizedBox(
          height: 45,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 20,),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10,),
            scrollDirection: Axis.horizontal,
            itemCount: controller.product!.length,
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: (){
                    controller.changeSelectPro(index);

                  },
                  child: AnimatedContainer(
                    child: Text('${controller.product![index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: index == controller.selectProd ?18:15,
                          color: index == controller.selectProd ? Colors.blue.shade400 : Colors.grey
                              .shade500),),
                    decoration: BoxDecoration(
                      border: Border(bottom: index == controller.selectProd ? BorderSide(
                          color: Colors.blue.shade400,width: 2) : BorderSide.none),
                    ), duration: Duration(milliseconds: 300),

                  ),
                ),

          )

      );
  }


  customHead() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text('A'),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Mornning', style:Get.theme
                  .textTheme
                  .bodyLarge,),
              Text(controller.userName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ],
          ),
        ),
        Spacer(),
        IconButton(onPressed: () {
          controller.goToFavoritePage();
        },
          icon: Icon(Icons.favorite_border_outlined, color: Colors.black54,),
          iconSize: 30,),
        IconButton(onPressed: () {},
          icon: Icon(
            Icons.notifications_active_outlined, color: Colors.black54,),
          iconSize: 30,)

      ],
    );
  }

  customSearch() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {}, icon: Icon(Icons.search_outlined, size: 25),),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200
          ),
        ),
        Flexible(
          child: TextField(
            style: TextStyle(fontSize: 20, fontFamily: FontsApp.alkatra),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black45),
              border: OutlineInputBorder(borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              isDense: true,

            ),
          ),
        )
      ],
    );
  }

  customListGroups(BuildContext context){

    return ListView.builder(
        itemCount: controller.product!.length,

        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        clipBehavior: Clip.antiAlias,
        itemBuilder:(context,i) {
          final List<Item> items= controller.getAllItemByProduct(i);
          return items.isNotEmpty?Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${controller.product![i].name} ',style: TextStyle(color: Colors.black54),),
                    Text('Show All')
                  ],
                ),
              ),
              SizedBox(height: 20,),
              GridView.builder(
                padding: EdgeInsets.only(bottom: 30),
                shrinkWrap: true,
                primary: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:1,
                  mainAxisExtent:Get.height/6,
                ),
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: (){
                      controller.goToItemDetailsPage(items[index]);
                    },
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip. antiAliasWithSaveLayer,
                          margin: EdgeInsets.only(right: 5),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              Image.network('${items[index].image}'
                                ,fit: BoxFit.scaleDown
                                ,height:110,width:120,scale: 2,),
                             // Image.asset('assets/test/f.jpg',fit: BoxFit.fill,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('\$', style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade400)),
                                  Text('${items[index].price}', style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  );
                },)


            ],
          ):SizedBox.shrink();

        }
    );
    // separatorBuilder:(context,i)=>Divider(color: Colors.white,thickness: 2,

  }

  }