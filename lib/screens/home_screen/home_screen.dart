import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_example/data/bloc/product/product_bloc.dart';
import 'package:retrofit_example/data/model/response/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  _init()async{
    Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          centerTitle: true,
        ),
        body: BlocConsumer<ProductBloc, ProductState>(
          builder: (context, state) {
            return ListView(
              children: [ ...List.generate(state.products!.length, (index) {
                Product product = state.products![index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  leading: CachedNetworkImage(imageUrl: product.image),
                );
              })],
            );
          },
          listener: (context, state) {
            if (!state.isLoading) {
              setState(() {});
            }
          },
        ));
  }
}
