import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/category_model.dart';
import '../../../blocs/product/product_bloc.dart';
import '../../../blocs/product/product_event.dart';
import '../../../blocs/product/product_state.dart';
import '../../../core/constants/language_constants.dart';
import '../../core/services/api_service.dart';

class ProductListScreen extends StatelessWidget {
  final CategoryModel category;

  const ProductListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: BlocProvider(
        create: (context) =>
        ProductBloc(
          RepositoryProvider.of<ApiService>(context),
        )..add(FetchProductsByCategory(category.slug)),
        child: BlocBuilder<ProductBloc, ProductState>(
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
                        child: Card(
                          color: Theme.of(context).highlightColor, // Automatically adapts to light/dark theme
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Thumbnail
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: product.thumbnail,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(width: 100, child: Center(child: const CircularProgressIndicator())), // Placeholder while loading
                                    errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget if loading fails
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Title & Description
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: Theme.of(context).textTheme.titleMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        product.description,
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is ProductError) {
              return Center(child: Text('No item'));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
