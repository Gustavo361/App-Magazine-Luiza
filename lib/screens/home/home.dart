import 'package:flutter/material.dart';
import 'package:proj_magazine_luiza/models/product.dart';
import 'package:proj_magazine_luiza/provider/products_list.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo.jpg",
        ),
        title: Text(
          "Ofertas do dia!",
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: listOfProducts.length,
      ),
    );
  }

  Widget builder(BuildContext, int index) {
    Product products = listOfProducts.elementAt(index);
    return ListTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Image.asset(
                  products.photo,
                  height: 120,
                  width: 120,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        products.features,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "R\$ ${products.price.toString()}",
                        style: TextStyle(
                          color: Color(0xFF0F79E3),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            products.price_description,
                            style: TextStyle(
                              color: Color(0xFF1087FF),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            icon: Hero(
                              tag: products.isFavorite,
                              child: Icon(
                                (products.isFavorite)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red.shade400,
                                size: 23,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                products.isFavorite = !products.isFavorite;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
