import 'dart:io';
import 'dart:typed_data';

import 'package:doc_reader/core/widgets/toasts/basic_toast.dart';
import 'package:doc_reader/core/widgets/toasts/icon_toast.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pdf/widgets.dart' as pw;

class Utils {
  static showToast(
    BuildContext context,
    String message, {
    final IconData? icon,
  }) {
    Widget res = BasicToast(message);
    if (icon != null) {
      res = IconToast(text: message, icon: icon);
    }
    context.showToast(res);
  }

  static Future clickDelay() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  static saveImage(String path) async {
    final bytes = await File(path).readAsBytes();
    await ImageGallerySaver.saveImage(bytes);
  }

  static saveImagesAsPDF(List<String> paths, Function() onFinished) async {
    final pdf = pw.Document();
    for (var path in paths) {
      final b = await File(path).readAsBytes();
      final Uint8List imageData = b;

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(pw.MemoryImage(imageData)),
            );
          },
        ),
      );
    }

    String name = '';
    if (paths.length == 1) {
      final splitted = paths[0].split('/');
      final splitName = splitted.last.split('.');
      name = '$splitName.pdf';
    } else {
      name = '${DateTime.now().millisecondsSinceEpoch}.pdf';
    }

    final bytes = await pdf.save();

    await DocumentFileSavePlus().saveFile(
      bytes,
      name,
      'example/pdf',
    );

    onFinished();
  }

  static showImageEditor(BuildContext context, String path,
      Function(String newPath) onFinished) async {
    final data = await File(path).readAsBytes();
    if (context.mounted) {
      final editedImage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageEditor(
            image: data,
          ),
        ),
      );
      if (editedImage != null) {
        final splitted = path.split('/');
        final newPath = path.replaceAll(splitted.last,
            '${DateTime.now().millisecondsSinceEpoch}.${splitted.last.split('.').last}');
        await File(newPath).writeAsBytes(editedImage);
        onFinished(newPath);
      }
    }
  }
}
