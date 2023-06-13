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
      child: MyApp(),
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
  var isloding = false;

  void getdata() async {
    isloding = UserViewModel().isLoading;
    try {
      final res = await UserViewModel().fetchUsers();
      
    } catch (error) {
      print(error);
    }
    isloding = UserViewModel().isLoading;
  }

  @override
  Widget build(BuildContext context) {
    final myViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    myViewModel.fetchUsers();
                  },
                  child: Text("hit api"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



 bool isLoading = false;
  String error = "";

  void fetchData() async {
    setState(() {
      isLoading = true;
      error = "";
    });

    try {
      final myViewModel = Provider.of<UserViewModel>(context, listen: false);
      await myViewModel.fetchUsers();

      // Perform any UI updates based on the response here

    } catch (error) {
      setState(() {
        this.error = error.toString();
      });
    }

    setState(() {
      isLoading = false;
    });
  }


 if (isLoading)
                CircularProgressIndicator(), // Show a loading indicator while API call is in progress
              if (error.isNotEmpty)
                Text('Error: $error'), // Show an error message if there is an error
              // Update the UI based on the response of the API call here