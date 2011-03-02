import UnityEngine
import Testify.ExpectationExtensions
import Finput
import System.Linq.Enumerable

class RateOfFireTest(MonoBehaviour):
	public tank as GameObject

	def Number[of T]():
		return (Object.FindObjectsOfType(T) as (T)).Count()
		
	def Start() as IEnumerator:
		# TODO: Test run stops when exception is raised
		yield WaitForSeconds(1.0) # let tank settle first
		Input.HoldButton("Fire")
		yield WaitForFixedUpdate()
		Number[of ShellTip]().Should() == 1
		
		yield WaitForFixedUpdate()
		Number[of ShellTip]().Should() == 1
		
		yield WaitForSeconds(1)
		Number[of ShellTip]().Should() == 0
		yield WaitForSeconds(1.1f)
		Number[of ShellTip]().Should() == 1
		
		yield StartCoroutine(FailAfter(1.0f))