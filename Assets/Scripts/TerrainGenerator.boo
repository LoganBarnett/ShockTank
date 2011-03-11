import UnityEngine
import System.Collections
import System.Linq.Enumerable
import System.Collections.Generic

# 0.001f is a "step" up
class TerrainGenerator(MonoBehaviour):
	public terrainGameObject as GameObject
	public depthOffset = 30
	public playableAreaWidth = 10
	public trailOffWidth = 2
	public bumpiness = 2.0f
	public maxHeight = 0.05f
	
	
	terrain as Terrain
	
	def Start():
		GenerateTerrain()
		
	def GenerateTerrain():
		terrain = terrainGameObject.GetComponent[of Terrain]()
		newHeight = Random.value / 1000.0f
		terrainData = terrain.terrainData
		heightMatrix = matrix(single, terrainData.heightmapWidth, terrainData.heightmapHeight)
		height = Random.Range(0f, 0.01f)
		noise = Perlin()
		values = List[of single]()
		for y in range(0, terrainData.heightmapHeight):
			lerp = cast(single, y) / (terrainData.heightmapHeight)
			height = noise.Noise(lerp * bumpiness)
			values.Add(height)
			
		heights = OffsetToPositiveHeights(values)
		heights = ScaleHeightsToFit(heights)
		
		y = 0
		for height in heights:
			for x in range(depthOffset, playableAreaWidth + depthOffset):
				heightMatrix[x,y] = height
			for x in range(depthOffset, 0):
				heightMatrix[x,y] = height * x / depthOffset
			y += 1
		terrain.terrainData.SetHeights(0, 0, heightMatrix)
		
	def OffsetToPositiveHeights(heights as IEnumerable[of single]):
		smallest = heights.First()
		for height in heights:
			smallest = height if height < smallest
		
		offset = Mathf.Abs(smallest)
		return heights.Select({h| h + offset})
		
	def ScaleHeightsToFit(heights as IEnumerable[of single]):
		biggest = heights.First()
		for height in heights:
			biggest = height if height > biggest

		return heights.Select({h| h * maxHeight / biggest})