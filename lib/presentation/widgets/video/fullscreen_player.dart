import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  // < late > se utiliza para declarar variables que se inicializarán más tarde en el código, es decir, 
  // en un momento posterior a la declaración. Esto permite diferir la asignación de un valor a la 
  // variable hasta que sea realmente necesario, pero el compilador garantiza que la variable se 
  // inicializará antes de que se acceda a su valor.
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {

        if (snapshot.connectionState != ConnectionState.done){
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2, 
              color: Colors.white,)
            );
        }

        // < GestureDetector > es un widget que detecta varios eventos en pantalla.
        return GestureDetector(

          onTap: () {

            // Pone pausa al video al hacer tap en la pantalla.
            if (controller.value.isPlaying){
              controller.pause();
              return;
            }
            controller.play();
          },

          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio, 
            child: Stack(
              children: [
          
                VideoPlayer(controller),

                const _GradientBackgound(),

                Positioned(
                  bottom: 20,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)
                ),
          
              ]
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  
  final String caption;

  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.bodyLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle,)
    );
  }
}


class _GradientBackgound extends StatelessWidget {
  const _GradientBackgound();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(

            // < stops > definen las uniones o inicios de los colores
            // en el gradiente.
            stops: [0.8, 1.0],

            // Lista de colores para el gradiente.
            colors: [
              Colors.transparent, 
              Colors.black87
            ],

            // Indican el inicio y el fin del gradiente.
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter

          )
        ),
      )
    );
  }
} 