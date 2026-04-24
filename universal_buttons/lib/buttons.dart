import 'package:flutter/material.dart';

// ElevatedButton — текст обрезается с "…"
class MyElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  const MyElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.8, // «резиновая» ширина — 80% экрана
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: _wrapChild(child),
      ),
    );
  }

  // Оборачиваем child, если это Text — добавляем softWrap и ellipsis
  Widget _wrapChild(Widget child) {
    if (child is Text) {
      return Text(
        child.data ?? '',
        style: child.style,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      );
    }
    return child; // если это не Text, оставляем как есть
  }
}

// OutlinedButton — рамка фиксирована, текст скроллится внутри
class MyOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  const MyOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.8, // «резиновая» ширина — 80% экрана
      child: OutlinedButton(
        onPressed: onPressed,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: _wrapChild(child),
      ),
    );
  }

  // Оборачиваем child: если это Text — добавляем softWrap=false и скролл
  Widget _wrapChild(Widget child) {
    if (child is Text) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(child.data ?? '', style: child.style, softWrap: false),
      );
    }
    return child; // если это не Text, оставляем как есть
  }
}

// TextButton — стандартный
class MyTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  const MyTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.8, // «резиновая» ширина — 80% экрана
      child: TextButton(
        onPressed: onPressed,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: _wrapChild(child),
      ),
    );
  }

  // Если child = Text → добавляем softWrap и ellipsis
  Widget _wrapChild(Widget child) {
    if (child is Text) {
      return Text(
        child.data ?? '',
        style: child.style,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      );
    }
    return child; // если это не Text, оставляем как есть
  }
}

//IconButton
class MyIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final double? iconSize;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final Color? color;
  final String? tooltip;
  final FocusNode? focusNode;
  final bool autofocus;
  final BoxConstraints constraints;
  final VisualDensity? visualDensity;
  final bool isSelected;

  const MyIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    this.color,
    this.tooltip,
    this.focusNode,
    this.autofocus = false,
    this.constraints = const BoxConstraints(),
    this.visualDensity,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Масштабируем размер иконки относительно ширины экрана
    final double adaptiveSize = iconSize ?? screenWidth * 0.08;

    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: adaptiveSize,
      padding: padding,
      alignment: alignment,
      color: color,
      tooltip: tooltip,
      focusNode: focusNode,
      autofocus: autofocus,
      constraints: constraints.copyWith(
        minWidth: adaptiveSize * 1.5,
        minHeight: adaptiveSize * 1.5,
      ),
      visualDensity: visualDensity,
      isSelected: isSelected,
    );
  }
}

// PopupMenuButton — пункты обрезаются со скроллингом
class MyPopupMenuButtonScroll extends StatelessWidget {
  final List<String> items;
  final void Function(String) onSelected;
  final Widget child;

  const MyPopupMenuButtonScroll({
    super.key,
    required this.items,
    required this.onSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (context) => items.map((item) {
        return PopupMenuItem(
          value: item,
          child: SizedBox(
            width: screenWidth * 0.5, // «резиновая» ширина — половина экрана
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                item,
                softWrap: false, // запрет переноса
              ),
            ),
          ),
        );
      }).toList(),
      child: child,
    );
  }
}

// PopupMenuButton — пункты обрезаются с "…"
class MyPopupMenuButton extends StatelessWidget {
  final List<String> items;
  final void Function(String) onSelected;
  final Widget child;

  const MyPopupMenuButton({
    super.key,
    required this.items,
    required this.onSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (context) => items.map((item) {
        return PopupMenuItem(
          value: item,
          child: SizedBox(
            width: screenWidth * 0.5, // «резиновая» ширина — половина экрана
            child: Text(
              item,
              softWrap: false,
              overflow: TextOverflow.ellipsis, // обрезка с троеточием
            ),
          ),
        );
      }).toList(),
      child: child,
    );
  }
}

//FloatingActionButton
class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final String? tooltip;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Object? heroTag;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final bool mini;
  final ShapeBorder? shape;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool isExtended;

  const MyFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.heroTag,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.mini = false,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.isExtended = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Масштабируем диаметр кнопки относительно ширины экрана
    final double size = mini ? screenWidth * 0.12 : screenWidth * 0.18;

    return SizedBox(
      width: size,
      height: size,
      child: isExtended
          ? FloatingActionButton.extended(
              onPressed: onPressed,
              tooltip: tooltip,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              heroTag: heroTag,
              elevation: elevation,
              focusElevation: focusElevation,
              hoverElevation: hoverElevation,
              highlightElevation: highlightElevation,
              disabledElevation: disabledElevation,
              shape: shape,
              clipBehavior: clipBehavior,
              focusNode: focusNode,
              autofocus: autofocus,
              materialTapTargetSize: materialTapTargetSize,
              label: child, // ✅ extended использует label
            )
          : FloatingActionButton(
              onPressed: onPressed,
              tooltip: tooltip,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              heroTag: heroTag,
              elevation: elevation,
              focusElevation: focusElevation,
              hoverElevation: hoverElevation,
              highlightElevation: highlightElevation,
              disabledElevation: disabledElevation,
              mini: mini,
              shape: shape,
              clipBehavior: clipBehavior,
              focusNode: focusNode,
              autofocus: autofocus,
              materialTapTargetSize: materialTapTargetSize,
              child: child, // ✅ теперь стоит последним
            ),
    );
  }
}
