import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/category_model.dart';
import '../../../blocs/product/product_bloc.dart';
import '../../../blocs/product/product_event.dart';
import '../screens/product_list_screen.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(category.name),
          trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          onTap: () {
            context.read<ProductBloc>().add(FetchProductsByCategory(category.slug));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductListScreen(category: category),
              ),
            );
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
