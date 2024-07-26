import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DocCamPhotoCard extends StatelessWidget {
  final String path;
  final Function()? onSavePNG;
  final Function()? onSavePDF;
  final Function()? onEditImage;
  final Function()? onRemove;
  final Function()? onShare;
  const DocCamPhotoCard({
    required this.path,
    this.onSavePNG,
    this.onSavePDF,
    this.onEditImage,
    this.onRemove,
    this.onShare,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Ink(
          height: 28.h,
          width: 45.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(
                File(path),
              ),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onEditImage,
            splashColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(0.8),
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            path.split('/').last,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        PopupMenuButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: onSavePNG,
                              child: const Text("Save as PNG"),
                            ),
                            PopupMenuItem(
                              onTap: onSavePDF,
                              child: const Text("Save as PDF"),
                            ),
                            PopupMenuItem(
                              onTap: onShare,
                              child: const Text("Share"),
                            ),
                            PopupMenuItem(
                              onTap: onRemove,
                              child: const Text("Remove"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
