import 'dart:convert';

import 'package:teemo_professor/libraries/common/models/info.model.dart';
import 'package:teemo_professor/libraries/common/models/metadata.model.dart';

class MatchModel {
  MatchModel({
    this.metadata,
    this.info,
  });

  final MetadataModel? metadata;
  final InfoModel? info;

  factory MatchModel.fromJson(String str) =>
      MatchModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchModel.fromMap(Map<String, dynamic> json) => MatchModel(
        metadata: json["metadata"] == null
            ? null
            : MetadataModel.fromMap(json["metadata"]),
        info: json["info"] == null ? null : InfoModel.fromMap(json["info"]),
      );

  Map<String, dynamic> toMap() => {
        "metadata": metadata == null ? null : metadata!.toMap(),
        "info": info == null ? null : info!.toMap(),
      };
}
