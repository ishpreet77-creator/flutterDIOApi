import 'package:provider/provider.dart';
import '../Screens/HOME/Viewmodel/ViewModel.dart';
import '../Screens/LOGIN/ViewModel/LoginVM.dart';

var providerarray = [

  ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
  ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),

];
