import 'package:commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:commerce/core/repos/products_repo/products_repo.dart';
import 'package:commerce/core/services/get_it_service.dart';
import 'package:commerce/features/home/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductsRepo>(),
      ),
      child: const ProductsViewBody(),
    );
  }
}
