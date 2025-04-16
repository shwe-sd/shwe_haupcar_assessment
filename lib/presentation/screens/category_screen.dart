import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/category/category_event.dart';
import '../../../blocs/category/category_bloc.dart';
import '../../../blocs/category/category_state.dart';
import '../../../core/constants/language_constants.dart';
import '../../../blocs/locale/locale_bloc.dart';
import '../../../blocs/locale/locale_event.dart';
import '../../widgets/sticky_header_delegate.dart';
import '../widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.home),
        // backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.only(bottom: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.language, size: 40),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(context.tr.language),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text('English'),
              onTap: () {
                context.read<LocaleBloc>().add(ChangeLocale(Locale('en')));
              },
            ),
            ListTile(
              title: const Text('ไทย'),
              onTap: () {
                context.read<LocaleBloc>().add(ChangeLocale(Locale('th')));
              },
            ),
            ListTile(
              title: const Text('မြန်မာ'),
              onTap: () {
                context.read<LocaleBloc>().add(ChangeLocale(Locale('my')));
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                // Trigger category refresh or data reload logic here
                context.read<CategoryBloc>().add(FetchCategories()); // Assuming LoadCategories event reloads the categories
              },
              child: CustomScrollView(
                slivers: [
                  // Sticky Header
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyHeaderDelegate(title: context.tr.categories),
                  ),

                  // List of Categories
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final category = state.categories[index];
                        return CategoryTile(category: category);
                      },
                      childCount: state.categories.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CategoryError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
