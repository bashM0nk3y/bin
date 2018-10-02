public class Circle {
    private double radius;

    /** Construct a circle with radius 1 */
    public Circle() {
        radius = 1;
    }

    /** Construct a circle with a specified radius */
    public Circle(double newRadius) {
        radius = newRadius;
    }

    /** Set a new radius */
    public void setRadiu(double newRadius) {
        radius = newRadius;
    }

    /** return a circle's radius */
    public double getRadius() {
        return radius;
    }

    /** return a circle's perimeter */
    public double getPerimeter() {
        return 2 * Math.PI * radius;
    }

    /** return a circle's area */
    public double getArea() {
        return Math.PI * radius * radius;
    }
}
