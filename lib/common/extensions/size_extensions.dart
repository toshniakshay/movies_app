
import 'package:movies_app/common/screen_util/screen_util.dart';

extension SizeExtension on num {

  num get w => ScreenUtil().setWidth(this);

  num get h => ScreenUtil().setHeight(this);

  num get sp => ScreenUtil().setSp(this);
}