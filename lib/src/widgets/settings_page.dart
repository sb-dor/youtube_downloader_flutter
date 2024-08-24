import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_downloader_flutter/src/providers/settings_provider/settings_provider.dart';

import '../models/settings.dart';

class SettingsPage extends HookConsumerWidget {
  SettingsPage({super.key});

  static const ffmpegContainers = <DropdownMenuItem<String>>[
    DropdownMenuItem(value: '.mp4', child: Text('.mp4')),
    DropdownMenuItem(value: '.webm', child: Text('.webm')),
    DropdownMenuItem(value: '.mkv', child: Text('.mkv'))
  ];

  final locales = AppLocalizations.supportedLocales
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e.languageCode),
            onTap: () {},
          ))
      .toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = AppLocalizations.of(context)!;
    var settings = ref.watch(settingProviderWithStateNotifierProvider);

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: SettingsAppBar()),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          ListTile(
            title: Text(intl.darkMode),
            leading:
                Icon(settings.theme == ThemeSetting.dark ? Icons.brightness_2 : Icons.wb_sunny),
            trailing: Switch(
              value: settings.theme == ThemeSetting.dark,
              onChanged: (bool value) => ref
                  .read(settingProviderWithStateNotifierProvider.notifier)
                  .themeOnChanged(settings, value),
            ),
            // onTap: () => ref
            //     .read(settingProviderWithStateNotifierProvider.notifier)
            //     .themeOnChanged(settings, settings.theme != ThemeSetting.dark),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: Text(intl.downloadDir),
            subtitle: Text(settings.downloadPath),
            onTap: () async {
              final result =
                  await FilePicker.platform.getDirectoryPath(dialogTitle: 'Choose Download Folder');
              if (result?.isEmpty ?? true) {
                return;
              }
              settings = settings.copyWith(downloadPath: result);
            },
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: Text(intl.ffmpegContainer),
            subtitle: Text(intl.ffmpegDescription),
            trailing: DropdownButton(
              value: settings.ffmpegContainer,
              onChanged: (String? value) => ref
                  .read(settingProviderWithStateNotifierProvider.notifier)
                  .initSettings(settings.copyWith(ffmpegContainer: value)),
              items: ffmpegContainers,
            ),
            // onTap: () => ref
            //     .read(settingProviderWithStateNotifierProvider.notifier)
            //     .themeOnChanged(settings, settings.theme != ThemeSetting.dark),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: Text(intl.language),
            trailing: DropdownButton(
              value: settings.locale,
              onChanged: (Locale? value) =>
                  ref.read(settingProviderWithStateNotifierProvider.notifier).selectLanguage(
                        settings,
                        value,
                      ),
              items: locales,
            ),
            // onTap: () => ref
            //     .read(settingProviderWithStateNotifierProvider.notifier)
            //     .themeOnChanged(settings, settings.theme != ThemeSetting.dark),
          ),
        ],
      ),
    );
  }

// ignore: avoid_positional_boolean_parameters
}

class SettingsAppBar extends HookWidget {
  const SettingsAppBar({super.key});

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
                AppLocalizations.of(context)!.settings,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
