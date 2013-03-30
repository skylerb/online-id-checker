
public abstract class MetricDistance extends Distance {

    public double d(String x, String y) {
        double result = d2(x, y);
        counter += 1;
        return result;
    }
   
    public abstract double d2(String x, String y);

}

