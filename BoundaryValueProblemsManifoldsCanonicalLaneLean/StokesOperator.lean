import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure StokesOperator (M : ManifoldWithBoundary) where
  velocitySpace : Type
  pressureSpace : Type
  stokesEquations : Prop
  infSupCondition : Prop
  regularity : Prop

structure StokesEvidence {M : ManifoldWithBoundary} (S : StokesOperator M) where
  stokesEquationsClosed : S.stokesEquations
  infSupConditionClosed : S.infSupCondition
  regularityClosed : S.regularity

def StokesClosed {M : ManifoldWithBoundary} (S : StokesOperator M) : Prop :=
  S.stokesEquations ∧ S.infSupCondition ∧ S.regularity

theorem stokes_closed_from_evidence {M : ManifoldWithBoundary} (S : StokesOperator M) (E : StokesEvidence S) : StokesClosed S := by
  exact And.intro E.stokesEquationsClosed (And.intro E.infSupConditionClosed E.regularityClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
