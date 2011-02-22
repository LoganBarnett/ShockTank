import UnityEngine
import Testify.Should
import Testify.TestifyGlobals
import System.Collections

class ClimbTest(MonoBehaviour):
	public tank as GameObject
	public goal as GameObject
	
	def Start() as IEnumerator:
		Debug.Log(BooVersion)
		tank.ShouldBeInside(goal)
		yield StartCoroutine(FailAfter(10.0f))