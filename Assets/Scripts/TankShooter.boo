import UnityEngine

class TankShooter(MonoBehaviour):
	public maxPower = 100.0f
	public minPower = 10.0f
	public projectilePrefab as GameObject
	public muzzlePoint as GameObject
	public shellFiredExplosionPrefab as GameObject
	public shellFiredSound as AudioClip
	public powerFactor = 10.0f

	fireNextFixedUpdate = false
	
	def Update():
		Debug.DrawLine(muzzlePoint.transform.position, muzzlePoint.transform.position + Vector3.forward)

		if (Input.GetButtonDown("Fire")):
			fireNextFixedUpdate = true
			
	def FixedUpdate():
		if fireNextFixedUpdate:
			position = muzzlePoint.transform.position
			rotation = muzzlePoint.transform.rotation * Quaternion.Euler(0, 0, 90)
			projectile = GameObject.Instantiate(projectilePrefab, position, rotation) as GameObject
			projectile.rigidbody.AddRelativeForce(Vector3.left * maxPower * powerFactor)
			
			GameObject.Instantiate(shellFiredExplosionPrefab, position, rotation)
			
			AudioSource.PlayClipAtPoint(shellFiredSound, position)
			
			fireNextFixedUpdate = false