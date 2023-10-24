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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (previous, current) => previous.products != current.products,
        builder: (context, state) => context.read<ProductBloc>().state.isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...List.generate(state.products!.length, (index) {
                          Product product = state.products![index];
                          return ListTile(
                            title: Text(product.title),
                            subtitle: Text(product.description),
                            leading:
                                CachedNetworkImage(imageUrl: product.image),
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
