import 'dart:io';
import 'package:curving_reality_library/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class CuReCachedNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;
  final ImageRepeat? repeat;
  final AlignmentGeometry? alignment;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CuReCachedNetworkImage(
      {super.key,
      required this.url,
      this.fit,
      this.width,
      this.height,
      this.color,
      this.repeat,
      this.alignment,
      this.placeholder,
      this.errorWidget});

  Future<File> _getImageFile(String url) async {
    final dir = Directory.systemTemp;
    final file = File('${dir.path}/${url.hashCode}.png');

    if (await file.exists()) {
      return file;
    }

    final response = await HttpClient().getUrl(Uri.parse(url));
    final res = await response.close();
    final bytes = await res.fold<List<int>>([], (a, b) => a..addAll(b));

    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImageFile(url),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (placeholder != null) {
            return placeholder!;
          }
          return const Center(child: CuReCircularProgressIndicator());
        }
        return Image.file(
          snapshot.data as File,
          fit: fit,
          width: width,
          height: height,
          color: color,
          repeat: repeat ?? ImageRepeat.noRepeat,
          alignment: alignment ?? Alignment.center,
          errorBuilder: (context, error, stackTrace) {
            if (errorWidget != null) {
              return errorWidget!;
            }
            return const Icon(Icons.broken_image);
          },
        );
      },
    );
  }
}
