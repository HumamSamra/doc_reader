import 'package:doc_reader/features/doc_cam/doc_cam.imports.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DocCamBottomSheet extends StatelessWidget {
  final List<String> images;
  final SaveFileType saveFileType;
  final Function(SaveFileType?)? onChanged;
  final Function()? onSave;
  const DocCamBottomSheet(
      {required this.images,
      required this.saveFileType,
      this.onChanged,
      this.onSave,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.2),
                    ),
                  )
                ],
              ),
              Gap(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${images.length} ${images.length > 1 ? 'Images' : 'Image'} selected",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select files type :',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: saveFileType,
                      borderRadius: BorderRadius.circular(10),
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      alignment: Alignment.center,
                      items: const [
                        DropdownMenuItem(
                            value: SaveFileType.png, child: Text("PNG")),
                        DropdownMenuItem(
                            value: SaveFileType.pdf, child: Text("PDF")),
                      ],
                      onChanged: onChanged,
                    ),
                  ),
                ],
              ),
              Gap(1.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSave,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "Save files",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
