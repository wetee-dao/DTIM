import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matrix/matrix.dart';

part 'webrtc.freezed.dart';

@freezed
class WebRTCState with _$WebRTCState {
  const factory WebRTCState({
    @Default(null) CallSession? call,
    @Default(0) int lastSyncTime,
  }) = _WebRTCState;
}


class WebRTCCubit extends Cubit<WebRTCState> {
  WebRTCCubit({state = const WebRTCState()}) : super(state);

  // 设置当前账户
  sync(CallSession? t) {
    emit(state.copyWith(call: t));
  }

  update(){
    emit(state.copyWith(lastSyncTime: DateTime.now().millisecondsSinceEpoch));
  }
}
