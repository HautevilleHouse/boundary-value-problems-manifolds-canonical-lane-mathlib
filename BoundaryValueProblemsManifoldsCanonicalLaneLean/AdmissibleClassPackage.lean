import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure AdmissibleClass where
  object : BoundaryValueAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BVWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse