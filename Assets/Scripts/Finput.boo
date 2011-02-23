namespace Finput

import UnityEngine
import System.Collections.Generic
#import System.Linq

static class Input:
	programmaticAxisInput = Dictionary[of string, single]()
	
	def GetAxis(axisName as string):
		return programmaticAxisInput[axisName] if programmaticAxisInput.ContainsKey(axisName)
		return UnityEngine.Input.GetAxis(axisName)
		
	def HoldAxis(axisName, value):
		programmaticAxisInput[axisName] = value