import 'package:ecommerce_app/controller/item_by_product_controller.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/fonts/app_fonts.dart';

class ItemsByProductPage extends StatelessWidget {
  ItemsByProductPage({Key? key}) : super(key: key);
  final ItemsByProductController controller =
      Get.put(ItemsByProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            customHead(context),
            SizedBox(
              height: 30,
            ),
            customSearch(),
            customListCategories(),
            customCard()
          ],
        ),
      )),
    );
  }

  customSearch() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined, size: 25),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200),
        ),
        Flexible(
          child: TextField(
            style: TextStyle(fontSize: 20, fontFamily: AppFonts.alkatra),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
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

  customHead(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '${controller.product!.name}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            Get.toNamed(RoutesName.FAVORITE_PAGE);
          },
          icon: Icon(
            Icons.favorite_border_outlined,
            color: Colors.black54,
          ),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {
            controller.gotToHomePage();
          },
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black54,
          ),
          iconSize: 30,
        )
      ],
    );
  }

  customCard() {
    return GetBuilder<ItemsByProductController>(
        builder: (ctrl) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 320, mainAxisSpacing: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 3),
              scrollDirection: Axis.vertical,
              itemCount: ctrl.items.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  ctrl.goToItemDetails(index);
                },
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 180,
                      margin: EdgeInsets.only(right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            ctrl.items![index].image!,
                            fit: BoxFit.contain,
                            width: 170,
                            height: 200,
                          ),
                          Text(
                            '${ctrl.items[index].name}',
                            style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                            overflow:TextOverflow.ellipsis,
                          )
                          ),
                          Text('brand : ${controller.items[index].brand!.name!}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                overflow:TextOverflow.ellipsis
                              )),
                          Row(
                            children: [
                              Text('\$',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade400)),
                              Text('${ctrl.items![index].price}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:Colors.white,
                      ),
                    ),
                    Positioned(
                        left: 5,
                        top: 15,
                        child: IconButton(
                          key: UniqueKey(),
                          onPressed: () async {
                            ctrl.setIsFavorite(ctrl.items[index]);
                            print(ctrl.items[index].isFavorite);
                          },
                          icon: !ctrl.items[index].isFavorite
                              ? Icon(Icons.favorite_border_outlined)
                              : Icon(Icons.favorite),
                          color: Colors.blue.shade400,
                        )),
                  ],
                ),
              ),
            ));
  }

  customListCategories() {
    return GetBuilder<ItemsByProductController>(
        builder: (ctrl) => SizedBox(
            height: 45,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: ctrl.categories.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  ctrl.changeSelectCat(index);
                },
                child: AnimatedContainer(
                  child: Text(
                    '${ctrl.categories[index].name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: index == ctrl.selectCat ? 18 : 15,
                        color: index == ctrl.selectCat
                            ? Colors.blue.shade400
                            : Colors.grey.shade500),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: index == ctrl.selectCat
                            ? BorderSide(color: Colors.blue.shade400, width: 2)
                            : BorderSide.none),
                  ),
                  duration: Duration(milliseconds: 300),
                ),
              ),
            )));
  }
}
