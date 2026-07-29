import canonicalLaneMathlib.AdmissibleClass
import BridgeLemmas
import GateLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure EllipticPDEPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Type v
  ellipticOperator : Type w
  weakFormulation : Prop
  existenceSolution : Prop
  regularity : Prop

structure EllipticPDEEvidence (P : EllipticPDEPackage) where
  weakFormulationClosed : P.weakFormulation
  existenceSolutionClosed : P.existenceSolution
  regularityClosed : P.regularity

def EllipticPDEClosed (P : EllipticPDEPackage) : Prop :=
  P.weakFormulation ∧ P.existenceSolution ∧ P.regularity

theorem elliptic_pde_closed_from_evidence
    (P : EllipticPDEPackage) (E : EllipticPDEEvidence P) :
    EllipticPDEClosed P := by
  exact And.intro E.weakFormulationClosed
    (And.intro E.existenceSolutionClosed E.regularityClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse