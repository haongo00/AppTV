import 'package:app_tv/app/home/home.view.dart';
import 'package:app_tv/app/home/library/nhap-lieu/input.view.dart';
import 'package:app_tv/app/information/infor.view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  static Inject get to => Inject<HomeModule>.of();
  static String inputView = "/input";
  static String inforView = "/infor";

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (context, args) => HomeWidget()),
    ModularRouter(inputView, child: (context, args) => InputView()),
    ModularRouter(inforView, child: (context, args) => InforView()),
  ];
}