


import 'package:ecommerce_app/controller/address_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AddressController addressController=Get.put(AddressController());
    return
      Scaffold(
          floatingActionButton:FloatingActionButton(
            onPressed: (){
              addressController.goToAddAddress();
            },
            child: Icon(Icons.add),
            backgroundColor: AppColors.primary,
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed: (){
              Get.back();
            },icon: Icon(Icons.arrow_back,color: AppColors.primary,),),
            title: Text('Addresses',style: TextStyle(fontSize:25,color: AppColors.primary),),
            centerTitle: true,
            elevation: 0,
            actions: [
              GetBuilder<AddressController>(builder:(controller2)=> controller2.addresses.isNotEmpty
                  ? TextButton(onPressed: ()=>controller2.removeAll(), child: Text('Remove All'))
                  :SizedBox.shrink())
            ],
          ),
          body:GetBuilder<AddressController>(builder:(controller)=>
        HandlingDataview(statusRequest: controller.statusRequest, widget: 
         controller.addresses.isNotEmpty?
      ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          itemCount: controller.addresses.length,
          itemBuilder: (context,index)=> Card(
        elevation: 5,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(controller.addresses[index].name!),
          subtitle: Text('${controller.addresses[index].city} - ${controller.addresses[index].region} -${controller.addresses[index].street} '),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => controller.remove(index),
          ),
        ),
      ))

          :SizedBox.shrink()
    )
    ));
  }
}
