import UnityEngine

class Health(MonoBehaviour):
	public health as single
	dead = false
	
	def Damage(amount as single):
		
		health -= amount
		Debug.Log("New health " + health)
		NotifyDeath() if health <= 0f
		
	def NotifyDeath():
		Debug.Log("Notifying death")
		gameObject.SendMessage("OnDeath")