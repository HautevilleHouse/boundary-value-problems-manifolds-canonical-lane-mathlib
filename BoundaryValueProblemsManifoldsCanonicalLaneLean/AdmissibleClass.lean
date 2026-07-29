import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure AdmissibleClass where
  object : BVPMObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BVPWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse