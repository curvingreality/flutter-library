import 'dart:async';
import 'dart:collection';
import 'package:animate_do/animate_do.dart';
import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:curving_reality_library/services/notifications.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:curving_reality_library/widgets/notification_banner.dart';
import 'package:flutter/material.dart';

class CuReScaffold extends StatefulWidget {
  const CuReScaffold({
    super.key,
    this.appBar,
    this.body,
    this.resizeToAvoidBottomInset,
    this.bottomNavigationBar,
    this.extendedBody,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.backgroundColor,
    this.safeArea,
  });

  final CuReAppBar? appBar;
  final Widget? body;
  final bool? resizeToAvoidBottomInset;
  final BottomNavigationBar? bottomNavigationBar;
  final bool? extendedBody;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool? safeArea;

  @override
  State<CuReScaffold> createState() => CuReScaffoldState();
}

class CuReScaffoldState extends State<CuReScaffold> {
  final Queue<QueuedNotification> _queue = Queue();
  bool _processing = false;

  OverlayEntry? _overlayEntry;
  Completer<void>? _currentDismissed;

  void enqueue(LocalNotification notification) {
    _queue.add(QueuedNotification(notification));
    if (!_processing) _processQueue();
  }

  Future<void> _processQueue() async {
    _processing = true;
    while (_queue.isNotEmpty && mounted) {
      final item = _queue.removeFirst();

      _closeCurrentOverlay();

      _currentDismissed = Completer<void>();
      final animDur =
          CuReDesign.animationDurations[CuReAnimationDuration.fast]!;
      final hold = item.notification.duration ?? const Duration(seconds: 3);

      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          left: 16,
          right: 16,
          child: Material(
            color: Colors.transparent,
            child: FadeInDown(
              from: 30,
              duration: animDur,
              child: FadeOutUp(
                from: 60,
                duration: animDur,
                delay: hold,
                child: CuReNotificationBanner(
                  notification: item.notification,
                ),
              ),
            ),
          ),
        ),
      );

      // ignore: use_build_context_synchronously
      Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);

      final total = hold + animDur + const Duration(milliseconds: 80);
      Future.delayed(total, () {
        _completeAndClose();
      });

      await _currentDismissed!.future;
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    _processing = false;
  }

  void _completeAndClose() {
    if (_currentDismissed != null && !(_currentDismissed!.isCompleted)) {
      _currentDismissed!.complete();
    }
    _closeCurrentOverlay();
  }

  void _closeCurrentOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _queue.clear();
    _completeAndClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ??
          (CuReDesign.useDarkMode
              ? const Color(0xff121212)
              : CuReDesign.whiteColor),
      appBar: widget.appBar,
      body: widget.safeArea == true
          ? SafeArea(child: widget.body ?? const SizedBox())
          : (widget.body ?? const SizedBox()),
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? true,
      bottomNavigationBar: widget.bottomNavigationBar != null
          ? Theme(
              data: Theme.of(context).copyWith(
                splashFactory: Utils.getSplashFactory(),
              ),
              child: widget.bottomNavigationBar!,
            )
          : null,
      extendBody: widget.extendedBody ?? false,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
