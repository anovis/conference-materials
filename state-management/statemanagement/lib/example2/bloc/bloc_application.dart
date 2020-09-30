import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/example2/bloc/cart/bloc/cart_bloc.dart';
import 'package:statemanagement/example2/bloc/cart/my_cart.dart';
import 'package:statemanagement/example2/bloc/catalog/bloc/catalog_bloc.dart';
import 'package:statemanagement/example2/bloc/catalog/my_catalog.dart';


class Example2BlocApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatalogBloc>(
          create: (_) => CatalogBloc()..add(CatalogStarted()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Shopping Cart',
        initialRoute: '/',
        routes: {
          '/': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
