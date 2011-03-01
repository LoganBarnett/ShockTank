namespace Finput

import UnityEngine
import System.Collections.Generic
import System.Linq.Expressions

class Input(MonoBehaviour):
	static programmaticAxisInput = Dictionary[of string, single]()
	static programmaticButtonPushes = List[of string]()
	static heldButtons = List[of string]()
	
	static sceneObject as GameObject
	
	static def GetAxis(axisName as string):
		return programmaticAxisInput[axisName] if programmaticAxisInput.ContainsKey(axisName)
		return UnityEngine.Input.GetAxis(axisName)
		
	static def HoldAxis(axisName, value):
		programmaticAxisInput[axisName] = value
		
	static def HoldButton(buttonName):
		heldButtons.Add(buttonName)
	
	static def GetButton(buttonName):
		return true if programmaticButtonPushes.Exists({b| b == buttonName})
		return UnityEngine.Input.GetButton(buttonName)
		
	static def GetButtonDown(buttonName):
		return true if heldButtons.Exists({b| b == buttonName})
		return UnityEngine.Input.GetButtonDown(buttonName)
		
	static def VerifyFinputSceneObject():
		raise System.Exception("Missing Finput object in scene! Did you forget to add it?") if GameObject.Find("Finput") == null
		
	def Start():
		sceneObject = gameObject
		
	def Update():
		heldButtons.Clear()