import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:client/screens/before_recording_confirm_screen/before_recording_confirm_screen.dart';

class homeFABMenu extends StatefulWidget {
  final int? currentCarId;
  final int? currentCarVideo;

  const homeFABMenu({
    super.key,
    required this.currentCarId,
    required this.currentCarVideo,
  });

  @override
  _homeFABMenuState createState() => _homeFABMenuState();
}

class _homeFABMenuState extends State<homeFABMenu>
    with SingleTickerProviderStateMixin {
  final bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  late Animation<double> _translateAnimation;

  void showConfirmationDialog(BuildContext context, String title,
      String content, String yesText, String noText,
      {String? route, dynamic data}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text(
                yesText,
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                // Yes 버튼을 눌렀을 때 수행할 작업
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text(
                noText,
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                // No 버튼을 눌렀을 때 수행할 작업
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        if (route != null) {
          if (ModalRoute.of(context)?.settings.name != route) {
            Navigator.pushNamed(context, route);
          }
        } else {}
      } else if (value == false) {
        // No 버튼을 눌렀을 때 수행할 작업
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _rotateAnimation =
        Tween<double>(begin: 0.0, end: 0.5).animate(_animationController);
    _translateAnimation =
        Tween<double>(begin: 0.0, end: 80.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      overlayColor: Colors.black38,
      openCloseDial: ValueNotifier(_isOpen),
      buttonSize: const Size(64, 64),
      overlayOpacity: 0.0,
      activeIcon: Icons.close,
      curve: Curves.bounceIn,
      direction: SpeedDialDirection.up,
      backgroundColor: const Color(0xFFE0426F),
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.videocam_outlined,
            color: Colors.white,
          ),
          label: "영상 촬영",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 13.0,
          ),
          backgroundColor: const Color(0xFFE0426F),
          labelBackgroundColor: const Color(0xFFE0426F),
          onTap: () {
            if (widget.currentCarVideo == 2) {
              showConfirmationDialog(
                context,
                '손상 등록 불가',
                '현재 대여 전/후 손상이 모두 등록된 상태입니다. 차량 상세 정보를 확인하시겠습니까?',
                '예',
                '아니오',
                route: '/detail',
              );
            } else if (widget.currentCarId == 0) {
              showConfirmationDialog(
                context,
                '손상 등록 불가',
                '현재 차량이 등록되지 않은 상태입니다. 차량을 등록하러 가시겠습니까?',
                '예',
                '아니오',
                route: '/register',
              );
            } else {
              if (ModalRoute.of(context)?.settings.name !=
                  '/before-recording-confirm') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const BeforeRecordingConfirmScreen(videoCase: 'take'),
                  ),
                );
              }
            }
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.video_collection_outlined,
            color: Colors.white,
          ),
          label: "영상 선택",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 13.0,
          ),
          backgroundColor: const Color(0xFFE0426F),
          labelBackgroundColor: const Color(0xFFE0426F),
          onTap: () {
            if (widget.currentCarVideo == 2) {
              showConfirmationDialog(
                context,
                '손상 등록 불가',
                '현재 대여 전/후 손상이 모두 등록된 상태입니다. 차량 상세 정보를 확인하시겠습니까?',
                '예',
                '아니오',
                route: '/detail',
              );
            } else if (widget.currentCarId == 0) {
              showConfirmationDialog(
                context,
                '손상 등록 불가',
                '현재 차량이 등록되지 않은 상태입니다. 차량을 등록하러 가시겠습니까?',
                '예',
                '아니오',
                route: '/register',
              );
            } else {
              if (ModalRoute.of(context)?.settings.name !=
                  '/before-recording-confirm') {
                if (ModalRoute.of(context)?.settings.name !=
                    '/before-recording-confirm') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BeforeRecordingConfirmScreen(
                        videoCase: 'pick',
                      ),
                    ),
                  );
                }
              }
            }
          },
        ),
      ],
      child: Center(
        child: Icon(
          Icons.camera_alt_outlined,
          size: 30,
          // color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}
