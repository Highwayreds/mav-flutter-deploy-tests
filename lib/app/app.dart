import 'package:map_visualisation/services/data_service.dart';
import 'package:map_visualisation/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: DataService),
  ],
)
class AppSetup {}
