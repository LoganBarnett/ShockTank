import UnityEngine

class TankOrientation(MonoBehaviour):
	startingZPosition = 0.0f
	startingYRotation = 0.0f
	
	def Start():
		startingZPosition = transform.position.z
		startingYRotation = transform.rotation.eulerAngles.y
		
	def Update():
		transform.position = Vector3(transform.position.x, transform.position.y, startingZPosition)
		euler = transform.rotation.eulerAngles
		transform.rotation = Quaternion.Euler(euler.x, startingYRotation, euler.z)
