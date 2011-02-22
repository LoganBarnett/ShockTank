namespace Testify

import UnityEngine

class TestCollider(MonoBehaviour):
	[Property(Target)]
	target as GameObject
	
	[Property(IsCollidingWithTarget)]
	isCollidingWithTarget = false
	
	def OnTriggerEnter(otherCollider as Collider):
		isCollidingWithTarget = otherCollider.gameObject == target
		Debug.Log("Collided with target? $isCollidingWithTarget")