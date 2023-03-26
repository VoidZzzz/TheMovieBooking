import 'package:hive/hive.dart';
import 'package:the_movie_booking/data/data_vos/color_vo.dart';
import '../hive_constants.dart';

class ColorDao{
  static final ColorDao _singleton = ColorDao._internal();

  factory ColorDao(){
    return _singleton;
  }

  ColorDao._internal();

  void saveAllColors(List<ColorVO> colorList) async {
    Map<int, ColorVO> colorMap = Map.fromIterable(colorList, key: (color) => color.id, value: (color) => color);
    await getColorBox().putAll(colorMap);
    print('-----------------------> successfully saved');
  }

  List<ColorVO> getAllColors() {
    return getColorBox().values.toList();
  }

  Box<ColorVO> getColorBox(){
    return Hive.box<ColorVO>(BOX_NAME_COLOR_VO);
  }
}