namespace Testify

import System.Collections.Generic
import System.Linq.Enumerable

# for managing expectations (:
static class ExpectationManager:
	expectations = List[of Should]()
	
	def Register(should as Should):
		expectations.Add(should)
	
	def AllPassed():
		return expectations.All({e| e.Passed})
		
	def Clear():
		expectations.Clear()
	
	def RegisterPass(expectation as Should):
		TestifyGlobals.EndSceneTest() if AllPassed()