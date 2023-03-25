import 'package:hive/hive.dart';
import '../../data/data_vos/cities_vo.dart';
import '../hive_constants.dart';

class CityDao{
  static final CityDao _singleton = CityDao._internal();

  factory CityDao(){
    return _singleton;
  }

  CityDao._internal();

  void saveAllCities(List<CitiesVO> citiesList) async {
    Map<int, CitiesVO> citiesMap = Map.fromIterable(citiesList, key: (city) => city.id, value: (city) => city);
    await getCitiesBox().putAll(citiesMap);
  }

  List<CitiesVO> getAllCities() {
    return getCitiesBox().values.toList();
  }

  Box<CitiesVO> getCitiesBox(){
    return Hive.box<CitiesVO>(BOX_NAME_CITIES_VO);
  }
}