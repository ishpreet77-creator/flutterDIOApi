import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_http/Helper/BaseClass/BaseClass.dart';
import 'package:flutter_dio_http/Screens/HOME/Model/PersonModel.dart';
import 'package:provider/provider.dart';
import '../../../Helper/Appdefault/Appdefault.dart';
import '../../../Widget/LoderWidget/LoderWidget.dart';
import '../../../main.dart';
import '../Viewmodel/HomeViewModel.dart';
import '../../LOGIN/View/LoginView.dart';

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
  PersonModel? value;

  @override
  void initState() {
    super.initState();
    // datacall();
    getusermdoelvslue();

    if (Checkinternet == true) {
      BaseClass.baseclass.openBottomSheet(context, Checkinternet);
    } else {
      BaseClass.baseclass.openBottomSheet(context, false);
    }
  }

  datacall() {
    Provider.of<HomeViewModel>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<HomeViewModel>(builder: (context, viewModel, _) {
        return Stack(
          children: [
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AppDefault.shared.clear().then((value) {
                        BaseClass.baseclass.Pushreplacement(context, LoginView());
                      });
                    },
                    child: Text('logout'),
                  ),
                  //? getting the data with country api and set in the screen
                  Text("name:- ${viewModel.users?.name ?? "helllo ishpreet singh"}")
                ],
              ),
            ),
            if (viewModel.isLoading) LoadingWidget() else if (viewModel.error.isNotEmpty) ErrorToast(error: "error:- ${viewModel.error.toString()}"),
            Text("${value?.name}")
          ],
        );
      }),
    );
  }

  getusermdoelvslue() async {
    value = await AppDefault.shared.getModel<PersonModel>('user', (json) => PersonModel.fromJson(json));
  }
}
