namespace Testify

import UnityEngine
import System.Collections

class TestifyGlobals():
	[Extension]
	static def Assert(behavior as MonoBehaviour, should as Should):
		Debug.Log("Tests passed!") if should.Passed
	
	[Extension]	
	static def FailAfter(behavior as MonoBehaviour, seconds as single) as IEnumerator:
		yield WaitForSeconds(seconds)
		Debug.Log("Fail!")