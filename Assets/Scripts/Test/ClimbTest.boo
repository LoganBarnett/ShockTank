import UnityEngine
import Testify.Should
import Testify.TestifyGlobals
import System.Collections
import Finput

class ClimbTest(MonoBehaviour):
	public tank as GameObject
	public goal as GameObject
	
	def Start() as IEnumerator:
#		Debug.Log(BooVersion)
		yield WaitForSeconds(1.0) # otherwise the wheels have a LOT of spin when landing
		Input.HoldAxis("Move", 1.0)
		tank.ShouldPassThrough(goal)
		yield StartCoroutine(FailAfter(10.0f))