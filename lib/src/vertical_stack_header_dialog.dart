// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

///Main widget to render dialog UI
class VerticalStackDialog extends StatefulWidget {
  const VerticalStackDialog({
    Key? key,
    this.title,
    this.titleStyle,
    this.desc,
    this.descStyle,
    this.btnOk,
    this.btnCancel,
    this.body,
    this.alignment,
    this.isDense = true,
    required this.header,
    required this.padding,
    this.keyboardAware = true,
    this.width,
    this.showCloseIcon,
    required this.onClose,
    this.closeIcon,
    this.dialogBackgroundColor,
    this.borderSide,
    this.borderRadius,
    this.bodyHeaderDistance = 15.0,
    this.reverseBtnOrder = false, this.outterPadding, this.onReachEnd,
  }) : super(key: key);
  final String? title;
  final TextStyle? titleStyle;
  final String? desc;
  final TextStyle? descStyle;
  final Widget? btnOk;
  final Widget? btnCancel;
  final Widget? header;
  final Widget? body;
  final bool isDense;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry padding;
  final bool keyboardAware;
  final double? width;
  final bool? showCloseIcon;
  final void Function() onClose;
  final Widget? closeIcon;
  final Color? dialogBackgroundColor;
  final BorderSide? borderSide;
  final BorderRadiusGeometry? borderRadius;
  final double bodyHeaderDistance;
  final bool reverseBtnOrder;
  final EdgeInsetsGeometry? outterPadding;
  final void Function()? onReachEnd;

  @override
  State<VerticalStackDialog> createState() => _VerticalStackDialogState();
}

class _VerticalStackDialogState extends State<VerticalStackDialog> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) widget.onReachEnd?.call();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      alignment: widget.alignment,
      padding: EdgeInsets.only(
          bottom: widget.keyboardAware ? mediaQueryData.viewInsets.bottom : 0),
      child: Stack(
        children: <Widget>[
          Container(
            width: widget.width ?? mediaQueryData.size.width,
            padding: widget.outterPadding ?? (widget.isDense
                ? const EdgeInsets.only(
                    top: 65.0, left: 15.0, right: 15.0, bottom: 10.0)
                : const EdgeInsets.only(
                    top: 65.0, left: 40.0, right: 40.0, bottom: 10.0)),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: widget.borderRadius ??
                    const BorderRadius.all(
                      Radius.circular(10),
                    ),
                side: widget.borderSide ?? BorderSide.none,
              ),
              elevation: 0.5,
              color: widget.dialogBackgroundColor ?? theme.cardColor,
              child: Padding(
                padding: widget.padding,
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: widget.header != null ? 50.0 : widget.bodyHeaderDistance,
                      ),
                      widget.body ??
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              if (widget.title != null) ..._titleBody(widget.title!, theme),
                              if (widget.desc != null)
                                Flexible(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Text(
                                      widget.desc!,
                                      textAlign: TextAlign.center,
                                      style: widget.descStyle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      if (widget.desc != null)
                        const SizedBox(
                          height: 16.0,
                        ),
                      if (widget.btnOk != null || widget.btnCancel != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (widget.reverseBtnOrder) ...[
                                if (widget.btnOk != null)
                                  Expanded(
                                    child: widget.btnOk!,
                                  ),
                                if (widget.btnCancel != null && widget.btnOk != null)
                                  const SizedBox(
                                    width: 10,
                                  ),
                                if (widget.btnCancel != null)
                                  Expanded(
                                    child: widget.btnCancel ?? Container(),
                                  ),
                              ] else ...[
                                if (widget.btnCancel != null)
                                  Expanded(
                                    child: widget.btnCancel ?? Container(),
                                  ),
                                if (widget.btnCancel != null && widget.btnOk != null)
                                  const SizedBox(
                                    width: 10,
                                  ),
                                if (widget.btnOk != null)
                                  Expanded(
                                    child: widget.btnOk!,
                                  )
                              ]
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (widget.header != null)
            SizedBox(
              width: widget.width ?? mediaQueryData.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    shape: CircleBorder(
                      side: widget.borderSide ?? BorderSide.none,
                    ),
                    child: CircleAvatar(
                      backgroundColor: widget.dialogBackgroundColor ?? theme.cardColor,
                      radius: 55.0,
                      child: widget.header,
                    ),
                  ),
                ],
              ),
            ),
          if (widget.showCloseIcon!)
            Positioned(
              right: 50.0,
              top: 75.0,
              child: GestureDetector(
                onTap: () {
                  widget.onClose.call();
                },
                child: widget.closeIcon ?? const Icon(Icons.close),
              ),
            ),
        ],
      ),
    );
  }

  /// The default widget for the Title of dialog
  List<Widget> _titleBody(String title, ThemeData theme) => <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: widget.titleStyle ?? theme.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ];
}
