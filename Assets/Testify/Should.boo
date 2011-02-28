namespace Testify
import UnityEngine

class Should():
	[Property(Passed)]
	passed = false
	[Property(Message)]
	message = "This should have been, but was not"
	[Property(Type)]
	type = "generic"
	
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
		otherCollider.IsGoal = true
		
		extendedCollided = extendedCollider.IsCollidingWithTarget
		otherCollided = otherCollider.IsCollidingWithTarget
		
		shouldPassed = extendedCollided and otherCollided
		shouldMessage = "${extended.name} did not collide with ${other.name}"
		
		return Should()

	[Extension]
	static def ShouldPassThrough(extended as MonoBehaviour, other as GameObject) as Should:
		return extended.gameObject.ShouldPassThrough(other)
	
	[Extension]
	static def ShouldPassThrough(extended as GameObject, other as GameObject) as Should:
		extended.gameObject.AddComponent[of TestCollider]()
		other.AddComponent[of TestCollider]()
		extendedCollider = extended.GetComponent[of TestCollider]()
		extendedCollider.Target = other
		otherCollider = other.GetComponent[of TestCollider]()
		otherCollider.Target = extended.gameObject
		otherCollider.IsGoal = true
		
		extendedCollided = extendedCollider.IsCollidingWithTarget
		otherCollided = otherCollider.IsCollidingWithTarget
		
		shouldPassed = extendedCollided and otherCollided
		shouldMessage = "${extended.name} did not collide with ${other.name}"
		expectation = Should(Passed : shouldPassed, Message : shouldMessage, Type : "PassThrough")
		
		extendedCollider.Should = expectation
		otherCollider.Should = expectation		
		return expectation;
		
	def constructor():
		ExpectationManager.Register(self)
		
	def Pass():
		passed = true
		ExpectationManager.RegisterPass(self)