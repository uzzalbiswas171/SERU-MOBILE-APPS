

import 'package:equatable/equatable.dart';

sealed class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object> get props => [];
}

final class FetchBanner extends BannerEvent {
  const FetchBanner();
}