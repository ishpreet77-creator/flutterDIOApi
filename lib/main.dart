import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Appdefault/Appdefault.dart';
import 'LoderWidget/LoderWidget.dart';
import 'Model/model.dart';
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
  var loadedData;
  var models;
  @override
  void initState() {
    // save();
    super.initState();
  }

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
                      setState(() {
                        // save();
                      });
                      myViewModel.fetchUsers();
                      // myViewModel.createUser(User(body: "hello", title: "developer", userId: 1));
                    },
                    child: Text('save Data'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // getvalue();
                        // getmodel();
                      });

                      // myViewModel.fetchUsers();
                      // myViewModel.createUser(User(body: "hello", title: "developer", userId: 1));
                    },
                    child: Text('Fetch Data'),
                  ),
                  // Text("name:- ${viewModel.PostUser?.body ?? ""}")
                  // Text("name:- ${viewModel.users?.name ?? ""}")
                  Text("name:- ${loadedData ?? ""}")
                ],
              ),
            ),
            if (viewModel.isLoading) LoadingWidget() else if (viewModel.error.isNotEmpty) ErrorToast(error: "error:- ${viewModel.error.toString()}")
          ],
        );
      }),
    );
  }

  void save() async {
    await savestring().myString('Hello, iOS develoepr  with flutter');
  }

  void getvalue() async {
    loadedData = await savestring().loadData('myString');
  }

  // void getmodel() async {
  //   models = await SaveModel().loadModel(PersonModel.fromJson);
  //   print(models);
  // }
}
