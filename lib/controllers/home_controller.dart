import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/service/time_service.dart';

class HomeController {
  late TimesService timesService;
  List<Time> get tabela => timesService.times;

  HomeController() {
    timesService = TimesService();
  }
}
