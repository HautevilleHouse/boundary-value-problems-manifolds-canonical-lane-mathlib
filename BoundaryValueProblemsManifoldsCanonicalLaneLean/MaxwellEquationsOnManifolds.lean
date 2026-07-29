import canonicalLaneMathlib.AdmissibleClass
import BridgeLemmas
import GateLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure MaxwellEquationsPackage where
  spacetime : Type u
  topology : TopologicalSpace spacetime
  smoothStructure : Type v
  faradayTwoForm : Type w
  maxwellEquations : Prop
  wellPosedness : Prop
  gaugeCondition : Prop

structure MaxwellEquationsEvidence (P : MaxwellEquationsPackage) where
  maxwellEquationsClosed : P.maxwellEquations
  wellPosednessClosed : P.wellPosedness
  gaugeConditionClosed : P.gaugeCondition

def MaxwellEquationsClosed (P : MaxwellEquationsPackage) : Prop :=
  P.maxwellEquations ∧ P.wellPosedness ∧ P.gaugeCondition

theorem maxwell_equations_closed_from_evidence
    (P : MaxwellEquationsPackage) (E : MaxwellEquationsEvidence P) :
    MaxwellEquationsClosed P := by
  exact And.intro E.maxwellEquationsClosed
    (And.intro E.wellPosednessClosed E.gaugeConditionClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse