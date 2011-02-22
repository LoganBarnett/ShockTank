namespace Testify
import UnityEngine

class Should():
	[Property(Passed)]
	passed = false
	[Property(Message)]
	message = "This should have been, but was not"
	
	[Extension]
	static def ShouldBeInside(extended as MonoBehaviour, other as GameObject) as Should:
		return extended.gameObject.ShouldBeInside(other)
		
	[Extension]
	static def ShouldBeInside(extended as GameObject, other as GameObject) as Should:
		extended.gameObject.AddComponent[of TestCollider]()
		other.AddComponent[of TestCollider]()
		extendedCollider = extended.GetComponent[of TestCollider]()
		extendedCollider.Target = other
		otherCollider = other.GetComponent[of TestCollider]()
		otherCollider.Target = extended.gameObject
		
		extendedCollided = extendedCollider.IsCollidingWithTarget
		otherCollided = otherCollider.IsCollidingWithTarget
		
		shouldPassed = extendedCollided and otherCollided
		shouldMessage = "${extended.name} did not collide with ${other.name}"
		
		return Should(shouldPassed, shouldMessage)

	def constructor(passed as bool, message as string):
		self.passed = passed
		self.message = message