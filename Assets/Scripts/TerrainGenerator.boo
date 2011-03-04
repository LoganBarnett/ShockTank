import UnityEngine
import System.Collections
import System.Linq.Enumerable

# 0.001f is a "step" up
class TerrainGenerator(MonoBehaviour):
	public terrainGameObject as GameObject
	public depthOffset = 30
	public playableAreaWidth = 10
	public trailOffWidth = 2
	
	terrain as Terrain
	
	def Start():
		terrain = terrainGameObject.GetComponent[of Terrain]()
		newHeight = Random.value / 1000.0f
		terrainData = terrain.terrainData
		heightMatrix = matrix(single, terrainData.heightmapWidth, terrainData.heightmapHeight)
		height = Random.Range(0f, 0.01f)
		for y in range(0, terrainData.heightmapHeight - 1):
			height += Random.Range(-0.002f, 0.002f)
#			Debug.Log(newHeight)
			for x in range(depthOffset, playableAreaWidth + depthOffset):
				heightMatrix[x,y] = height
			for x in range(depthOffset - trailOffWidth, depthOffset):
				heightMatrix[x,y] = newHeight / 2f
			for x in range(playableAreaWidth + depthOffset, playableAreaWidth + depthOffset + trailOffWidth):
				heightMatrix[x,y] = newHeight / 2f
#				
		terrain.terrainData.SetHeights(0, 0, heightMatrix)

#	def Constrain(val as single, min as single, max as single):
#		val = min if val < min
#		val = max if val > max
#		return val
	
#	def FillDimensions(left, top, right, bottom):
#		
#	    minimumHeight = bottom - MINIMUM_BOTTOM
#	    @bottom = bottom
#	    width = right - left
#	    height = bottom - top
#	    current_height = rand(height.to_f * 0.6) + (height.to_f * 0.2) + top
#	    #points = [Vector.new(right, bottom), Vector.new(left, bottom)] # these are the start points
#	    points = []
#	    variance = height.to_f * VARIANCE_FACTOR
#	    y_direction = 0
#	    (0..(width / POINT_SPACING + 1)).each do |point_width|
#	      y_direction += (rand(variance) * 2 - variance)
#	      y_direction = constrain(y_direction, -MAX_STEEPNESS, MAX_STEEPNESS)
#	      current_height += y_direction
#	      current_height = constrain(current_height, top, @minimumHeight)
#	      y_direction = 0 if current_height <= top or current_height >= @minimumHeight
#	#      puts("x1: #{x1}, y1: #{y1}, x2: #{x2}, y2: #{y2}, current_height: #{current_height}, y_direction: #{y_direction}")
#	      vector = Vector.new((point_width * POINT_SPACING) + left, current_height)
#	      points << vector
#	    end
#	    points << Vector.new(points.last.x, points.first.y)
#	
#	    @points = points
#	    set_ground_points