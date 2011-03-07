import UnityEngine

class TankBoundaries(MonoBehaviour):
	public terrainGameObject as GameObject
	public boundaryPrefab as GameObject
	
	def Start():
		terrain = terrainGameObject.GetComponent[of Terrain]()
		boundarySize = boundaryPrefab.GetComponent[of BoxCollider]().size
		size = terrain.terrainData.size
		rightX = terrain.transform.position.x - (boundarySize.x / 2f)
		leftX = terrain.transform.position.x + (boundarySize.x / 2f) + size.x
		y = boundarySize.y / 2f

		GameObject.Instantiate(boundaryPrefab, Vector3(leftX, y, 0f), Quaternion.identity)
		GameObject.Instantiate(boundaryPrefab, Vector3(rightX, y, 0f), Quaternion.identity)