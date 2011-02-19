import UnityEngine

[RequireComponent(Rigidbody)]
class CenterOfMass(MonoBehaviour):
	public centerOfMass as Vector3
	
	def Start():
		rigidbody.centerOfMass = centerOfMass