import 'package:base_flutter_bloc/base/data_state.dart';
import 'package:base_flutter_bloc/core/network/params/params_search_user.dart';
import 'package:base_flutter_bloc/layer/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>();
    final listUser = state.state.users ?? [];

    return state.state.error == null
        ? ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (_context, _index) {
              final item = listUser[_index];
              return Card(
                elevation: 2,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(item.login ?? ''),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.avatarUrl ?? ''),
                      ),
                    )),
              );
            })
        : const Placeholder();
  }
}
