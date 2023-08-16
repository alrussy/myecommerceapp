import 'package:ecommerce_app/controller/card_controoler.dart';
import 'package:ecommerce_app/data/model/my_card.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListTile extends GetView<CardController> {
   CustomListTile({Key? key,required this.card}) : super(key: key);
  MyCard card;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        controller.goToItemDetailsPage(card);

      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: EdgeInsets.only(bottom: 10,left: 5),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 2,color: AppColors.primary,))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.network(card.item!.image!,fit: BoxFit.scaleDown,width: 50,height: 90,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 180,
                            child: Text('${card.item!.name}',
                              overflow: TextOverflow.ellipsis,
                                  )),
                        Text('${card.item!.priceAfterDescount}'),
                        Text('total=${card.item!.priceAfterDescount!*card.count!}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.increment(card);
                    print('${card.item!.name } - ${card.count}');

                  },
                  overlayColor:
                  MaterialStateProperty.all(Colors.blue),
                  child: Icon(Icons.add),
                ),
                    Container(
                  alignment: Alignment.center,
                  width: 50,
                  child:Text(
                    '${card.count}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: EdgeInsets.all(5),

                ),

                InkWell(
                  onTap: () {
                    controller.desIncrement(card);
                    print('${card.item!.name } - ${card.count}');
                  },
                  overlayColor:
                  MaterialStateProperty.all(Colors.blue),
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
