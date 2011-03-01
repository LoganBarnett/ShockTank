namespace Testify

class Expectation:
	subject as object
	
	def constructor(subject as object):
		self.subject = subject
		
	static def op_Equality(expectation as Expectation, other as object):
		Debug.Log(expectation.subject)
		Debug.Log(other)
		return Should(Passed : expectation.subject == other)
