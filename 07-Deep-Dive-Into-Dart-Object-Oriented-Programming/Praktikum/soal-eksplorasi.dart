import 'dart:math';

abstract class Shape {
  double getArea();
  double getPerimeter();
}

class Rectangle implements Shape {
  double width;
  double length;

  Rectangle(this.width, this.length);

  @override
  double getArea() {
    return width * length;
  }

  @override
  double getPerimeter() {
    return 2 * (width + length);
  }
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double getArea() {
    return 3.14 * radius * radius;
  }

  @override
  double getPerimeter() {
    return 2 * 3.14 * radius;
  }
}

class Triangle implements Shape {
  double side1;
  double side2;
  double side3;

  Triangle(this.side1, this.side2, this.side3);

  @override
  double getArea() {
    double s = (side1 + side2 + side3) / 2;
    return sqrt(s * (s - side1) * (s - side2) * (s - side3));
  }

  @override
  double getPerimeter() {
    return side1 + side2 + side3;
  }
}

void main() {
  Rectangle rectangle = Rectangle(5.0, 4.0);
  Circle circle = Circle(3.0);
  Triangle triangle = Triangle(3.0, 4.0, 5.0);

  print("Luas dan Keliling Persegi Panjang:");
  print("Luas: ${rectangle.getArea()}");
  print("Keliling: ${rectangle.getPerimeter()}");

  print("\nLuas dan Keliling Lingkaran:");
  print("Luas: ${circle.getArea()}");
  print("Keliling: ${circle.getPerimeter()}");

  print("\nLuas dan Keliling Segitiga:");
  print("Luas: ${triangle.getArea()}");
  print("Keliling: ${triangle.getPerimeter()}");
}
