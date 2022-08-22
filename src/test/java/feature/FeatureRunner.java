package feature;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(features =  {"classpath:feature/getTesting.feature",
                            "classpath:feature/PostTesting.feature",
                            "classpath:feature/PutTesting.feature"})
public class FeatureRunner {

}