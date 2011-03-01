import UnityEngine
import Testify.ExpectationExtensions
import Finput
import System.Linq.Enumerable

class RateOfFireTest(MonoBehaviour):
	public tank as GameObject

	def Start() as IEnumerator:
		yield WaitForSeconds(1.0) # let tank settle first
		Input.HoldButton("Fire")
		yield WaitForFixedUpdate()
		(Object.FindObjectsOfType(ShellTip) as (ShellTip)).Count().Should() == 1
		
		yield WaitForFixedUpdate()
		(Object.FindObjectsOfType(ShellTip) as (ShellTip)).Count().Should() == 1
		
		yield StartCoroutine(FailAfter(3.0f))