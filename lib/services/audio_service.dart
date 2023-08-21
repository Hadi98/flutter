import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerTask extends BackgroundAudioTask {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    // Load and play the audio source
    final audioSource = params!['audioSource'] as AudioSource;
    await _audioPlayer.setAudioSource(audioSource);
    _audioPlayer.play();
  }

  @override
  Future<void> onStop() async {
    // Stop and release the audio player
    await _audioPlayer.stop();
    await _audioPlayer.dispose();
    return super.onStop();
  }
}

void audioPlayerTaskEntryPoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}
