import UnityEngine

class SpawnBombCommand(MonoBehaviour):
	public shellPrefab as GameObject
	
	[ConsoleCommand("bomb")]
	def SpawnBomb(args as string):
		tank = GameObject.Find("Tank(Clone)")
		GameObject.Instantiate(shellPrefab, tank.transform.position, Quaternion.identity)