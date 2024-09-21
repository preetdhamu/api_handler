import 'dart:convert';
import 'dart:developer';

import 'package:api_handler/model/all_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  AllProductsModel? model;
  bool loading = false;

  fetchData() async {
    loading = true;
    final response =
        await http.get(Uri.parse('https://fakestoreapi.in/api/products'));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      model = AllProductsModel.fromJson(data);
    } else {
      log('Error ${response.statusCode}');
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 238, 1),
      body: loading == true
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.green[400]!, width: 1.0),
                            borderRadius: BorderRadius.circular(17.0)),
                        width: MediaQuery.of(context).size.width - 100,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.search),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "All Products ",
                      style: TextStyle(
                          color: Colors.green[400],
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model?.products?.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(vertical: 14.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green[100]!, blurRadius: 15.0)
                          ],
                          // borderRadius: BorderRadius.circular(7.0),
                          // border: Border.all(color: Colors.green[400]!, width: 1.0),
                        ),
                        height: 375,
                        width: 45,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 155,
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        model?.products?[index].image ?? '',
                                    errorWidget: (context, error, stackTrace) =>
                                        const Icon(Icons.error),
                                    // height: 155,
                                    // width: 45,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Positioned(
                                    top: 10,
                                    left: 20,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Price:\n',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  "${model?.products?[index].price.toString()}  \n",
                                              style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  "${(model?.products?[index].discount.toString())}% off "),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.green[300],
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${model?.products?[index].brand.toString()}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "${model?.products?[index].model.toString()}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${model?.products?[index].category.toString().toUpperCase()}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "${model?.products?[index].color.toString().toUpperCase()}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      "${model?.products?[index].description.toString()}",
                                      maxLines: 5,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "${model?.products?[0].brand.toString()}",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
    );
  }
}
