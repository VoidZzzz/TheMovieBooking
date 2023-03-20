import 'package:hive/hive.dart';
import 'package:the_movie_booking/authentication/data/data_vos/user_vo.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';
import '../hive_constants.dart';

class UserDataDao{
  static final UserDataDao _singleton = UserDataDao._internal();

  factory UserDataDao(){
    return _singleton;
  }

  UserDataDao._internal();

  void saveUserData(SignInWithPhoneResponse response) async {
    UserVO userVO = UserVO(response.data, response.token);
    await getUserDataBox().put('user', userVO);
  }

  UserVO? getUserData() {
    return getUserDataBox().get('user');
  }

  void clearUserData(){
    getUserDataBox().delete('user');
  }


  Box<UserVO> getUserDataBox(){
    return Hive.box<UserVO>(BOX_NAME_USER_VO);
  }
}