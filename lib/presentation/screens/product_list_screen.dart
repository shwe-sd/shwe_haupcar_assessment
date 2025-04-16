import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/category_model.dart';
import '../../../blocs/product/product_bloc.dart';
import '../../../blocs/product/product_event.dart';
import '../../../blocs/product/product_state.dart';
import '../../../core/constants/language_constants.dart';
import '../widgets/product_tile.dart';

class ProductListScreen extends StatelessWidget {
  final CategoryModel category;

  const ProductListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: RefreshIndicator(
                onRefresh: () async {
                  // Trigger category refresh or data reload logic here
                  context.read<ProductBloc>().add(FetchProductsByCategory(category.slug)); // Assuming LoadCategories event reloads the categories
                },
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 6.0),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductTile(product: product);
                  },
                ),
              ),
            );
          } else if (state is ProductError) {
            return Center(child: Text(context.tr.noitem));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
