import 'package:app_tv/app/home/home.view.dart';
import 'package:app_tv/app/home/library/member/member.view.dart';
import 'package:app_tv/app/home/library/member/new-member/new-member.view.dart';
import 'package:app_tv/app/home/library/nhap-lieu/input.view.dart';
import 'package:app_tv/app/home/library/nhap-lieu/sach/new-book/new-book.view.dart';
import 'package:app_tv/app/information/infor.view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  static Inject get to => Inject<HomeModule>.of();
  static String inputView = "/input";
  static String inforView = "/infor";
  static String newBook = "/new-book";
  static String member = "/member";
  static String newMember = "/new-member";

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (context, args) => HomeWidget()),
    ModularRouter(inputView, child: (context, args) => InputView()),
    ModularRouter(newBook, child: (context, args) => NewBookView()),
    ModularRouter(inforView, child: (context, args) => InforView()),
    ModularRouter(member, child: (context, args) => MemberView()),
    ModularRouter(newMember, child: (context, args) => NewMemberView()),
  ];
}