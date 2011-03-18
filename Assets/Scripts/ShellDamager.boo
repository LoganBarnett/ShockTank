import UnityEngine

class ShellDamager(MonoBehaviour):
	public directDamage = 100f
	
	def OnCollisionEnter(collision as Collision):
		otherCollider = collision.collider as Component
		otherCollider.SendMessage("Damage", directDamage, SendMessageOptions.DontRequireReceiver)
