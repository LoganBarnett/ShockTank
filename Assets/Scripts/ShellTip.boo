import UnityEngine

class ShellTip(MonoBehaviour):
	def Update():
		transform.LookAt(transform.position + rigidbody.velocity * 100f)
		transform.Rotate(0, 90, 0) # cuz rotations hate me