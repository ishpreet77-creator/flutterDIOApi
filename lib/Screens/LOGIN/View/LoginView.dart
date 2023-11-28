import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_http/Screens/HOME/View/HomeView.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../Helper/Appdefault/Appdefault.dart';
import '../../../Helper/BaseClass/BaseClass.dart';
import '../../../Widget/LoderWidget/LoderWidget.dart';
import '../ApiRequest/Apirequest.dart';
import '../ViewModel/LoginVM.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyLoginPage(title: 'Flutter Demo Home Page');
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<MyLoginPage> {
  var loadedData;
  var models;
  @override
  void initState() {
    // save();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myViewModel = Provider.of<LoginViewModel>(context, listen: false);

    TextEditingController tfTitle = TextEditingController();
    TextEditingController tfBody = TextEditingController();
    TextEditingController tfUserID = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<LoginViewModel>(builder: (context, viewModel, _) {
        return Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tfTitle,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tfBody,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Body',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tfUserID,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'UserId',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (tfBody.text.isEmpty || tfUserID.text.isEmpty || tfTitle.text.isEmpty) {
                        BaseClass().showErrorToast("pleae enter data");
                      } else if (BaseClass().isValidEmail(tfBody.text) == false) {
                        BaseClass().showErrorToast("pleae enter vailed email");
                      } else {
                        myViewModel.createUser(User(body: tfBody.text, title: tfTitle.text, userId: int.parse(tfUserID.text))).then((value) {
                          tfBody.text = "";
                          tfTitle.text = "";
                          tfUserID.text = "";
                          save();
                          BaseClass.baseclass.PushScreen2(context, HomeView());
                        });
                      }
                    },
                    child: Text('Save Data'),
                  ),
                  Text("${viewModel.PostUser?.title ?? "ishusingh"}")
                ],
              ),
            ),
            if (viewModel.isLoading) LoadingWidget()
             else if (viewModel.error.isNotEmpty) ErrorToast(error: "error:- ${viewModel.error.toString()}")
          ],
        );
      }),
    );
  }

  void save() async {
    await AppDefault.shared.myString('token');
  }
}
