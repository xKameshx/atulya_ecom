import 'package:tflite/tflite.dart';

class MyHomePage {
  MyHomePage() {
    {
      Tflite.loadModel(
        model: "assets/images/model_unquant.tflite",
        labels: "assets/images/labels.txt",
      );
    }
  }

  // late bool _loading;
  // var _outputs;

  classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    return "${output![0]["label"]}".replaceAll(RegExp(r'[0-9]'), '');
  }
}
//
 
