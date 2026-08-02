import 'package:flutter/widgets.dart';

/// 디자인 프레임 기준 너비 (좌표,크기 비례 스케일 기준값)
const double kDesignFrameWidth = 375;

/// 디자인 프레임 대비 화면 폭 스케일
extension DesignScale on BuildContext {
  /// 화면 폭 / 디자인 프레임 너비
  double get designScale => MediaQuery.sizeOf(this).width / kDesignFrameWidth;
}
