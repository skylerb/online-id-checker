
import com.wcohen.ss.Jaro;
import com.wcohen.ss.api.StringDistance;


public class JaroDistance extends MetricDistance {

    StringDistance distance;

    public JaroDistance() {
        this.distance = new Jaro();
    }

    public double d2(String x, String y) {
        return this.distance.score(x, y);
    }

}
