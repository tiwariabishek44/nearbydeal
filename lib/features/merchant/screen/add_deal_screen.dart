import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nearby/features/merchant/screen/Merchant_screen.dart';
import 'dart:io';
import '../../../common/custom_button.dart';
import '../../../common/newcustomfield.dart';
import '../../../constant/global_variable.dart';
import '../../../constant/utils.dart';
import '../sercices/merchantservices.dart';

class AddDealScrean extends StatefulWidget {
  static const String routeName = '/add-deal-screen';
  const AddDealScrean({Key? key}) : super(key: key);

  @override
  State<AddDealScrean> createState() => _AddDealScreanState();
}

class _AddDealScreanState extends State<AddDealScrean> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountcontroller = TextEditingController();
  final TextEditingController limitcontroller  = TextEditingController();
  final MerchintServices _merchintServices = MerchintServices();


  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    discountcontroller.dispose();
    limitcontroller.dispose();
  }


  void sellProduct() {
    if(_addProductFormKey.currentState!.validate()&& images.isNotEmpty){
      _merchintServices.selldeals(context: context, name: productNameController.text,
          description: descriptionController.text,
          price:double.parse(priceController.text) , limit: double.parse(limitcontroller.text),
          discount: double.parse(discountcontroller.text), images: images);
    }

  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                  items: images.map(
                        (i) {
                      return Builder(
                        builder: (BuildContext context) => Image.file(
                          i,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 200,
                  ),
                )
                    : GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open,
                            size: 40,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Select Deal Images',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: productNameController,
                  hintText: 'Product Name',
                ),

                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: discountcontroller,
                  hintText: 'Discount per invite',
                ),   const SizedBox(height: 10),
                CustomTextField(
                  controller: limitcontroller,
                  hintText: 'Limitation',
                ),
                SizedBox(height: 10,),

                CustomButton(
                  color:  Color(0xffFF0000),
                  text: 'Sell',
                  onTap: sellProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}