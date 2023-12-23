import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/video_buttons.dart';

class VideoScroll extends StatelessWidget {

  final List <VideoPost> videos;

  const VideoScroll({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {

    // < PageView > permite hacer un scroll a pantalla completa, silimilar a un list, 
    // su diferencia es que sus widgets hijos ocupan toda la pantalla o espacio disponible 
    // en ella.
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      
      itemCount: videos.length,
      itemBuilder: (context, index) {
        
        final VideoPost videoPost = videos[index];

        // < Stack > Permite sobreponer widgets uno encima de otro.
        return Stack(
          children: [

            // Buttons
            Positioned(
              bottom: 10,
              right: 5,
              child: VideoButtons(videoPost: videoPost)
            )
          ],
        );
      }
    );
  }
}