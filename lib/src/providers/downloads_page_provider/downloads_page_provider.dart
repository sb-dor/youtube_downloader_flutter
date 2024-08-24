import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_downloader_flutter/src/models/download_manager.dart';

part 'downloads_page_provider.g.dart';

@Riverpod(keepAlive: true)
class DownloadsPageProviderWithStateNotifier extends _$DownloadsPageProviderWithStateNotifier {
  @override
  List<SingleTrack> build() {
    return <SingleTrack>[];
  }

  void addVideo(SingleTrack track) {
    // Create a new list and add the track
    state = [...state, track];
    debugPrint("adding new video for downloads page: ${state.length}");
    Future.delayed(const Duration(seconds: 10), () {
      debugPrint("adding new video for downloads page: ${state.length} | ${state}");
    });
  }

  void removeVideo(SingleTrack track) {
    // Create a new list without the removed track
    state = state.where((e) => e.id != track.id).toList();
  }
}
