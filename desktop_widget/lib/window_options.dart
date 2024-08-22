import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

// 창 설정 해주는 파일

Future<void> setupWindowOptions() async {
  WindowOptions windowOptions = const WindowOptions(
    size:
        Size(898, 924), // 반응형이면 좋을 거 같지만 일단 피그마에서 제시된 898x924로 > 어차피 창 크기 조절 가능
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    // TitleBarStyle.hddien인 상태에서 움직이게 할 방법?
    titleBarStyle: TitleBarStyle.hidden,
  );

  // 창이 완전히 준비될 때까지 대기
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
