import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/video_scroll.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Referencia a DiscoverProvider para tener acceso a los cambios.
    //    watch --> permite renderizar widgets si sufren cambios.
    //    read --> permite solamente escuchar los cambios.
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      body: discoverProvider.initialLoading
            ? const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white,)) // true
            : VideoScroll(videos: discoverProvider.videos) // false
    );
  }
}