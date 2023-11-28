import 'package:flutter/cupertino.dart';

import '../ExportFile/Export.dart';

class CustomAudioPlayer extends StatefulWidget {
  final File? audioFile;
  final Function? onAudioDelete;
  final String? audioUrl;
  final bool showDeleteButton;
  final TextStyle? textStyle;
  final String? label;
  final bool showCard;
  final Color? cardColor;
  final Color? buttonAndSliderColor;
  const CustomAudioPlayer({
    super.key,
    this.audioFile,
    this.onAudioDelete,
    this.showDeleteButton = true,
    this.audioUrl,
    this.textStyle,
    this.label,
    this.showCard = true,
    this.cardColor,
    this.buttonAndSliderColor,
  });

  @override
  State<CustomAudioPlayer> createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  int maxduration = 100;
  int currentpos = 0;
  String currentPostLabel = "00:00";
  bool audioplayed = false;
  bool isPlaying = false;

  AudioPlayer player = AudioPlayer();

  late UrlSource _urlSource;
  String filePath = "/empty.mp4";

  @override
  void initState() {
    if (widget.audioFile != null) {
      _urlSource = UrlSource(widget.audioFile!.path);
      filePath = widget.audioFile!.path;
    }

    if (widget.audioUrl != null) {
      _urlSource = UrlSource(widget.audioUrl!);
      filePath = widget.audioUrl!;
    }

    // player.setSource(_urlSource);
    Future.delayed(Duration.zero, () async {
      player.onDurationChanged.listen((Duration p) {
        maxduration = p.inMilliseconds;
        setState(() {});
      });
      player.onPositionChanged.listen((Duration p) {
        currentpos = p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentPostLabel = "$rhours:$rminutes:$rseconds";
        setState(() {
          //refresh the UI
        });
      });

      player.onPlayerStateChanged.listen((event) {
        setState(() {
          isPlaying = (PlayerState.playing == player.state);
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Current Player State is $isPlaying");
    return Card(
        elevation: widget.showCard ? 1 : 0,
        color: widget.cardColor ?? Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.label ?? basename(filePath),
                style: widget.textStyle ?? TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Slider(
                      activeColor: widget.buttonAndSliderColor,
                      inactiveColor: widget.buttonAndSliderColor?.withOpacity(0.4),
                      value: double.parse(currentpos.toString()),
                      min: 0,
                      max: double.parse(maxduration.toString()),
                      divisions: maxduration,
                      label: currentPostLabel,
                      onChanged: (double value) async {
                        int seekval = value.round();
                        await player.seek(Duration(milliseconds: seekval));
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await player.pause();
                        } else {
                          await player.play(_urlSource);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        (isPlaying) ? Icons.pause : Icons.play_arrow,
                        color: widget.buttonAndSliderColor,
                      ),
                    ),
                    Visibility(
                      visible: widget.showDeleteButton,
                      child: IconButton(
                          onPressed: () {
                            if (widget.onAudioDelete != null) {
                              widget.onAudioDelete!();
                            }
                          },
                          icon: Icon(Icons.delete)),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
