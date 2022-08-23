package performanceTest

import io.gatling.core.Predef._
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.structure.ScenarioBuilder

import scala.concurrent.duration._

class UserSimulation extends Simulation{

  val getPerformanceTest: ScenarioBuilder = scenario("Get first test").exec(karateFeature("classpath: performanceTest/GetSingleUser.feature"))

  setUp(getPerformanceTest.inject(rampUsers(10).during(10 seconds)))

}
