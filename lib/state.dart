import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meams/http_request.dart';

final memeProvider = StateNotifierProvider.autoDispose<MemeNotifier, String>(
    (ref) => MemeNotifier());

class MemeNotifier extends StateNotifier<String> {
  MemeNotifier() : super("");

  getMeme() async {
    try {
      state = "Load";
      state = await getRandomMeme();
    } catch (e) {
      state = "Error";
    }
  }

}
