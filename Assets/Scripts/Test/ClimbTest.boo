import UnityEngine
import Testify.Should
import Testify.TestifyGlobals
import System.Collections
import Finput

class ClimbTest(MonoBehaviour):
	public tank as GameObject
	public goal as GameObject
	
	def Start() as IEnumerator:
		Debug.Log(BooVersion)
		Input.HoldAxis("Move", 1.0)
		tank.ShouldBeInside(goal)
		yield StartCoroutine(FailAfter(10.0f))