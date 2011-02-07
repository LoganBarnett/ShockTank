import UnityEngine

class TankShooter(MonoBehaviour):
	public maxPower = 100.0f
	public minPower = 10.0f
	public projectilePrefab as GameObject
	public muzzlePoint as GameObject
	public powerFactor = 10.0f

	def Update():
		Debug.DrawLine(muzzlePoint.transform.position, muzzlePoint.transform.position + Vector3.forward)

		if (Input.GetButtonDown("Fire")):
			position = muzzlePoint.transform.position
			rotation = muzzlePoint.transform.rotation
			projectile = GameObject.Instantiate(projectilePrefab, position, rotation) as GameObject
			projectile.rigidbody.AddRelativeForce(Vector3.left * maxPower * powerFactor)
