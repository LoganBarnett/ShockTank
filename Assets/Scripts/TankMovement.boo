import UnityEngine

class TankMovement(MonoBehaviour):
	public wheels as GameObject
	public speed = 100.0f
	public breaking = 50.0f
	wheelColliders as List of WheelCollider
	
	def Start():
		wheelColliders = List[of WheelCollider]()
		for child as Transform in wheels.transform:
			wheelColliders.Add(child.GetComponent[of WheelCollider]())
	
	def Update():
		input = Input.GetAxis("Move")
		movement = input * speed * Time.deltaTime
		antiMovement = breaking * (1 - Mathf.Abs(input)) * Time.deltaTime
#		Debug.Log(wheelColliders[0].rpm)
		for wheel in wheelColliders:
			wheel.motorTorque = movement
			wheel.brakeTorque = antiMovement