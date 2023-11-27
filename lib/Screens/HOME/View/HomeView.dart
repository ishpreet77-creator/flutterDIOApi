import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helper/Appdefault/Appdefault.dart';
import '../../HOME/Viewmodel/ViewModel.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var loadedData;
  var models;
  @override
  void initState() {
    // save();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myViewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text("home"),
              ElevatedButton(
                child: Text("logout"),
                onPressed: () {
                  final val = AppDefault.shared.clear();
                  print(val.toString());
                },
              )
            ],
          ),
        )
        // Consumer<UserViewModel>(builder: (context, viewModel, _) {
        //   return Stack(
        //     children: [
        //       Center(
        //         child: Column(
        //           children: [
        //             ElevatedButton(
        //               onPressed: () {
        //                 setState(() {
        //                   save();
        //                 });
        //                 myViewModel.fetchUsers();
        //                 // myViewModel.createUser(User(body: "hello", title: "developer", userId: 1));
        //               },
        //               child: Text('save Data'),
        //             ),
        //             ElevatedButton(
        //               onPressed: () {
        //                 setState(() {
        //                   // getvalue();
        //                   // getmodel();
        //                 });

        //                 // myViewModel.fetchUsers();
        //                 // myViewModel.createUser(User(body: "hello", title: "developer", userId: 1));
        //               },
        //               child: Text('Fetch Data'),
        //             ),
        //             // Text("name:- ${viewModel.PostUser?.body ?? ""}")
        //             // Text("name:- ${viewModel.users?.name ?? ""}")
        //             Text("name:- ${loadedData ?? ""}")
        //           ],
        //         ),
        //       ),
        //       if (viewModel.isLoading) LoadingWidget() else if (viewModel.error.isNotEmpty) ErrorToast(error: "error:- ${viewModel.error.toString()}")
        //     ],
        //   );
        // }),
        );
  }

  void save() async {
    await AppDefault().myString('token');
  }
}
