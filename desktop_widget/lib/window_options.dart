import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

// 창 설정 해주는 파일

Future<void> setupWindowOptions() async {
  WindowOptions windowOptions = const WindowOptions(
    size: Size(898, 924), // 반응형이면 좋을 거 같지만 일단 피그마에서 제시된 898x924로
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    // TitleBarStyle.hddien으로 하면 windowManager.setMovable이나 setResizeable이 true여도 불가능함, issues에 문의
    titleBarStyle: TitleBarStyle.hidden,
  );

  // 창이 완전히 준비될 때까지 대기
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
