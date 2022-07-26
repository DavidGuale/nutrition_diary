import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../pages/home/home_page.dart';
import '../pages/product/product_page.dart';
import '../routes/routes.dart';
import 'custom_result_search.dart';

class ProductSearchDelegate extends SearchDelegate {
  // final _clientsRepository = Get.i.find<CustomersRepository>();
  // List<Customer> _customersFound = [];
  @override
  String? get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      homeProvider.read.getProductsSearch(query);
      return Consumer(builder: (_, ref, __) {
        final productsSearch = ref
            .watch(homeProvider.select((_) => _.productsSearch))
            .productsSearch;
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: productsSearch.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                productProvider.read.product = productsSearch[index];
                Navigator.pushNamed(context, Routes.product);
              },
              child: CustomResultSearch(product: productsSearch[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
          },
        );
      });
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final productsSearch = ref
          .watch(homeProvider.select((_) => _.productsSearch))
          .productsSearch;
      if (productsSearch.isEmpty) {
        return const Center(
          child: Text('No se encontraron resultados'),
        );
      }
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: productsSearch.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              productProvider.read.product = productsSearch[index];
              Navigator.pushNamed(context, Routes.product);
            },
            child: CustomResultSearch(product: productsSearch[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
      );
    });
  }
}
