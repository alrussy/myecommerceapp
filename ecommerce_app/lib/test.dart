import 'package:ecommerce_app/controller/address_controller.dart';
import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';

import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(init:TestController(),
        builder: (controller)=>
        Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        body: Column(
          children: [
            SizedBox(
              height: 239,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Favorite',
                        style: t.headlineLarge,
                      ),
                    ),
                    customListCategory(),
                    customToolsFilters(),
                  ],
                ),
              ),
            ),
            customListItems(context,controller.show),
          ],
        )
        )
    );
  }
}

customToolsFilters() {
  TestController controller=Get.find();
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: const [
          Icon(Icons.filter_list_sharp),
          Text(
            'Filters',
            style: TextStyle(fontSize: 12),
          )
        ]),
        Row(children: const [
            Icon(Icons.sort),
            Text(
              'price:lowest to high',
              style: TextStyle(fontSize: 12),
            )
          ]),
  InkWell(
  onTap:()=>controller.changeShow(),
  child:Row(children: const [
          Icon(Icons.dashboard),
        ]),)
      ],
    ),
  );
}

customListCategory() {
  return SizedBox(
    height: 32,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, i) => cardCategories(i)),
  );
}

customListItems(context, show) {
  return Expanded(
    child: show == 'h'
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 270, mainAxisSpacing: 5),
            itemCount: 12,
            itemBuilder: (context, index) => cardItemsHorizontal(),
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisExtent: Get.width*0.40, mainAxisSpacing: 5),
            itemCount: 12,
            itemBuilder: (context, index) => cardItemsVertical(context)),
  );
}

cardCategories(i) {
  return Container(
    alignment: Alignment.center,
    width: 100,
    height: 30,
    margin: EdgeInsets.only(left: 10),
    child: Text(
      'cat$i',
      style: TextStyle(color: Colors.white),
    ),
    decoration: BoxDecoration(
        color: AppColors.primary, borderRadius: (BorderRadius.circular(20))),
  );
}

cardItemsVertical(index) {
  double cartHeight = 104;
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Card(
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            //===================Start image card==================
            Container(

              clipBehavior: Clip.antiAlias,
              height: Get.height,
              width: 104,
              child: Image.network(
                'https://m.media-amazon.com/images/I/51B6joAbuVL._AC_UY1000_.jpg',
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            ),
            //=====================end image card=========================

            //=====================start details card=========================
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'brand',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Text(
                      'item',
                      style: TextStyle(
                          color: AppColors.text,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Row(
                      children: const [
                        Text.rich(TextSpan(
                            text: 'color: ',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                            children: [
                              TextSpan(
                                  text: ' White',
                                  style: TextStyle(
                                      color: AppColors.text, fontSize: 11))
                            ])),
                        SizedBox(width: 50),
                        Text.rich(TextSpan(
                            text: 'Size: ',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                            children: [
                              TextSpan(
                                  text: ' XL',
                                  style: TextStyle(
                                      color: AppColors.text, fontSize: 11))
                            ])),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        Text.rich(TextSpan(
                          text: '34 ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                            text: '25 \$',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold),)
                          ]
                        )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Positioned(
        left: Get.width * 0,
        top: cartHeight * -0.1,
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 30,
          margin: EdgeInsets.only(left: 10),
          child: Text(
            '30%',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: (BorderRadius.circular(20))),
        ),
      ),
    ],
  );
}

cardItemsHorizontal() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Stack(
      children: [
        Container(
          width: Get.width * 0.45,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.width * 0.33,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image.network(
                      'https://m.media-amazon.com/images/I/51B6joAbuVL._AC_UY1000_.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'item',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.text,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                  text: 'color : ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: 'yellow',
                                      style: TextStyle(
                                        color: AppColors.text,
                                        fontSize: 11,
                                      ),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: 'Size : ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: 'XL',
                                      style: TextStyle(
                                        color: AppColors.text,
                                        fontSize: 11,
                                      ),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: '220',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: '  150',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: AppColors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, size: 18),
                          color: AppColors.primary)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 30,
          child: Text(
            '30%',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primary),
        ))
      ],
    ),
  );
}
