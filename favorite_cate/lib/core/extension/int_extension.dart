import '../../ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return FCSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return FCSizeFit.setRpx(this.toDouble());
  }
}