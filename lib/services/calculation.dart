class BmiCalculation {
  static double result = 0;
  static String? status;
  static calculation(heightcontroller, weightcontroller) {
    double height = double.parse(heightcontroller.text) / 100;
    double weight = double.parse(weightcontroller.text);
    double heightsquare = height * height;
    result = weight / heightsquare;

    //print("calcultion fun is ${result}");

    if (result <= 7) {
      status = ('underweight');
    } else if (result <= 25) {
      status = ('normal');
    } else if (result <= 35) {
      status = ('overweight');
    } else {
      status = ('obese');
    }
    return result;
  }
}
