import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/common_widgets/progress_view.dart';
import '../model/post_model.dart';
import '../provider/home_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeProvider? provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      provider?.initializePage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    provider ??= context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ProgressView(
        progressMsg: "Loading",
        loading: provider?.isLoading ?? true,
        child: ListView.builder(
          itemCount: provider?.postList.length,
          itemBuilder: (context, index) {
            PostModel? model = provider?.postList[index];
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                model?.title ?? '-',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
