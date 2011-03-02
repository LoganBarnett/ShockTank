import UnityEngine
import System.Collections
import System.Linq.Enumerable

# 0.001f is a "step" up
class TerrainGenerator(MonoBehaviour):
	public terrainGameObject as GameObject
	terrain as Terrain
	
	def Start():
		terrain = terrainGameObject.GetComponent[of Terrain]()
		newHeight = Random.value / 1000.0f
		heightMatrix = matrix(single, 1, 1)
		for i in range(0, 20):
			newHeight = Random.Range(0f, 0.01f)
			Debug.Log(newHeight)
			heightMatrix[0,0] = newHeight
			for j in range(0, 10):
				terrain.terrainData.SetHeights(j, i, heightMatrix)
#		terrain.terrainData.
