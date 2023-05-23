import 'package:base_flutter_bloc/core/network/params/params_search_user.dart';
import 'package:base_flutter_bloc/layer/presentation/home/view/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injectable.dart';
import '../../../widget/loading_widget.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<HomeBloc>()
          ..add(HomeSearchSubmitted(ParamsSearchUser(q: "abc"))),
        child: HomeView(),
      );
}

class HomeView extends StatefulWidget {
  HomeView({super.key});

  final textController = TextEditingController();
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.error != null) {
          // Demo alert only, update after having design
        }
      },
      builder: (context, state) => LoadingWidget(
            running: state.status == HomeStatus.loadInProgress,
            child: Column(
              children: [
                TextField(
                  controller: widget.textController,
                ),
                const Expanded(child: HomeBody()),
                FloatingActionButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(HomeSearchSubmitted(
                        ParamsSearchUser(q: widget.textController.text)));
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ));
}
