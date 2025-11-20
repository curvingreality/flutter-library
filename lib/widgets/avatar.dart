import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:curving_reality_library/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';

class CuReAvatar extends StatefulWidget {
  const CuReAvatar({
    super.key,
    this.size,
    this.shape,
    this.isOnline,
    this.url,
    this.path,
    this.notifications,
    this.child,
    this.border,
    this.shadow,
    this.color,
    this.widthHeight,
  });

  final CuReAvatarSize? size;
  final CuReShape? shape;
  final bool? isOnline;
  final String? url;
  final String? path;
  final int? notifications;
  final Widget? child;
  final Border? border;
  final BoxShadow? shadow;
  final Color? color;
  final double? widthHeight;

  @override
  State<CuReAvatar> createState() => _CuReAvatarState();
}

class _CuReAvatarState extends State<CuReAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: _getSize(),
          height: _getSize(),
          decoration: BoxDecoration(
            border: widget.border,
            boxShadow: widget.shadow != null ? [widget.shadow!] : [],
            borderRadius: _getShape(),
          ),
          child: ClipRRect(
            borderRadius: _getShape(),
            child: _getImage(),
          ),
        ),
        if (widget.child != null) widget.child!,
        if (widget.isOnline != null && widget.isOnline!)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: _getOnlineStatusSize(),
              height: _getOnlineStatusSize(),
              decoration: BoxDecoration(
                color: CuReDesign.successColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
        if (widget.notifications != null && widget.notifications! > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: _getNotificationsSize(),
              height: _getNotificationsSize(),
              decoration: BoxDecoration(
                color: CuReDesign.dangerColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: CuReText(
                  widget.notifications! > 9
                      ? '+9'
                      : widget.notifications.toString(),
                  color: Colors.white,
                  size: _getNotificationsFontSize(),
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }

  double _getNotificationsFontSize() {
    double defautlSize;
    switch (widget.size) {
      case CuReAvatarSize.small:
        defautlSize = 9;
        break;
      case CuReAvatarSize.large:
        defautlSize = 13;
        break;
      case CuReAvatarSize.biggest:
        defautlSize = 17;
        break;
      case CuReAvatarSize.medium:
      default:
        defautlSize = 11;
        break;
    }
    if (widget.notifications != null && widget.notifications! > 9) {
      defautlSize -= 2;
    }
    return defautlSize;
  }

  double _getNotificationsSize() {
    double defautlSize;
    switch (widget.size) {
      case CuReAvatarSize.small:
        defautlSize = 14;
        break;
      case CuReAvatarSize.large:
        defautlSize = 22;
        break;
      case CuReAvatarSize.biggest:
        defautlSize = 27;
        break;
      case CuReAvatarSize.medium:
      default:
        defautlSize = 18;
        break;
    }
    return defautlSize;
  }

  double _getOnlineStatusSize() {
    double defautlSize;
    switch (widget.size) {
      case CuReAvatarSize.small:
        defautlSize = 11;
        break;
      case CuReAvatarSize.large:
        defautlSize = 20;
        break;
      case CuReAvatarSize.biggest:
        defautlSize = 27;
        break;
      case CuReAvatarSize.medium:
      default:
        defautlSize = 15;
        break;
    }
    return defautlSize;
  }

  double _getSize() {
    double defautlSize;
    if (widget.widthHeight != null) {
      return widget.widthHeight!;
    }
    switch (widget.size) {
      case CuReAvatarSize.small:
        defautlSize = 35;
        break;
      case CuReAvatarSize.large:
        defautlSize = 80;
        break;
      case CuReAvatarSize.biggest:
        defautlSize = 120;
        break;
      case CuReAvatarSize.medium:
      default:
        defautlSize = 50;
        break;
    }
    return defautlSize;
  }

  BorderRadius _getShape() {
    CuReShape selectedShape = widget.shape ?? CuReShape.rounded;
    return Utils.getBorderRadius(selectedShape);
  }

  Widget? _getImage() {
    if (widget.url != null) {
      return CuReCachedNetworkImage(
        url: widget.url!,
        fit: BoxFit.cover,
        placeholder: const SizedBox(
          child: CuReCircularProgressIndicator(
            size: CuReProgressIndicatorSize.small,
          ),
        ),
        errorWidget: const Icon(
          Icons.error,
        ),
      );
    } else if (widget.path != null) {
      return Image.asset(
        widget.path!,
        fit: BoxFit.cover,
        color: widget.color,
      );
    }
    return null;
  }
}
