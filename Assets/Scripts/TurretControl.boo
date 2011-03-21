import UnityEngine

class TurretControl (MonoBehaviour): 
	public turret as GameObject
	public rotationSpeed = 100.0
	rotation = 0f
	originalRotation as Quaternion
	rotateTurretInputKey = "rotate_turret_"
	
	def Start ():
		originalRotation = turret.transform.localRotation
		rotateTurretInputKey = GetComponent[of Player]().Number
	
	def Update ():
		rotation += Input.GetAxis(rotateTurretInputKey) * rotationSpeed * Time.deltaTime
		Debug.Log(Input.GetAxis(rotateTurretInputKey))
		Debug.Log(Input.GetAxis(rotateTurretInputKey).GetType())
		rotation = 180f if rotation > 180f
		rotation = 0f if rotation < 0f
		
		turret.transform.localRotation = Quaternion.Euler(-rotation, 0f, 0f) * originalRotation