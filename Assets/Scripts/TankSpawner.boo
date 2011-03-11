import UnityEngine

class TankSpawner(MonoBehaviour):
	public initialTankCount = 2
	public tankPrefab as GameObject
	public terrainGameObject as GameObject
	public zOffset as single
	public heightOffset = 5.0f
	terrain as Terrain
	
	def Start():
		terrain = terrainGameObject.GetComponent[of Terrain]()
		SpawnTanks(initialTankCount)
		
	def SpawnTanks(tankCount as int):
		for i in range(0, tankCount):
			randomRelativeLocation = Random.Range(0, terrain.terrainData.size.x)
			terrainLocation = terrain.transform.position
#			terrain.
#			
			
			randomLocation = Vector3(terrainLocation.x + randomRelativeLocation, terrainLocation.y, terrainLocation.z + zOffset)
			height = terrain.SampleHeight(randomLocation) + heightOffset
			randomLocation = Vector3(randomLocation.x, height, randomLocation.z)
			Debug.Log(height)
			GameObject.Instantiate(tankPrefab, randomLocation, Quaternion.Euler(0, 90f, 0))