import UnityEngine

class Death(MonoBehaviour):
	public explosionAnimationPrefab as GameObject
	public destroyAfterSeconds = 10f
	dead = false
	def OnDeath():
		return if dead
		dead = true
		Debug.Log("Exploding!")
#		ExplodeParts()
		ExplodeSparks()
#		ExplodeShrapnel()
		RemovePlayerInput()
		GameObject.Destroy(gameObject, destroyAfterSeconds)

	def ExplodeSparks():
		GameObject.Instantiate(explosionAnimationPrefab, transform.position, transform.rotation)
		
	def RemovePlayerInput():
		GameObject.Destroy(GetComponent[of TankMovement]())