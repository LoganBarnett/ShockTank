import UnityEngine

class TurretControl (MonoBehaviour): 
	public turret as GameObject
	public rotationSpeed = 100.0
	rotation as single
	originalRotation as Quaternion
	
	def Start ():
		originalRotation = turret.transform.localRotation
	
	def Update ():
		rotation += Input.GetAxis("Rotate Turret") * rotationSpeed * Time.deltaTime
		rotation = 180 if rotation > 180
		rotation = 0 if rotation < 0
		turret.transform.localRotation = Quaternion.Euler(-rotation, 0, 0) * originalRotation