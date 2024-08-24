import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_downloader_flutter/src/models/download_manager.dart';

part 'downloads_manager_provider.g.dart';

@riverpod
class DownloadsManagerProviderWithStateNotifier extends _$DownloadsManagerProviderWithStateNotifier {
  @override
  DownloadManager build() {
    return DownloadManager();
  }

  void initDownloadManager(DownloadManager manager) {
    state = manager;
    debugPrint("setting download manager type: ${manager.runtimeType} | ${state.runtimeType}");
  }
}
