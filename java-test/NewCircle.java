public class NewCircle {
    int radius = 5;
    final static double pi = 3.1415;

    public static void main(String[] args) {
        NewCircle nc = new NewCircle();
        int k = nc.radius;
        nc.sum();
    }

    public void sum() {
        double val = perimeter(radius);
        System.out.println(val);
    }

    public double perimeter(int k) {
        return (double)(2*pi*k);
    }
}
