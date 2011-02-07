import UnityEngine

class TankMovement(MonoBehaviour):
	public wheels as GameObject
	public speed = 100.0f
	wheelColliders as List of WheelCollider
	
	def Start():
		wheelColliders = List[of WheelCollider]()
		for child as Transform in wheels.transform:
			wheelColliders.Add(child.GetComponent[of WheelCollider]())
	
	def Update():
		movement = Input.GetAxis("Move") * speed * Time.deltaTime
		for wheel in wheelColliders:
			wheel.motorTorque = movement
#			wheel.brakeTorque = movement