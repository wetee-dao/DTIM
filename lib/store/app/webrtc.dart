import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'webrtc.freezed.dart';

@freezed
class WebRTCState with _$WebRTCState {
  const factory WebRTCState({
    @Default(0) int lastSyncTime,
  }) = _WebRTCState;
}


class WebRTCCubit extends Cubit<WebRTCState> {
  WebRTCCubit({state = const WebRTCState()}) : super(state);

  update(){
    emit(state.copyWith(lastSyncTime: DateTime.now().millisecondsSinceEpoch));
  }
}
