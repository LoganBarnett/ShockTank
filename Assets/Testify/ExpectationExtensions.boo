namespace Testify

class ExpectationExtensions:
	[Extension]
	static def Should(subject as object):
		return Expectation(subject)
