import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_show/controller/api_controller/product_list.dart';
import 'package:product_show/model/product_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Products> data = [];

  getProductList() async {
    data = await ProductListService.productListService();
    setState(() {});
  }

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Search here",
              suffixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.maxFinite,
                      child: Image.network("${data[index].imageUrl}",),
                    ),
                    Text("Name: ${data[index].name}"),
                    Text("Ratings: ${data[index].rating}"),
                    Text("Price: \$ ${data[index].price}"),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
