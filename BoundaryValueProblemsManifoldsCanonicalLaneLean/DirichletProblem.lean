import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.LaplaceBeltrami

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure DirichletProblemPackage {L : LaplaceBeltramiPackage} where
  domain : L.manifold → Prop
  boundaryData : L.manifold → ℝ
  solution : L.manifold → ℝ
  dirichletCondition : ∀ x : L.manifold, domain x ↔ solution x = boundaryData x
  pdeSatisfied : L.laplaceOperator solution = 0
  regularity : Prop

structure DirichletProblemEvidence {L : LaplaceBeltramiPackage}
    (D : DirichletProblemPackage L) where
  dirichletConditionClosed : ∀ x : L.manifold, D.domain x ↔ D.solution x = D.boundaryData x
  pdeSatisfiedClosed : D.pdeSatisfied
  regularityClosed : D.regularity

def DirichletProblemClosed {L : LaplaceBeltramiPackage}
    (D : DirichletProblemPackage L) : Prop :=
  D.pdeSatisfied ∧ D.regularity

theorem dirichlet_problem_closed_from_evidence {L : LaplaceBeltramiPackage}
    (D : DirichletProblemPackage L) (E : DirichletProblemEvidence D) :
    DirichletProblemClosed D := by
  exact And.intro E.pdeSatisfiedClosed E.regularityClosed

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse