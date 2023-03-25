import 'package:hive/hive.dart';
import 'package:the_movie_booking/data/data_vos/user_info_vo.dart';

import '../../persistence/hive_constants.dart';

part 'user_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_USER_VO, adapterName: "UserVOAdapter")
class UserVO{

  @HiveField(0)
  UserInfoVO? data;

  @HiveField(1)
  String? token;

  UserVO(this.data,this.token);
}