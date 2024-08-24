import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_downloader_flutter/src/providers/downloads_manager_provider/downloads_manager_provider.dart';
import 'package:youtube_downloader_flutter/src/providers/downloads_page_provider/downloads_page_provider.dart';
import 'package:youtube_downloader_flutter/src/widgets/downloads_view/download_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DownloadsPage extends HookConsumerWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadManager = ref.watch(downloadsPageProviderWithStateNotifierProvider);
    debugPrint("downlods screen videos length: ${downloadManager.length}");

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: DownloadsAppBar()),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 0,
        ),
        itemCount: downloadManager.length,
        itemBuilder: (BuildContext context, int index) {
          final video = downloadManager[index];
          return DownloadTile(video);
        },
      ),
    );
  }
}

class DownloadsAppBar extends HookWidget {
  const DownloadsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          height: kToolbarHeight,
          child: Row(children: [
            IconButton(
                icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
            Center(
              child: Text(
                AppLocalizations.of(context)!.downloads,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
