import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/core/colors.dart';
import 'package:my_app/data/api_service.dart';
import 'package:my_app/model/product_model.dart';

import '../widgets/custom_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ProductModel>>? futureData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Towner App',
          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBlueGreyColor,
      ),
      body: futureData == null
          ? Center(
              child: Text(
                "Click the Floating button to Call Data",
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
              ),
            )
          : FutureBuilder<List<ProductModel>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kblue100,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error fetching data"),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final product = data[index];
                      final color = colors[index % colors.length];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomCardWidget(
                          title: product.title,
                          description: product.description,
                          image: product.image,
                          thumbnail: product.thumbnail,
                          bgColor: color,
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data available"));
                }
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              futureData = ApiService().getData();
            },
          );
        },
        backgroundColor: kBlueGreyColor,
        child: Icon(
          Icons.upload,
          color: kBlackColor,
        ),
      ),
    );
  }
}
