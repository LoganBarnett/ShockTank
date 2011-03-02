namespace Testify

class Expectation:
	subject as object
	
	def constructor(subject as object):
		self.subject = subject
		
	static def op_Equality(expectation as Expectation, other as object):
		if expectation.subject != other:
			raise ExpectationFailedException("Expected ${expectation.subject} to be equal to ${other}")
		else:
			return Should(Passed : expectation.subject == other)
			
