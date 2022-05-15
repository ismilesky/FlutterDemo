
import '../../ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return FCSizeFit.setPx(this);
  }

  double get rpx {
    return FCSizeFit.setRpx(this);
  }
}
