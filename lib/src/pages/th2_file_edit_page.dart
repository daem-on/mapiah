import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:mapiah/main.dart';
import 'package:mapiah/src/auxiliary/mp_error_dialog.dart';
import 'package:mapiah/src/definitions/mp_definitions.dart';
import 'package:mapiah/src/generated/i18n/app_localizations.dart';
import 'package:mapiah/src/stores/th2_file_edit_store.dart';
import 'package:mapiah/src/stores/mp_general_store.dart';
import 'package:mapiah/src/widgets/th_file_widget.dart';

class TH2FileEditPage extends StatefulWidget {
  final String filename;

  TH2FileEditPage({required this.filename});

  @override
  State<TH2FileEditPage> createState() => _TH2FileEditPageState();
}

class _TH2FileEditPageState extends State<TH2FileEditPage> {
  late final TH2FileEditStore th2FileEditStore;
  late final Future<TH2FileEditStoreCreateResult> th2FileEditStoreCreateResult;
  bool _th2FileEditStoreLoaded = false;

  @override
  void initState() {
    super.initState();
    th2FileEditStore =
        getIt<MPGeneralStore>().getTH2FileEditStore(filename: widget.filename);
    th2FileEditStoreCreateResult = th2FileEditStore.load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TH2FileEditStoreCreateResult>(
      future: th2FileEditStoreCreateResult,
      builder: (
        BuildContext context,
        AsyncSnapshot<TH2FileEditStoreCreateResult> snapshot,
      ) {
        final bool fileReady =
            (snapshot.connectionState == ConnectionState.done) &&
                snapshot.hasData &&
                snapshot.data!.isSuccessful;

        if (fileReady && !_th2FileEditStoreLoaded) {
          _th2FileEditStoreLoaded = true;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).fileEditWindowWindowTitle),
            elevation: 4,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _onLeavePage,
            ),
            actions: <Widget>[
              if (fileReady) ...[
                IconButton(
                  icon: Icon(Icons.save_outlined),
                  onPressed: () => th2FileEditStore.saveTH2File(),
                ),
                IconButton(
                  icon: Icon(Icons.save_as_outlined),
                  onPressed: () => th2FileEditStore.saveAsTH2File(),
                ),
              ],
              IconButton(
                icon: Icon(Icons.close),
                onPressed: _onLeavePage,
              ),
            ],
          ),
          body: FutureBuilder<TH2FileEditStoreCreateResult>(
            future: th2FileEditStoreCreateResult,
            builder: (
              BuildContext context,
              AsyncSnapshot<TH2FileEditStoreCreateResult> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(AppLocalizations.of(context)
                      .th2FileEditPageLoadingFile(widget.filename)),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final List<String> errorMessages = snapshot.data!.errors;

                if (snapshot.data!.isSuccessful) {
                  return Center(
                    child: Stack(
                      children: [
                        THFileWidget(
                          key: ValueKey(
                            "THFileWidget|${th2FileEditStore.thFileMapiahID}",
                          ),
                          th2FileEditStore: th2FileEditStore,
                        ),
                        _undoRedoButtons(),
                        _actionButtons(),
                      ],
                    ),
                  );
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MPErrorDialog(errorMessages: errorMessages);
                      },
                    );
                  });
                  return Container();
                }
              } else {
                throw Exception(
                    'Unexpected snapshot state: ${snapshot.connectionState}');
              }
            },
          ),
        );
      },
    );
  }

  void _onLeavePage() {
    th2FileEditStore.close();
    Navigator.pop(context);
  }

  Widget _undoRedoButtons() {
    return Observer(
      builder: (_) {
        if (!th2FileEditStore.isSelectMode) {
          return const SizedBox();
        }

        return Positioned(
          top: 16,
          right: 16,
          child: Row(
            children: [
              Observer(
                builder: (_) {
                  final bool hasUndo = th2FileEditStore.hasUndo;

                  return FloatingActionButton(
                    heroTag: 'undo',
                    mini: true,
                    tooltip: hasUndo
                        ? th2FileEditStore.undoDescription
                        : AppLocalizations.of(context)
                            .th2FileEditPageNoUndoAvailable,
                    backgroundColor: hasUndo
                        ? null
                        : Theme.of(context).colorScheme.surfaceContainerLowest,
                    foregroundColor: hasUndo
                        ? null
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    onPressed: hasUndo ? th2FileEditStore.undo : null,
                    elevation: hasUndo ? 6.0 : 3.0,
                    child: const Icon(Icons.undo),
                  );
                },
              ),
              const SizedBox(width: 8),
              Observer(
                builder: (_) {
                  final bool hasRedo = th2FileEditStore.hasRedo;

                  return FloatingActionButton(
                    heroTag: 'redo',
                    mini: true,
                    tooltip: hasRedo
                        ? th2FileEditStore.redoDescription
                        : AppLocalizations.of(context)
                            .th2FileEditPageNoRedoAvailable,
                    backgroundColor: hasRedo
                        ? null
                        : Theme.of(context).colorScheme.surfaceContainerLowest,
                    foregroundColor: hasRedo
                        ? null
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    onPressed: hasRedo ? th2FileEditStore.redo : null,
                    elevation: hasRedo ? 6.0 : 3.0,
                    child: const Icon(Icons.redo),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _actionButtons() {
    return Observer(
      builder: (context) {
        final bool isPanMode = th2FileEditStore.isPanMode;
        final bool isSelectMode = th2FileEditStore.isSelectMode;
        final ColorScheme colorScheme = Theme.of(context).colorScheme;

        return Positioned(
          bottom: 16,
          right: 16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'pan_tool',
                onPressed: _onPanToolPressed,
                tooltip: AppLocalizations.of(context).th2FileEditPagePanTool,
                child: Image.asset(
                  'assets/icons/pan-tool.png',
                  width: thFloatingActionIconSize,
                  height: thFloatingActionIconSize,
                  color: isPanMode ? colorScheme.onPrimary : null,
                ),
                backgroundColor: isPanMode ? colorScheme.primary : null,
                elevation: isPanMode ? 0 : null,
              ),
              SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'select_tool',
                onPressed: _onSelectToolPressed,
                tooltip: AppLocalizations.of(context).th2FileEditPageSelectTool,
                child: Image.asset(
                  'assets/icons/select-tool.png',
                  width: thFloatingActionIconSize,
                  height: thFloatingActionIconSize,
                  color: isSelectMode ? colorScheme.onPrimary : null,
                ),
                backgroundColor: isSelectMode ? colorScheme.primary : null,
                elevation: isSelectMode ? 0 : null,
              ),
              SizedBox(height: 8),
              _zoomButtonWithOptions(),
            ],
          ),
        );
      },
    );
  }

  void _onPanToolPressed() {
    th2FileEditStore.onPanToolPressed();
  }

  void _onSelectToolPressed() {
    th2FileEditStore.onSelectToolPressed();
  }

  Widget _zoomButtonWithOptions() {
    return MouseRegion(
      onEnter: (_) => th2FileEditStore.setZoomButtonsHovered(true),
      onExit: (_) => th2FileEditStore.setZoomButtonsHovered(false),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Observer(
            builder: (_) {
              if (!th2FileEditStore.isZoomButtonsHovered) {
                return const SizedBox();
              }

              return Row(
                children: [
                  FloatingActionButton(
                    heroTag: 'zoom_in',
                    onPressed: () => th2FileEditStore.zoomIn(),
                    tooltip: AppLocalizations.of(context).th2FileEditPageZoomIn,
                    child: Icon(Icons.zoom_in, size: thFloatingActionIconSize),
                  ),
                  SizedBox(width: 8),
                  FloatingActionButton(
                    heroTag: 'zoom_show_all',
                    onPressed: () => th2FileEditStore.zoomAll(),
                    tooltip:
                        AppLocalizations.of(context).th2FileEditPageZoomShowAll,
                    child: Icon(Icons.zoom_out_map,
                        size: thFloatingActionIconSize),
                  ),
                  SizedBox(width: 8),
                  FloatingActionButton(
                    heroTag: 'zoom_out',
                    onPressed: () => th2FileEditStore.zoomOut(),
                    tooltip:
                        AppLocalizations.of(context).th2FileEditPageZoomOut,
                    child: Icon(Icons.zoom_out, size: thFloatingActionIconSize),
                  ),
                  SizedBox(width: 8),
                ],
              );
            },
          ),
          FloatingActionButton(
            heroTag: 'zoom_options',
            onPressed: () {},
            tooltip: AppLocalizations.of(context).th2FileEditPageZoomOptions,
            child: SvgPicture.asset(
              'assets/icons/zoom_plus_minus.svg',
              width: thFloatingActionIconSize,
              height: thFloatingActionIconSize,
            ),
          ),
        ],
      ),
    );
  }
}
