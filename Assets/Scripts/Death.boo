import UnityEngine

class Death(MonoBehaviour):
	public explosionAnimationPrefab as GameObject
	public destroyAfterSeconds = 10f
	public model as GameObject
	
	dead = false
	
	def OnDeath():
		return if dead
		dead = true
		Debug.Log("Exploding!")
		ExplodeParts()
		ExplodeSparks()
#		ExplodeShrapnel()
		RemovePlayerInput()
		GameObject.Destroy(gameObject, destroyAfterSeconds)

	def ExplodeSparks():
		GameObject.Instantiate(explosionAnimationPrefab, transform.position, transform.rotation)
		
	def RemovePlayerInput():
		GameObject.Destroy(GetComponent[of TankMovement]())
		
	def ExplodeParts():
		for child as Transform in model.transform:
			meshFilter = child.gameObject.GetComponent[of MeshFilter]()
			child.gameObject.AddComponent[of MeshFilter]() if meshFilter == null
			childRigidbody = child.gameObject.AddComponent[of Rigidbody]()
			childCollider = child.gameObject.GetComponent[of MeshCollider]()
			
			childRigidbody.useGravity = true
			childRigidbody.mass = 1.0f
			
			deathForce = Random.Range(100.0f, 1000f)
			angle = Random.Range(-Mathf.PI, Mathf.PI);
			x = Mathf.Sin(angle)
			y = Mathf.Cos(angle)
			direction = Vector3(x, y, -10f)
			childRigidbody.AddForce(deathForce * direction)
			childRigidbody.constraints = RigidbodyConstraints.None;
			
#			private void ScatterParts() {
#		var parts = new List<GameObject>();
#		// NOTE: Do NOT unparent the children, as it breaks the rigidbody behavior.
#		foreach (Transform child in droidModel.transform) {
#			var meshFilter = child.gameObject.GetComponent<MeshFilter>();
#			if (meshFilter == null) continue;
#			var rigidbody = child.gameObject.AddComponent<Rigidbody>();
#			var collider = child.gameObject.AddComponent<MeshCollider>();
#			collider.sharedMesh = meshFilter.sharedMesh;
#			
#			rigidbody.useGravity = true;
#			rigidbody.mass = 1.0f;
#			
#			var angle = Random.Range(-Mathf.PI, Mathf.PI);
#			var x = Mathf.Sin(angle);
#			var y = Mathf.Cos(angle);
#			var direction = new Vector3(x, y, 0.0f);
#			rigidbody.AddForce(deathForce * direction);
#			
#			// Ignore collision doesn't work with character controllers ):
#			// Instead use translation hack 
#//			foreach( var controller in Spawner.Droids.Select( d => d.GetComponent<CharacterController>() )) {				
#//				Physics.IgnoreCollision(controller, collider, true);
#//			}
#			
#			
#			child.position = child.position + new Vector3(0.0f, 0.0f, 10.0f);
#			parts.Add(child.gameObject);
#		}
#		StartCoroutine(FadeParts(parts));
#	}