// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleTrack _$SingleTrackFromJson(Map<String, dynamic> json) => SingleTrack(
      (json['id'] as num).toInt(),
      json['path'] as String,
      json['title'] as String,
      json['size'] as String,
      (json['totalSize'] as num).toInt(),
      $enumDecodeNullable(_$StreamTypeEnumMap, json['streamType']) ??
          StreamType.video,
    )
      ..downloadPerc = (json['downloadPerc'] as num).toInt()
      ..downloadStatus =
          $enumDecode(_$DownloadStatusEnumMap, json['downloadStatus'])
      ..downloadedBytes = (json['downloadedBytes'] as num).toInt()
      ..error = json['error'] as String;

Map<String, dynamic> _$SingleTrackToJson(SingleTrack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'size': instance.size,
      'totalSize': instance.totalSize,
      'streamType': _$StreamTypeEnumMap[instance.streamType]!,
      'path': instance.path,
      'downloadPerc': instance.downloadPerc,
      'downloadStatus': _$DownloadStatusEnumMap[instance.downloadStatus]!,
      'downloadedBytes': instance.downloadedBytes,
      'error': instance.error,
    };

const _$StreamTypeEnumMap = {
  StreamType.audio: 'audio',
  StreamType.video: 'video',
};

const _$DownloadStatusEnumMap = {
  DownloadStatus.downloading: 'downloading',
  DownloadStatus.success: 'success',
  DownloadStatus.failed: 'failed',
  DownloadStatus.muxing: 'muxing',
  DownloadStatus.canceled: 'canceled',
};

MuxedTrack _$MuxedTrackFromJson(Map<String, dynamic> json) => MuxedTrack(
      (json['id'] as num).toInt(),
      json['path'] as String,
      json['title'] as String,
      json['size'] as String,
      (json['totalSize'] as num).toInt(),
      SingleTrack.fromJson(json['audio'] as Map<String, dynamic>),
      SingleTrack.fromJson(json['video'] as Map<String, dynamic>),
      streamType:
          $enumDecodeNullable(_$StreamTypeEnumMap, json['streamType']) ??
              StreamType.video,
    )
      ..downloadPerc = (json['downloadPerc'] as num).toInt()
      ..downloadStatus =
          $enumDecode(_$DownloadStatusEnumMap, json['downloadStatus'])
      ..downloadedBytes = (json['downloadedBytes'] as num).toInt()
      ..error = json['error'] as String;

Map<String, dynamic> _$MuxedTrackToJson(MuxedTrack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'size': instance.size,
      'totalSize': instance.totalSize,
      'path': instance.path,
      'downloadPerc': instance.downloadPerc,
      'downloadStatus': _$DownloadStatusEnumMap[instance.downloadStatus]!,
      'downloadedBytes': instance.downloadedBytes,
      'error': instance.error,
      'audio': instance.audio,
      'video': instance.video,
      'streamType': _$StreamTypeEnumMap[instance.streamType]!,
    };
