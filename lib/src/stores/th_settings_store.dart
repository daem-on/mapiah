import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mapiah/src/auxiliary/th_directory_helper.dart';
import 'package:mapiah/src/definitions/th_definitions.dart';
import 'package:mobx/mobx.dart';
import 'package:toml/toml.dart';

part 'th_settings_store.g.dart';

class THSettingsStore = THSettingsStoreBase with _$THSettingsStore;

abstract class THSettingsStoreBase with Store {
  bool _readingConfigFile = false;

  @readonly
  String _localeID = thDefaultLocaleID;

  @readonly
  Locale _locale = Locale(thEnglishLocaleID);

  @readonly
  double _selectionTolerance = thDefaultSelectionTolerance;

  @readonly
  double _selectionToleranceSquared =
      thDefaultSelectionTolerance * thDefaultSelectionTolerance;

  @readonly
  double _pointRadius = thDefaultPointRadius;

  THSettingsStoreBase() {
    _initialize();
  }

  void _initialize() {
    _readConfigFile();
  }

  Future<void> _readConfigFile() async {
    try {
      _readingConfigFile = true;

      final Directory configDirectory = await ThDirectoryHelper.config();
      final File file = File(configDirectory.path + thMainConfigFilename);
      final String contents = await file.readAsString();
      final Map<String, dynamic> config = TomlDocument.parse(contents).toMap();

      final Map<String, dynamic> mainConfig =
          config.containsKey(thMainConfigSection)
              ? config[thMainConfigSection] as Map<String, dynamic>
              : {};
      final Map<String, dynamic> fileEditConfig =
          config.containsKey(thFileEditConfigSection)
              ? config[thFileEditConfigSection] as Map<String, dynamic>
              : {};

      String localeID = thDefaultLocaleID;
      double selectionTolerance = thDefaultSelectionTolerance;
      double pointRadius = thDefaultPointRadius;

      if (mainConfig.isNotEmpty) {
        if (mainConfig.containsKey(thMainConfigLocale)) {
          localeID = mainConfig[thMainConfigLocale];
        }
      }

      if (fileEditConfig.isNotEmpty) {
        if (fileEditConfig.containsKey(thFileEditConfigSelectionTolerance)) {
          selectionTolerance =
              fileEditConfig[thFileEditConfigSelectionTolerance];
        }
        if (fileEditConfig.containsKey(thFileEditConfigPointRadius)) {
          pointRadius = fileEditConfig[thFileEditConfigPointRadius];
        }
      }

      setLocaleID(localeID);
      setSelectionTolerance(selectionTolerance);
      setPointRadius(pointRadius);

      _readingConfigFile = false;
    } catch (e) {
      print('Error reading config file: $e');
    }
  }

  String _getSystemLocaleID() {
    final Locale systemLocale =
        WidgetsBinding.instance.platformDispatcher.locale;
    return systemLocale.languageCode;
  }

  @action
  void setLocaleID(String localeID) {
    final bool saveConfigFile = _localeID != localeID;

    _localeID = localeID;
    if (localeID == thDefaultLocaleID) {
      localeID = _getSystemLocaleID();
    }
    _locale = Locale(localeID);

    if (saveConfigFile) {
      _saveConfigFile();
    }
  }

  void setSelectionTolerance(double selectionTolerance) {
    final bool saveConfigFile = _selectionTolerance != selectionTolerance;

    _selectionTolerance = selectionTolerance;
    _selectionToleranceSquared = selectionTolerance * selectionTolerance;

    if (saveConfigFile) {
      _saveConfigFile();
    }
  }

  @action
  void setPointRadius(double pointRadius) {
    final bool saveConfigFile = _pointRadius != pointRadius;

    _pointRadius = pointRadius;

    if (saveConfigFile) {
      _saveConfigFile();
    }
  }

  void _saveConfigFile() async {
    if (_readingConfigFile) {
      return;
    }

    try {
      final Map<String, dynamic> config = {
        thMainConfigSection: {thMainConfigLocale: _localeID},
        thFileEditConfigSection: {
          thFileEditConfigSelectionTolerance: _selectionTolerance,
          thFileEditConfigPointRadius: _pointRadius,
        },
      };
      final String contents = TomlDocument.fromMap(config).toString();

      final Directory configDirectory = await ThDirectoryHelper.config();
      final File file = File(configDirectory.path + thMainConfigFilename);

      await file.writeAsString(contents);
    } catch (e) {
      print('Error saving config file: $e');
    }
  }
}
