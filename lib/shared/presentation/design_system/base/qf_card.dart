import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';

enum QfCardVariant { regular, raised, embossed }

class QfCard extends StatelessWidget {
  const QfCard({
    required this.child,
    this.variant = QfCardVariant.regular,
    this.padding = const EdgeInsets.all(14),
    this.ornamentCorners = false,
    this.borderColor,
    this.extraShadow,
    super.key,
  });

  final Widget child;
  final QfCardVariant variant;
  final EdgeInsetsGeometry padding;
  final bool ornamentCorners;
  final Color? borderColor;
  final BoxShadow? extraShadow;

  @override
  Widget build(BuildContext context) {
    final (bg, gradient, border, shadows) = _variantStyle();

    return Container(
      decoration: BoxDecoration(
        color: gradient == null ? bg : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: borderColor ?? border),
        boxShadow: [
          ?shadows,
          ?extraShadow,
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Stack(
          children: [
            Padding(padding: padding, child: child),
            if (ornamentCorners) ..._buildOrnaments(),
          ],
        ),
      ),
    );
  }

  (Color, LinearGradient?, Color, BoxShadow?) _variantStyle() {
    return switch (variant) {
      QfCardVariant.regular => (
          AppColors.surface,
          null,
          AppColors.outlineSoft,
          null,
        ),
      QfCardVariant.raised => (
          AppColors.surface2,
          null,
          AppColors.outlineSoft,
          null,
        ),
      QfCardVariant.embossed => (
          AppColors.surface2,
          const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.surface2, AppColors.surface],
          ),
          AppColors.outline,
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            offset: const Offset(0, 1),
            blurRadius: 0,
          ),
        ),
    };
  }

  List<Widget> _buildOrnaments() {
    return [
      _OrnCorner(position: OrnPosition.topLeft),
      _OrnCorner(position: OrnPosition.topRight),
      _OrnCorner(position: OrnPosition.bottomLeft),
      _OrnCorner(position: OrnPosition.bottomRight),
    ];
  }
}

enum OrnPosition { topLeft, topRight, bottomLeft, bottomRight }

class _OrnCorner extends StatelessWidget {
  const _OrnCorner({required this.position});

  final OrnPosition position;

  @override
  Widget build(BuildContext context) {
    const size = 12.0;
    const color = AppColors.rune;
    const opacity = 0.55;

    final top = (position == OrnPosition.topLeft ||
            position == OrnPosition.topRight)
        ? -1.0
        : null;
    final bottom = (position == OrnPosition.bottomLeft ||
            position == OrnPosition.bottomRight)
        ? -1.0
        : null;
    final left = (position == OrnPosition.topLeft ||
            position == OrnPosition.bottomLeft)
        ? -1.0
        : null;
    final right = (position == OrnPosition.topRight ||
            position == OrnPosition.bottomRight)
        ? -1.0
        : null;

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Opacity(
        opacity: opacity,
        child: SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: _OrnCornerPainter(position: position, color: color),
          ),
        ),
      ),
    );
  }
}

class _OrnCornerPainter extends CustomPainter {
  const _OrnCornerPainter({required this.position, required this.color});

  final OrnPosition position;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final w = size.width;
    final h = size.height;

    switch (position) {
      case OrnPosition.topLeft:
        canvas.drawLine(Offset(0, h), Offset(0, 0), paint);
        canvas.drawLine(Offset(0, 0), Offset(w, 0), paint);
      case OrnPosition.topRight:
        canvas.drawLine(Offset(w, h), Offset(w, 0), paint);
        canvas.drawLine(Offset(w, 0), Offset(0, 0), paint);
      case OrnPosition.bottomLeft:
        canvas.drawLine(Offset(0, 0), Offset(0, h), paint);
        canvas.drawLine(Offset(0, h), Offset(w, h), paint);
      case OrnPosition.bottomRight:
        canvas.drawLine(Offset(w, 0), Offset(w, h), paint);
        canvas.drawLine(Offset(w, h), Offset(0, h), paint);
    }
  }

  @override
  bool shouldRepaint(_OrnCornerPainter old) => old.position != position;
}
