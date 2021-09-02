import 'package:toggl_starter/page/configuration/configuration_page.dart';
import 'package:toggl_starter/page/splash/splash_page.dart';
import 'package:toggl_starter/page/task_list/task_list_page.dart';

final routes = {
  '/': (context) => SplashPage(),
  '/task_list': (context) => TaskListPage(),
  '/configuration': (context) => ConfigurationPage(),
};
