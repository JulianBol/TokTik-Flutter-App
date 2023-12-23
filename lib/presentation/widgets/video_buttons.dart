import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/humans_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost videoPost;
  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [

        _CustomIconButtom(
          icon: Icons.favorite, 
          iconColor: Colors.red, 
          dataVideo: videoPost.likes
        ),

        _CustomIconButtom(
          icon: Icons.remove_red_eye_outlined, 
          dataVideo: videoPost.views
        ),

        const SizedBox(height: 10),
        
        // < SpinPerfect > Es un widget que aplica una animación a su widget hijo,
        // en este caso, hace girar al widget.
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButtom(
            icon: Icons.play_circle_outline_rounded, 
            dataVideo: 0
          ),
        ),
      ],
    );
  }
}


class _CustomIconButtom extends StatelessWidget {

  final IconData icon;
  final Color? iconColor;
  final int dataVideo;
  
  const _CustomIconButtom({
    required this.icon, 
    required this.dataVideo,
    iconColor
  }): iconColor = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        
        IconButton(
          onPressed: () {}, 
          icon: Icon(icon, color: iconColor, size: 30)
        ),

        if (dataVideo > 0)
        Text(HumansFormat.humanReadbleNumber(dataVideo.toDouble()))
      ],
    );
  }
}

