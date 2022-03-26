import 'package:droneshop/constant/product_data.dart';
import 'package:droneshop/pages/productdetailpage.dart';
import 'package:droneshop/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25,right: 25, left: 25, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Drones', style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600
                ),),
                Row(
                  children:const [
                  Text('Sort by', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(width: 10,),
                  Padding(
                    padding: EdgeInsets.only(top :5),
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.grey,)
                  )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: List.generate(products.length, (index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (_) =>
                      ProductDetailPage(
                        id: products[index]['id'], 
                        name: products[index]['name'], 
                        img: products[index]['img'], 
                        price: products[index]['price'], 
                        mulImg: products[index]['mul_img'],
                        size: products[index]['sizes'],
                        logo: products[index]['logo'],
                      )
                    )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 25),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 2
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                width: 250,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/'+products[index]['img'],
                                    ),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Text(products[index]['name'], style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 15,),
                            Text('Rp '+products[index]['price'], style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 10,)
                          ]
                        ),
                      ),
                      const Positioned(
                        right: 10,
                        child: IconButton(onPressed: null, icon: Icon(
                          Icons.favorite_outline
                        )),
                      )
                    ],
                  ),
                ),
              );
            })
          )
        ],
      ),
    );
  }
}