import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nearby/features/costumer/services/customer_services.dart';
import 'package:nearby/models/deals_model.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_button.dart';
import '../../../common/stars.dart';
import '../../../constant/global_variable.dart';
import '../../../provider/user_provider.dart';
import 'buying_page.dart';



class DetailScreen extends StatefulWidget {
  static const String routeName = 'detail-screen';
  final Deals deal;

  const DetailScreen({
    Key? key, required this.deal

  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  CustomerServices customersercices = CustomerServices();

  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;


  }


  void navigateToBuying() {
    Navigator.pushNamed(context, Buying_page.routeName,arguments: widget.deal);

  }



  void navigateToSearchScreen(String query) {
    // Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: '${user.name}',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Text(
                  widget.deal.id!,
                  ),
                  Stars(
                    rating: 4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.deal.name!,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            CarouselSlider(
              items: widget.deal.images.map(
                    (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.fill,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),


          SizedBox(height: 10,),


          Container(decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),

            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(
                      text: 'Deal Price : ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${widget.deal.price}',
                          style: const TextStyle(

                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.deal.description),
                ),
                Container(
                  color: Colors.black12,
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomButton(
                    text: 'Get a coupon',
                    onTap: navigateToBuying ,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomButton(
                    text: 'Geta a locaten',
                    onTap: (){
                    },
                    color: const Color.fromRGBO(254, 216, 19, 1),
                  ),
                ),

                const SizedBox(height: 10),
                Container(
                  color: Colors.black12,
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Rate The Product',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RatingBar.builder(
                  initialRating: myRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: GlobalVariables.secondaryColor,
                  ),
                  onRatingUpdate: (rating) {

                  },
                )
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}