import 'package:bvg_transport_app/constants/bvg_colors.dart';
import 'package:bvg_transport_app/widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LargeSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const double appBarHeight = 90;
  final String? hintText;
  final VoidCallback? onBackPressed;
  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onClearPressed;
  final String? leadingIcon;
  final String? trailingIcon;

  const LargeSearchAppBar(
      {super.key,
      this.hintText,
      this.onBackPressed,
      this.onTextChanged,
      this.onClearPressed,
      this.leadingIcon,
      this.trailingIcon});

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  State<LargeSearchAppBar> createState() => _LargeSearchAppBarState();
}

class _LargeSearchAppBarState extends State<LargeSearchAppBar> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: BvgColors.searchBarBackground,
            elevation: 0,
            titleSpacing: 0,
            leading: widget.leadingIcon != null
                ? IconButton(
                    icon: WidgetUtils.getSvgImage(widget.leadingIcon!,
                        width: 25, height: 25),
                    onPressed: widget.onBackPressed,
                  )
                : SizedBox(),
            title: getCustomisedTextField()),
        Container(
            padding: EdgeInsets.only(top: 15),
            child: Divider(
                height: 1, thickness: 1, color: BvgColors.primaryTextColor)),
      ],
    );
  }

  Widget getCustomisedTextField() {
    var textFieldEnabled = widget.onTextChanged != null;
    if (!textFieldEnabled) {
      _controller.text = widget.hintText ?? '';
    }

    return TextField(
      readOnly: !textFieldEnabled,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')), // only text and numbers
      ],
      textInputAction: TextInputAction.done,
      enableInteractiveSelection: textFieldEnabled,
      textAlign: textFieldEnabled ? TextAlign.left : TextAlign.center,
      controller: _controller,
      onChanged: (text) {
        widget.onTextChanged?.call(text);

        if (text.length < 2) {
          setState(() {});
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: WidgetUtils.getSvgImage(widget.trailingIcon ?? '',
                    width: 25, height: 25),
                onPressed: () {
                  _controller.clear();
                  setState(() {});
                  widget.onClearPressed?.call();
                },
              )
            : SizedBox(width: 25, height: 25),
      ),
    );
  }
}
