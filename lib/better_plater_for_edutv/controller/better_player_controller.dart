import 'package:get/get.dart';
import 'package:better_player_plus/better_player_plus.dart';

class VideoController extends GetxController {
  late BetterPlayerController betterPlayerController;

  @override
  void onInit() {
    super.onInit();

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
    );

    betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        looping: true,
        aspectRatio: 16 / 9,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enableFullscreen: true,
          enableMute: true,
        ),
      ),
    );

    betterPlayerController.setupDataSource(dataSource);
  }

  @override
  void onClose() {
    betterPlayerController.dispose();
    super.onClose();
  }
}
