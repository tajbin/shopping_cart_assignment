import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> product = [
    {
      "image": "assets/images/1.png",
      "title": "Pullover",
      "color": "Black",
      "size": "L",
      "price": "51\$",
      "quantity": 0,
    },
    {
      "image": "assets/images/2.png",
      "title": "T-Shirt",
      "color": "Gray",
      "size": "L",
      "price": "30\$",
      "quantity": 0,
    },
    {
      "image": "assets/images/3.png",
      "title": "Sports Dress",
      "color": "Black",
      "size": "M",
      "price": "43\$",
      "quantity": 0,
    },
  ];
  @override
  Widget build(BuildContext context) {
   num totalPrice = 0;

    for (var item in product) {

        totalPrice += (item["quantity"] * int.parse(item["price"].replaceAll('\$', '')));
    }

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "My Bag",
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        children: [
                          _buildProductList(),
                        ],
                      ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Amount",style:TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45
                          ),
                          ),
                          Text(
                          "$totalPrice\$"
                          ,style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                        ],
                      ),
                    const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                              ),
                            ),
                            onPressed: _showCheckoutSnackBar, child: const Text("CHECK OUT")),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
                        itemCount: product.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildProductsCardView(index),
                          );
                        });
  }

  Widget _buildProductsCardView(int index) {
    return Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 104,
                                      height: 104,
                                      child: Image.asset(
                                        product[index]["image"],
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product[index]["title"],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Color: ",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black26),
                                                  ),
                                                  Text(
                                                    product[index]["color"],
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Size: ",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black26),
                                                  ),
                                                  Text(
                                                    product[index]["size"],
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  _decreaseQuantity(index);
                                                } ,
                                                child: Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 2,
                                                        blurRadius: 15,
                                                        offset: const Offset(0,
                                                            3),
                                                      ),
                                                    ],
                                                  ),
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 24,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 36,
                                                width: 36,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  product[index]["quantity"].toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  _increaseQuantity(index);
                                                },
                                                child: Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 2,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3),
                                                      ),
                                                    ],
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 24,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                               Positioned(
                                 top: 0,
                                 right: 0,
                                 child:  Container(
                                   padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                 child: const Icon(
                                   Icons.more_vert,
                                   size: 24,
                                   color: Colors.black45,
                                 ),
                               ), ),
                               Positioned(
                                 bottom: 0,
                                 right: 0,
                                 child: Container(
                                   padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                 child: Text(product[index]["price"]),
                               ),)
                               /*Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                  alignment: Alignment.topRight,
                                        child: const Icon(
                                          Icons.more_vert,
                                          size: 24,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text(product[index]["price"]),
                                      ),
                                    ],
                                  ),
                                )*/
                              ],
                            ),
                          );
  }
  void _increaseQuantity(int index){
    setState(() {
      product[index]["quantity"]++;

      if(product[index]["quantity"]==5){
        _showQuantityReachedDialog(product[index]["title"].toString());
      }
    });
  }
  void _decreaseQuantity(int index){
    setState(() {
      if(product[index]["quantity"]>0){
        product[index]["quantity"]--;
      }
    });
  }
  void _showQuantityReachedDialog(String itemName){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text(
              textAlign: TextAlign.center,
                "Congratulations",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            ),
            content: Text(
                textAlign: TextAlign.center,
                "You have added 5 $itemName on your bag!",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: (){
                  Navigator.of(context).pop();
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                    ),
                    child:  const Text("Okay")),
              ),
            ],
          );
        });
  }
  void _showCheckoutSnackBar(){
   const snackBar=  SnackBar(

        content: Text("Congratulations! Your order has been placed."),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
