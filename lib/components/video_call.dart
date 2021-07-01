import 'package:call_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';


import 'rounded_button.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final _localRenderer = new RTCVideoRenderer();
  MediaStream _localStream;
  @override
  dispose() {
    _localStream.dispose();
    _localRenderer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initRenderers();
    _getUserMedia();
    super.initState();
  }

  initRenderers() async {
    await _localRenderer.initialize();
  }

  _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth':
              '1280', // Provide your own width, height and frame rate here
          'minHeight': '720',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
        'optional': [],
      },
    };

    // ignore: deprecated_member_use
    _localStream = await MediaDevices.getUserMedia(mediaConstraints);
    // _localStream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    _localRenderer.srcObject = _localStream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Video Call'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
                  //margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: RTCVideoView(_localRenderer, mirror: true),
                  decoration: BoxDecoration(color: Colors.black54),
                ),
             Align(
               alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: RoundedButton(
                        iconSrc: "assets/icons/call_end.svg",
                        press: () {
                          Navigator.pop(context);
                        },
                        color: kRedColor,
                        iconColor: Colors.white,
                     size: 80,
                      ),
                            ),
             )
           
            ],
          );
        },
      ),
    );
  }
}
