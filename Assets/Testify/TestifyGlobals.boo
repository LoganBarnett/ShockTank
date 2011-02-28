namespace Testify

import UnityEngine
import UnityEditor
import System.Collections
import System.Linq.Enumerable
import System.IO

class TestifyGlobals():
	[Extension]
	static def Assert(behavior as MonoBehaviour, should as Should):
		Debug.Log("Tests passed!") if should.Passed
	
	[Extension]	
	static def FailAfter(behavior as MonoBehaviour, seconds as single) as IEnumerator:
		yield WaitForSeconds(seconds)
		if ExpectationManager.AllPassed():
			Debug.Log("Succeeded!")
		else:
			Debug.Log("Fail!")
		EndSceneTest()
	
	
	static def EndSceneTest():
		SaveScreenshot()
		EditorApplication.isPlaying = false
		
	static def SaveScreenshot():
		scene = EditorApplication.currentScene.Split(char('/')).Last()
		Directory.CreateDirectory("TestResults")
		Application.CaptureScreenshot("TestResults/${scene}.png")