class ScreenSize {
  static late double _height;
  static late double _width;

  static double get height => _height;
  static double get width => _width;

  static void setSize(double h, double w) {
    _height = h;
    _width = w;
  }
}
