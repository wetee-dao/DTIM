import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org.freezed.dart';

@freezed
class OrgState with _$OrgState {
  const factory OrgState({
    @Default("") String channelId,
    @Default(0) int lastSyncTime,
  }) = _OrgState;
}

class OrgCubit extends Cubit<OrgState> {
  OrgCubit({state = const OrgState()}) : super(state);

  // 设置当前账户
  setChannelId(String id) {
    emit(state.copyWith(channelId: id));
  }

  update() {
    emit(state.copyWith(lastSyncTime: DateTime.now().millisecondsSinceEpoch));
  }
}
