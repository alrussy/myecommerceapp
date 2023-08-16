

import 'package:ecommerce_app/controller/AddAddressController.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController addAddressController=Get.put(AddAddressController());
    return GetBuilder<AddAddressController>(builder: (controller)=> Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: (){
//          addAddressController.goToLocationPage();
          addAddressController.addAddress();
        },
        child: Icon(Icons.navigate_next),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Get.back();
        },icon: Icon(Icons.arrow_back,color: AppColors.primary,),),
        title: Text('Orders',style: TextStyle(fontSize:25,color: AppColors.primary),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            addAddressController.addAddress();
          }, icon: Icon(Icons.check))
        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children:[
        TextField(
          controller: addAddressController.nameController,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.text,
          ),
          autofocus: true,
          decoration: InputDecoration(
            isDense: true,
              filled: true,
              fillColor: Colors.white   ,
              border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary),borderRadius: BorderRadius.circular(10)),
              hintText: 'Enter Name',
              labelText:'Name',
          ),
        ),
          SizedBox(height: 10,),
          TextField(
            controller: addAddressController.cityController,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.text,
            ),
            autofocus: true,
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary),borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter City',
                labelText:'city'
            ),
            onSubmitted: (as){print('ggggg'); },
          ),
          SizedBox(height:10,),
          TextField(
            controller: addAddressController.regionController,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.text,
            ),
            autofocus: true,
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary),borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter Region',
                labelText:'Region'
            ),
          ),
          SizedBox(height:10,),

          TextField(
            controller: addAddressController.streetController,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.text,
            ),
            autofocus: true,
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary),borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter Street',
                labelText:'street',
            ),
          ),
          SizedBox(height:10,),
           TextFormField(
            controller: addAddressController.otherController,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.text,
            ),
            maxLines: 3,
            autofocus: true,
            decoration: InputDecoration(
              isDense: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary),borderRadius: BorderRadius.circular(10)),
                label:Text('Other'),

            ),
          ),

        ],
      ),

    )
    );
  }
}
