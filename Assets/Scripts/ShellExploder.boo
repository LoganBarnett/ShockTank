import UnityEngine;

class ShellExploder(MonoBehaviour):
	public explosionParticles as GameObject
	public explosionSound as AudioClip
	
	def OnCollisionEnter():
		GameObject.Instantiate(explosionParticles, transform.position, Quaternion.identity)
		AudioSource.PlayClipAtPoint(explosionSound, transform.position)
		GameObject.Destroy(gameObject)
		