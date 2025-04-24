import 'package:get_it/get_it.dart';
import 'package:hotel_app/core/network/dio_client.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<DioClient>(DioClient());
}
