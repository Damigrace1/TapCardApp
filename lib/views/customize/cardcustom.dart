import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/widgets/business_card.dart';
import 'package:tapcard/views/widgets/spacing.dart';
import 'package:tapcard/views/widgets/textfield.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: kwhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/back.png',
              height: 15,
              width: 15,
            ),
            addHorizontalSpacing(10),
            const Expanded(
              child: Text(
                'Customize Card',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const Text(
                    'Save',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: kpurple,
                        fontWeight: FontWeight.w500),
                  ),
                  addHorizontalSpacing(2),
                  Image.asset(
                    'assets/images/arrow.png',
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: const Border(bottom: BorderSide(color: kblack, width: 0.1)),
        surfaceTintColor: Colors.transparent,
        elevation: 20,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            addVerticalSpacing(8),
            BusinessCard(
              name: 'Jonas Broms',
              jobTitle: 'UX/UI Designer',
              website: 'www.jonasbroms.com',
              email: 'jonas.broms@jonasbroms.com',
              phoneNumber: '+234 805 456 321',
              color: Color(0xff002214),
            ),
            addVerticalSpacing(30),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: kpurple),
              child: const Center(
                child: Text(
                  'Change color',
                  style: TextStyle(
                      color: kwhite,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // Future<bool> colorPickerDialog(BuildContext context) async {
  //   return ColorPicker(
  //     /// The active color selection when the color picker is created.
  //     color: _selectedColor,

  //     /// Required [ValueChanged] callback, called when user selects
  //     /// a new color with new color value.
  //     ///
  //     /// Called every time the color value changes when operating thumbs on the
  //     /// color wheel or color or transparency sliders
  //     ///
  //     /// Changing which picker type is viewed does not trigger this callback, it
  //     /// is not triggered until a color in the viewed picker is selected.
  //     onColorChanged: (Color color) => setState(() => _selectedColor = color),

  //     /// Optional [ValueChanged] callback. Called when user starts color selection
  //     /// with current color value.
  //     ///
  //     /// When clicking a new color in color items, the color value before the
  //     /// selected new value was clicked is returned. It is also called
  //     /// with the current start color when user starts the interaction on the
  //     /// color wheel or on a color or transparency slider.
  //     onColorChangeStart: (Color color) => debugPrint('onColorChangeStart'),

  //     /// Optional [ValueChanged] callback. Called when user ends color selection
  //     /// with the new color value.
  //     ///
  //     /// When clicking a new color on color items, the clicked color is returned.
  //     /// It is also called with the resulting color value when user ends the
  //     /// interaction on the color wheel or on a color or transparency slider.
  //     onColorChangeEnd: (Color color) => debugPrint('onColorChangeEnd'),

  //     /// A [ColorPickerType] to bool map. Defines which pickers are enabled in the
  //     /// color picker's sliding selector and thus available as color pickers.
  //     ///
  //     /// Available options are based on the [ColorPickerType] enum that
  //     /// includes values `both`, `primary`, `accent`, `bw`, `custom` and `wheel`.
  //     ///
  //     /// By default, a map that sets primary and accent pickers to true, and
  //     /// other pickers to false, is used.
  //     ///
  //     /// To modify key-value enable/disable pairs, you only have to provide values
  //     /// for the pairs you want to change from their default value. Any missing
  //     /// key-value pair in the provided map will keep their default value.
  //     pickersEnabled: <ColorPickerType, bool>{
  //       ColorPickerType.both: false,
  //       ColorPickerType.primary: true,
  //       ColorPickerType.accent: true,
  //       ColorPickerType.bw: false,
  //       ColorPickerType.custom: true,
  //       ColorPickerType.wheel: true,
  //     },

  //     /// Set to true to allow selection of color swatch shades.
  //     ///
  //     /// If false, only the main color from a swatch is shown and can be selected.
  //     /// This is index [500] for Material primary colors and index [200] for accent
  //     /// colors. On the Wheel, only the selected color is shown there is no
  //     /// color related color swatch of the selected color shown.
  //     ///
  //     /// Defaults to true.
  //     enableShadesSelection: false,

  //     /// There is an extra index [850] used only by grey Material color in Flutter.
  //     /// If you want to include it in the grey color shades selection, then set
  //     /// this property to true.
  //     ///
  //     /// Defaults to false.
  //     includeIndex850: true,

  //     /// Set to true to allow selection of color tone from a tonal palette.
  //     ///
  //     /// When set to true, the ColorPicker will use Material 3 color utilities
  //     /// to compute a tonal palette for the selected color, allowing you to
  //     /// select a color tone from the Tonal Palette for the selected color.
  //     ///
  //     /// For more info on Material 3 Color system, see:
  //     /// https://m3.material.io/styles/color/the-color-system/key-colors-tones
  //     ///
  //     /// The picker item size for tonal palette color indicator items is
  //     /// 10/13 the size of defined width and height. This is done in order to
  //     /// as far as possible try to match the width of the Primary Material Swatch
  //     /// items total width, it has 10 colors, the M3 tonal palette has 13 colors.
  //     /// The idea is try to match their width when they are both shown.
  //     ///
  //     /// Defaults to false.
  //     enableTonalPalette: false,

  //     /// Cross axis alignment used to layout the main content of the
  //     /// color picker in its column layout.
  //     ///
  //     /// Defaults to CrossAxisAlignment.center.
  //     /// crossAxisAlignment: CrossAxisAlignment.center,

  //     /// Padding around the entire color picker content.
  //     ///
  //     /// Defaults to const EdgeInsets.all(16).
  //     /// padding: EdgeInsets.all(16),

  //     /// Vertical spacing between items in the color picker column.
  //     ///
  //     /// Defaults to 8 dp. Must be from 0 to 300 dp.
  //     /// columnSpacing: 8.0,

  //     /// Enable the opacity control for the color value.
  //     ///
  //     /// Set to true to allow users to control the opacity value of the
  //     /// selected color. The displayed Opacity value on the slider goes from 0%,
  //     /// which is totally transparent, to 100%, which if fully opaque.
  //     ///
  //     /// When enabled, the opacity value is not returned as a separate value,
  //     /// it is returned in the alpha channel of the returned ARGB color value, in
  //     /// the onColor callbacks.
  //     ///
  //     /// Defaults to false.
  //     enableOpacity: false,

  //     /// The height of the opacity slider track.
  //     ///
  //     /// Defaults to 36 dp. Must be between 8 - 50.
  //     /// opacityTrackHeight: 36,

  //     /// The width of the opacity slider track.
  //     ///
  //     /// If null, the slider fills to expand available width of the picker.
  //     /// If not null, it must be >= 150 dp.
  //     /// opacityTrackWidth: null,

  //     /// The radius of the thumb on the opacity slider.
  //     ///
  //     /// Defaults to 16 dp. Must be between 12 - 30.
  //     /// opacityThumbRadius: 16,

  //     /// Used to configure action buttons for the color picker dialog.
  //     ///
  //     /// Defaults to [ColorPickerActionButtons] ().
  //     actionButtons: const ColorPickerActionButtons(
  //       dialogCancelButtonLabel: 'Cancel',
  //       dialogCancelButtonType: ColorPickerActionButtonType.outlined,
  //       dialogOkButtonLabel: 'OK',
  //       dialogOkButtonType: ColorPickerActionButtonType.elevated,
  //     ),

  //     /// Used to configure the copy paste behavior of the color picker.
  //     ///
  //     /// Defaults to [ColorPickerCopyPasteBehavior] ().
  //     copyPasteBehavior: const ColorPickerCopyPasteBehavior(
  //       longPressMenu: true,
  //       copyIcon: Icons.check,
  //     ),

  //     /// Icon data for the icon used to indicate the selected color.
  //     ///
  //     /// The size of the [selectedColorIcon] is 60% of the smaller of color
  //     /// indicator [width] and [height]. The color of indicator icon is
  //     /// black or white, based on what contrast best with the selected color.
  //     ///
  //     /// Defaults to a check mark [Icons.check].
  //     selectedColorIcon: Icons.check,

  //     /// Width of the color indicator items.
  //     ///
  //     /// Defaults to 40 dp. Must be from 15 to 150 dp.
  //     /// width: 40,

  //     /// Height of the color indicator items.
  //     ///
  //     /// Defaults to 40 dp. Must be from 15 to 150 dp.
  //     /// height: 40,

  //     /// The horizontal spacing between the color picker indicator items.
  //     ///
  //     /// Defaults to 4 dp. Must be from 0 to 50 dp.
  //     /// spacing: 4,

  //     /// The space between the color picker color item rows, when they need to
  //     /// be wrapped to multiple rows.
  //     ///
  //     /// Defaults to 4 dp. Must be from 0 to 50 dp.
  //     /// runSpacing: 4,

  //     /// The Material elevation of the color indicator items.
  //     ///
  //     /// Defaults to 0 dp. Must be >= 0.
  //     elevation: 4,

  //     /// Set to true, to show a 1 dp border around the color indicator items.
  //     ///
  //     /// This property is useful if the white/near white and black/near black
  //     /// shades color picker is enabled.
  //     ///
  //     /// Defaults to false.
  //     hasBorder: true,

  //     /// Border radius of the color indicator items.
  //     ///
  //     /// If null, it defaults to [width]/4. Must be from 0 to 50 dp, if not null.
  //     borderRadius: null,

  //     /// The color of the 1 dp optional border used on [ColorIndicator] and on
  //     /// [ColorWheelPicker], when each have their border toggle set to true.
  //     ///
  //     /// If no color is given, the border color defaults to
  //     /// Theme.of(context).dividerColor.
  //     borderColor: null,

  //     /// Diameter of the HSV based color wheel picker.
  //     ///
  //     /// Defaults to 190 dp. Must be from 100 to maximum 500 dp.
  //     /// wheelDiameter: 190,

  //     /// The stroke width of the color wheel circle.
  //     ///
  //     /// Defaults to 16 dp. Must be from 4 to maximum 50 dp.
  //     /// wheelWidth: 16,

  //     /// Padding between shade square inside the hue wheel and inner
  //     /// side of the wheel.
  //     ///
  //     /// Keep it reasonable in relation to wheelDiameter and wheelWidth, values
  //     /// from 0 to 20 are recommended.
  //     ///
  //     /// Defaults to 0 dp.
  //     /// wheelSquarePadding: 20,

  //     /// Border radius of the shade square inside the hue wheel.
  //     ///
  //     /// Keep it reasonable, the thumb center always goes out to the square box
  //     /// corner, regardless of this border radius. It is only for visual design,
  //     /// the edge color shades are in the sharp corner, even if not shown.
  //     ///
  //     /// Recommended values 0 to 16.
  //     ///
  //     /// Defaults to 4 dp.
  //     // wheelSquareBorderRadius: 4,

  //     /// Set to true to show a 1 dp border around the color wheel.
  //     ///
  //     /// Defaults to false.
  //     wheelHasBorder: true,

  //     /// Title widget for the color picker.
  //     ///
  //     /// Typically a Text widget, e.g. `Text('ColorPicker')`. If not provided or
  //     /// null, there is no title on the toolbar of the color picker.
  //     ///
  //     /// This widget can be used instead of [heading] or with it, depends on design
  //     /// need.
  //     ///
  //     /// The title widget is like an app bar title in the sense that at
  //     /// the end of it, 1 to 4 actions buttons may also be present for copy, paste,
  //     /// select-close and cancel-close. The select-close and cancel-close actions
  //     /// should only be enabled when the picker is used in a dialog. The copy and
  //     /// paste actions can be enabled also when the picker is not in a dialog.
  //     title: null,

  //     /// Heading widget for the color picker.
  //     ///
  //     /// Typically a Text widget, e.g. `Text('Select color')`.
  //     /// If not provided or null, there is no heading for the color picker.
  //     heading: Text('Select color'),

  //     /// Subheading widget for the color shades selection.
  //     ///
  //     /// Typically a Text widget, e.g. `Text('Select color shade')`.
  //     /// If not provided or null, there is no subheading for the color shades.
  //     subheading: Text('Select color shade'),

  //     /// Subheading widget for the color tone selection.
  //     ///
  //     /// Typically a Text widget, e.g. `Text('Select Material 3 color tone')`.
  //     /// If not provided or null, there is no subheading for the color shades.
  //     tonalSubheading: Text('Select Material 3 color tone'),

  //     /// Subheading widget for the HSV color wheel picker.
  //     ///
  //     /// Typically a Text widget, e.g.
  //     /// `Text('Selected color and its material like shades')`.
  //     ///
  //     /// The color wheel uses a separate subheading widget so that it may have
  //     /// another explanation, since its use case differs from the other subheading
  //     /// cases. If not provided, there is no subheading for the color wheel picker.
  //     wheelSubheading: Text('Selected color and its material like shades',
  //         textAlign: TextAlign.center),

  //     /// Subheading widget for the recently used colors.
  //     ///
  //     /// Typically a Text widget, e.g. `Text('Recent colors')`.
  //     /// If not provided or null, there is no subheading for the recent color.
  //     /// The recently used colors subheading is not shown even if provided, when
  //     /// [showRecentColors] is false.
  //     recentColorsSubheading: Text('Recent colors'),

  //     /// Subheading widget for the opacity slider.
  //     ///
  //     /// Typically a Text widget, e.g. `Text('Opacity')`.
  //     /// If not provided or null, there is no subheading for the opacity slider.
  //     /// The opacity subheading is not shown even if provided, when
  //     /// [enableOpacity] is false.
  //     opacitySubheading: Text('Opacity'),

  //     /// Set to true to show the Material name and index of the selected [color].
  //     ///
  //     /// Defaults to false.
  //     showMaterialName: false,

  //     /// Text style for the displayed material color name in the picker.
  //     ///
  //     /// Defaults to `Theme.of(context).textTheme.bodyText2`, if not defined.
  //     /// materialNameTextStyle: null,

  //     /// Set to true to show an English color name of the selected [color].
  //     ///
  //     /// Uses the [ColorTools.nameThatColor] function to give an English name to
  //     /// any selected color. The function has a list of 1566 color codes and
  //     /// their names, it finds the color that closest matches the given color in
  //     /// the list and returns its color name.
  //     ///
  //     /// Defaults to false.
  //     showColorName: false,

  //     /// Text style for the displayed color name in the picker.
  //     ///
  //     /// Defaults to `Theme.of(context).textTheme.bodyText2`, if not defined.
  //     /// colorNameTextStyle: null,

  //     /// Set to true to show the RGB Hex color code of the selected [color].
  //     ///
  //     /// The color code can be copied with copy icon button or other enabled copy
  //     /// actions in the color picker. On the wheel picker the color code can be
  //     /// edited to enter and select a color of a known RGB hex value. If the
  //     /// property [colorCodeReadOnly] has been set to false the color code field
  //     /// can never be edited directly, it is then only used to display the code
  //     /// of currently selected color.
  //     ///
  //     /// Defaults to false.
  //     showColorCode: false,

  //     /// When true, the color code entry field uses the currently selected
  //     /// color as its background color.
  //     ///
  //     /// This makes the color code entry field a large current color indicator
  //     /// area, that changes color as the color value is changed.
  //     /// The text color of the field, will automatically adjust for best contrast,
  //     /// as will the opacity indicator text. Enabling this feature will override
  //     /// any color specified in [colorCodeTextStyle] and [colorCodePrefixStyle],
  //     /// but their styles will otherwise be kept as specified.
  //     ///
  //     /// Defaults to false.
  //     colorCodeHasColor: true,

  //     /// The TextStyle of the prefix of the color code.
  //     ///
  //     /// The prefix always include the alpha value and may also include a num char
  //     /// '#' or '0x' based on the `ColorPickerCopyPasteBehavior.copyFormat`
  //     /// setting.
  //     ///
  //     /// Defaults to [colorCodeTextStyle], if not defined.
  //     /// colorCodePrefixStyle: null,

  //     /// When true, the color code field is always read only.
  //     ///
  //     /// If set to true, the color code field cannot be edited. Normally it can
  //     /// be edited when used in a picker that can select and show any color.
  //     /// Setting this to false makes it read only also on such pickers. This
  //     /// currently only applies to the wheel picker, but will also apply to
  //     /// future full color range pickers.
  //     ///
  //     /// Pickers that only offer a fixed palette, that you can just offered colors
  //     /// from always have the color code field in read only mode, this setting
  //     /// does not affect them.
  //     ///
  //     /// Regardless of the picker and [colorCodeReadOnly] value, you can change
  //     /// color value by pasting in a new value, if your copy paste configuration
  //     /// allows it.
  //     ///
  //     /// Defaults to false.
  //     colorCodeReadOnly: true,

  //     /// Set to true to show the int [Color.value] of the selected [color].
  //     ///
  //     /// This is a developer feature, showing the int color value can be
  //     /// useful during software development. If enabled the value is shown after
  //     /// the color code. For text style it also uses the [colorCodeTextStyle].
  //     /// There is no copy button for the shown int value, but the value is
  //     /// displayed with a [SelectableText] widget, so it can be select painted
  //     /// and copied if so required.
  //     ///
  //     /// Defaults to false.
  //     showColorValue: false,

  //     /// Set to true to a list of recently selected colors selection at the bottom
  //     /// of the picker.
  //     ///
  //     /// When `showRecentColors` is enabled, the color picker shows recently
  //     /// selected colors in a list at the bottom of the color picker. The list
  //     /// uses first-in, first-out to keep min 2 to max 20 colors (defaults to 5)
  //     /// on the recently used colors list, the desired max value can be modified
  //     /// with [maxRecentColors].
  //     ///
  //     /// Defaults to false.
  //     showRecentColors: false,

  //     /// The maximum numbers of recent colors to show in the list of recent colors.
  //     ///
  //     /// The max recent colors must be from 2 to 20. Defaults to 5.
  //     maxRecentColors: 5,

  //     /// A list with the recently select colors.
  //     ///
  //     /// Defaults to an empty list of colors. You can provide a starting
  //     /// set from some stored state if so desired.
  //     recentColors: [],

  //     /// Optional callback that returns the current list of recently selected
  //     /// colors.
  //     ///
  //     /// This optional callback is called every time a new color is added to the
  //     /// recent colors list with the complete current list of recently used colors.
  //     ///
  //     /// If the optional callback is not provided, then it is not called. You can
  //     /// use this callback to save and restore the recently used colors. To
  //     /// initialize the list when the color picker is created give it a starting
  //     /// via [recentColors]. This could be a list kept just in state during
  //     /// the current app session, or it could have been persisted and restored
  //     /// from a previous session.
  //     onRecentColorsChanged: (List<Color> colors) => null,

  //     /// Set to true to enable all tooltips in this widget.
  //     ///
  //     /// When true, it enables all tooltips that are available in the color picker.
  //     /// If the tooltips get in the way you can disable them all by setting this
  //     /// property to `false`. Why not consider providing a setting in your app that
  //     /// allows users to turn ON and OFF the tooltips in the app? FlexColorPicker
  //     /// includes this toggle to make that easy to implement when it comes to its
  //     /// tooltip behavior.
  //     ///
  //     /// Defaults to true.
  //     enableTooltips: true,

  //     /// The color on the thumb of the slider that shows the selected picker type.
  //     ///
  //     /// If not defined, it defaults to `Color(0xFFFFFFFF)` (white) in light
  //     /// theme and to `Color(0xFF636366)` in dark theme, which are the defaults
  //     /// for the used [CupertinoSlidingSegmentedControl].
  //     ///
  //     /// If you give it a custom color, the color picker will automatically adjust
  //     /// the text color on the selected thumb for best legible text contrast.
  //     selectedPickerTypeColor: null,

  //     /// The TextStyle of the labels in segmented color picker type selector.
  //     ///
  //     /// Defaults to `Theme.of(context).textTheme.caption`, if not defined.
  //     /// pickerTypeTextStyle: null,

  //     /// A [ColorPickerType] to String map that contains labels for the picker
  //     /// type selector.
  //     ///
  //     /// If not defined, or omitted in provided mpa, then the following default
  //     /// English labels are used:
  //     ///  * [ColorPickerType.both] : 'Both'
  //     ///  * [ColorPickerType.primary] : 'Primary & Accent'
  //     ///  * [ColorPickerType.accent] : 'Primary'
  //     ///  * [ColorPickerType.bw] : 'Black & White'
  //     ///  * [ColorPickerType.custom] : 'Custom'
  //     ///  * [ColorPickerType.wheel] : 'Wheel'
  //     pickerTypeLabels: <ColorPickerType, String>{
  //       ColorPickerType.both: 'Both',
  //       ColorPickerType.primary: 'Primary & Accent',
  //       ColorPickerType.accent: 'Primary',
  //       ColorPickerType.bw: 'Black & White',
  //       ColorPickerType.custom: 'Custom',
  //       ColorPickerType.wheel: 'Wheel',
  //     },

  //     /// Color swatch to name map, with custom swatches and their names.
  //     ///
  //     /// Used to provide custom [ColorSwatch] objects to the custom color picker,
  //     /// including their custom name label. These colors, their swatch shades
  //     /// and names, are shown and used when the picker type
  //     /// [ColorPickerType.custom] option is enabled in the color picker.
  //     ///
  //     /// Defaults to an empty map. If the map is empty, the custom colors picker
  //     /// will not be shown even if it is enabled in [pickersEnabled].
  //     customColorSwatchesAndNames: <ColorSwatch<Object>, String>{
  //       ColorTools.createPrimarySwatch(Color(0xFF6200EE)): 'Guide Purple',
  //       ColorTools.createPrimarySwatch(Color(0xFF3700B3)):
  //           'Guide Purple Variant',
  //       ColorTools.createAccentSwatch(Color(0xFF03DAC6)): 'Guide Teal',
  //       ColorTools.createAccentSwatch(Color(0xFF018786)): 'Guide Teal Variant',
  //       ColorTools.createPrimarySwatch(Color(0xFFB00020)): 'Guide Error',
  //       ColorTools.createPrimarySwatch(Color(0xFFCF6679)): 'Guide Error Dark',
  //       ColorTools.createPrimarySwatch(Color(0xFF174378)): 'Blue blues',
  //     },
  //   ).showPickerDialog(
  //     context,
  //     constraints: _constraints,
  //   );
  // }
}