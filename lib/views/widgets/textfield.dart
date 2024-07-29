import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable [TextFormField] for [VModelAdmin].
class TTextField extends StatelessWidget {
  final Key? key;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final UndoHistoryController? undoController;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? ignorePointers;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final bool? cursorOpacityAnimates;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final GestureTapCallback? onTap;
  final bool onTapAlwaysCalled;
  final TapRegionCallback? onTapOutside;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  // final EditableTextContextMenuBuilder? contextMenuBuilder;
  final bool canRequestFocus;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final String? Function(String?)? validators;

  const TTextField(
      {this.key,
      this.controller,
      this.focusNode,
      this.undoController,
      this.decoration = const InputDecoration(),
      this.keyboardType,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      this.style,
      this.strutStyle,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.textDirection,
      this.readOnly = false,
      this.showCursor,
      this.autofocus = false,
      this.obscuringCharacter = '•',
      this.obscureText = false,
      this.autocorrect = true,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions = true,
      this.maxLines = 1,
      this.minLines,
      this.expands = false,
      this.maxLength,
      this.maxLengthEnforcement,
      this.onChanged,
      this.onEditingComplete,
      this.onAppPrivateCommand,
      this.inputFormatters,
      this.enabled,
      this.ignorePointers,
      this.cursorWidth = 2.0,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorOpacityAnimates,
      this.cursorColor,
      this.cursorErrorColor,
      this.selectionHeightStyle = ui.BoxHeightStyle.tight,
      this.selectionWidthStyle = ui.BoxWidthStyle.tight,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.dragStartBehavior = DragStartBehavior.start,
      this.enableInteractiveSelection,
      this.selectionControls,
      this.onTap,
      this.onTapAlwaysCalled = false,
      this.onTapOutside,
      this.mouseCursor,
      this.buildCounter,
      this.scrollController,
      this.scrollPhysics,
      this.autofillHints = const <String>[],
      this.contentInsertionConfiguration,
      this.clipBehavior = Clip.hardEdge,
      this.restorationId,
      this.scribbleEnabled = true,
      this.enableIMEPersonalizedLearning = true,
      // this.contextMenuBuilder = _defaultContextMenuBuilder,
      this.canRequestFocus = true,
      this.spellCheckConfiguration,
      this.magnifierConfiguration,
      this.validators});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      validator: validators,
      focusNode: focusNode,
      undoController: undoController,
      decoration: decoration,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      showCursor: showCursor,
      autofocus: autofocus,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onAppPrivateCommand: onAppPrivateCommand,
      inputFormatters: inputFormatters,
      enabled: enabled,
      ignorePointers: ignorePointers,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorOpacityAnimates: cursorOpacityAnimates,
      cursorColor: cursorColor,
      cursorErrorColor: cursorErrorColor,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      dragStartBehavior: dragStartBehavior,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
      onTap: onTap,
      onTapAlwaysCalled: onTapAlwaysCalled,
      onTapOutside: onTapOutside,
      mouseCursor: mouseCursor,
      buildCounter: buildCounter,
      scrollController: scrollController,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
      contentInsertionConfiguration: contentInsertionConfiguration,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      scribbleEnabled: scribbleEnabled,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      // contextMenuBuilder: contextMenuBuilder,
      canRequestFocus: canRequestFocus,
      spellCheckConfiguration: spellCheckConfiguration,
      magnifierConfiguration: magnifierConfiguration,
    );
  }
}
