part of 'home.imports.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doc Reader"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        onPressed: () async {
          final res = await Permission.camera.request();
          if (!res.isGranted) {
            return;
          }
          final List<String> images = [];
          final imagesPath = await CunningDocumentScanner.getPictures(
            isGalleryImportAllowed: true,
          );
          if (imagesPath != null) {
            for (var pic in imagesPath) {
              images.add(pic);
            }
          }
          if (context.mounted) {
            context.router.push(DocCamRoute(images: images));
          }
        },
        child: const Icon(Icons.camera_alt_outlined),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.calendar_month),
            title: const Text("Today's date"),
            subtitle: Text("${DateTime.now()}"),
          ),
          ListTile(
            onTap: () async {
              await openAppSettings();
            },
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            subtitle: const Text("Opens app settings"),
          ),
        ],
      ),
    );
  }
}
