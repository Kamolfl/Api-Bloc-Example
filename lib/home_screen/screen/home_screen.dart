import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadingDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DasturchiMobile Bloc'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccessState) {
            print('HomeSuccess');
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    footer: GridTileBar(title: Text(state.productList[index].title!), backgroundColor: Colors.black45),
                    header: GridTileBar(title: Text('${state.productList[index].price!}'), backgroundColor: Colors.black45),
                    child: Image.network(state.productList[index].image!, fit: BoxFit.fill),
                  ),
                );
              });
          }
          if (state is HomeErrorState) {
            print('HomeError');
            return const Center(child: Icon(Icons.error, size: 120));
          }
          print('Loading');
          // return const Center(child: CircularProgressIndicator());
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const Card(
                  child: Center(child: CircularProgressIndicator()),
                );
              });
        },
      ),
    );
  }
}
