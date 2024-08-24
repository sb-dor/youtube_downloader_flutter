import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_downloader_flutter/src/models/settings.dart';

part 'settings_provider.g.dart';

@riverpod
class SettingProviderWithStateNotifier extends _$SettingProviderWithStateNotifier {
  @override
  Settings build() {
    return const Settings();
  }

  void initSettings(Settings appSettings) {
    state = appSettings;
  }

  void themeOnChanged(Settings settings, bool value) {
    if (value) {
      state = settings.copyWith(theme: ThemeSetting.dark);
      return;
    }
    state = settings.copyWith(theme: ThemeSetting.light);
  }

  void selectLanguage(Settings settings, Locale? value) {
    state = settings.copyWith(locale: value);
  }
}
