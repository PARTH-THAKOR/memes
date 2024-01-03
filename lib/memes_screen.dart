import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meams/state.dart';

class MemesScreen extends ConsumerWidget {
  const MemesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Memes Application",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: Consumer(
                        builder: (context, ref, child) {
                          String result = ref.watch(memeProvider);
                          if (result == "") {
                            return const Center(
                                child: Text(
                              "CLICK TO GENERATE MEME",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ));
                          } else if (result == "Load") {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            );
                          } else if (result == "Error") {
                            return const Center(
                                child: Text(
                              "SERVER ERROR PLEASE RETRY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ));
                          } else {
                            return Image.network(
                              result,
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              fit: BoxFit.cover,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    ref.read(memeProvider.notifier).getMeme();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Generate New Meme",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        ));
  }
}
