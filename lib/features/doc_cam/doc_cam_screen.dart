part of 'doc_cam.imports.dart';

enum SaveFileType {
  png,
  pdf,
}

@RoutePage()
class DocCamScreen extends StatefulWidget {
  final List<String> images;
  const DocCamScreen({
    super.key,
    required this.images,
  });

  @override
  State<DocCamScreen> createState() => _DocCamScreenState();
}

class _DocCamScreenState extends State<DocCamScreen> {
  SaveFileType saveFileType = SaveFileType.png;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Picked images"),
        ),
        floatingActionButton: DocCamFab(
          onTap: () => Utils.clickDelay().then((_) async => _pickPictures()),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Gap(1.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Wrap(
                      spacing: 4.w,
                      children: [
                        if (widget.images.isNotEmpty)
                          for (int i = 0; i < widget.images.length; i++)
                            DocCamPhotoCard(
                              path: widget.images[i],
                              onEditImage: () => Utils.clickDelay().then(
                                (v) async => Utils.showImageEditor(
                                    context, widget.images[i], (newPath) {
                                  setState(() {
                                    widget.images[i] = newPath.toString();
                                  });
                                }),
                              ),
                              onSavePNG: () => Utils.clickDelay().then(
                                (_) async => Utils.saveImage(widget.images[i]),
                              ),
                              onSavePDF: () => Utils.clickDelay().then(
                                (_) async => Utils.saveImagesAsPDF(
                                    [widget.images[i]], () {
                                  Utils.showToast(
                                      context, 'Saved successfully');
                                }),
                              ),
                              onRemove: () =>
                                  Utils.clickDelay().then((_) async {
                                setState(() {
                                  widget.images.removeAt(i);
                                });
                              }),
                              onShare: () => Utils.clickDelay().then((_) async {
                                Share.shareXFiles([XFile(widget.images[i])]);
                              }),
                            )
                        else
                          const Center(
                            child: Text("No images has been picked"),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            DocCamBottomSheet(
              images: widget.images,
              saveFileType: saveFileType,
              onChanged: (v) {
                if (v != null) {
                  setState(() {
                    saveFileType = v;
                  });
                }
              },
              onSave: () => Utils.clickDelay().then((v) async {
                if (widget.images.isEmpty) {
                  Utils.showToast(context, 'No images...');
                }

                if (saveFileType == SaveFileType.png) {
                  for (var image in widget.images) {
                    await Utils.saveImage(image);
                    if (context.mounted) {
                      Utils.showToast(context, 'Saved successfully');
                    }
                  }
                } else {
                  await Utils.saveImagesAsPDF(widget.images, () {
                    Utils.showToast(context, 'Saved successfully');
                  });
                }
              }),
            )
          ],
        ));
  }

  _pickPictures() async {
    final imagesPath = await CunningDocumentScanner.getPictures(
      isGalleryImportAllowed: true,
    );
    if (imagesPath != null) {
      for (var pic in imagesPath) {
        widget.images.add(pic);
      }
      setState(() {});
    }
  }
}
