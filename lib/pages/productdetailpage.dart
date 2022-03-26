import 'package:droneshop/widgets/productslider.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final String price;
  final List mulImg;
  final List size;
  final String logo;

  const ProductDetailPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.mulImg,
      required this.size,
      required this.logo})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1),
                  ]),
              child: Stack(
                children: [
                  ProductSlider(items: widget.mulImg),
                  SafeArea(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)))
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Image(
              image: AssetImage('assets/images/' + widget.logo),
              fit: BoxFit.cover,
              width: 150,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Rp ' + widget.price,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 25, right: 25),
                    //   child: Text(
                    //     'Size Guide',
                    //     style: TextStyle(
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.w600,
                    //         height: 1.5),
                    //     textAlign: TextAlign.justify,
                    //   ),
                    // ),
                  ]),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(widget.size.length, (index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          activeSize = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: activeSize == index ? Colors.black : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                color: Colors.black.withOpacity(0.1)
                              )
                            ]
                          ),
                          child: Center(
                            child: Text(widget.size[index], style: TextStyle(
                              fontSize: 22,
                              color: activeSize == index ? Colors.white : Colors.black
                            )),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.1)
                        )
                      ],
                      color: Colors.grey[200]
                    ),
                    child: const Center(
                      child: Icon(Icons.favorite_outline),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: (){}, 
                      child: const Center(
                        child: Text('Add to Cart', style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: Colors.black,
                    ),
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
