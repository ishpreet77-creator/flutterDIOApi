import 'package:flutter/material.dart';
import 'package:flutter_dio_http/ApiRequest/Apirequest.dart';

import 'package:provider/provider.dart';
import 'LoderWidget/LoderWidget.dart';
import 'Viewmodel/ViewModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(
          create: (_) => UserViewModel(),
        ),
        // Add more providers for other data models
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final myViewModel = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<UserViewModel>(builder: (context, viewModel, _) {
        return Stack(
          children: [
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // myViewModel.fetchUsers();
                      myViewModel.createUser(User(body: "hello", title: "developer", userId: 1));
                    },
                    child: Text('Fetch Data'),
                  ),
                  Text("name:- ${viewModel.PostUser?.body ?? ""}")
                ],
              ),
            ),
            if (viewModel.isLoading) LoadingWidget() else if (viewModel.error.isNotEmpty) ErrorToast(error: "error:- ${viewModel.error.toString()}")
          ],
        );
      }),
    );
  }
}
