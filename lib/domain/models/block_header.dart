import 'package:json_annotation/json_annotation.dart';
part 'block_header.g.dart';

@JsonSerializable()
class BlockHeader {
  int? blockNumber;
  final String parentHash;
  final String number;
  BlockHeader(
    this.parentHash,
    this.number,
  );

  factory BlockHeader.fromJson(Map<String, dynamic> json) => _$BlockHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$BlockHeaderToJson(this);
}
