namespace Testify

import UnityEngine

class TestCollider(MonoBehaviour):
	[Property(Should)]
	should as Should
	
	[Property(Target)]
	target as GameObject
	
	[Property(IsCollidingWithTarget)]
	isCollidingWithTarget = false
	
	[Property(HasCollidedWithTarget)]
	hasCollidedWithTarget = false
	
	[Property(IsGoal)]
	isGoal = false
	
	greenMaterial as Material
	
	def Start():
		greenMaterial = Resources.Load("Testify/Pass") as Material
	
	def OnTriggerEnter(otherCollider as Collider):
		isCollidingWithTarget = HasCollidedWithTarget = otherCollider.gameObject == target
		Pass() if HasCollidedWithTarget and should.Type == "PassThrough"

	def FixedUpdate():
		isCollidingWithTarget = false
		
	def Pass():
		Should.Pass()
		renderer.material = greenMaterial if IsGoal