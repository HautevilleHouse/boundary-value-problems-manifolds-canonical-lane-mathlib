import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure PoissonPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  sourceTerm : manifold → ℝ
  laplaceBeltrami : (manifold → ℝ) → (manifold → ℝ)
  boundaryCondition : manifold → ℝ
  solutionExistence : Prop
  uniqueness : Prop

structure PoissonEvidence (P : PoissonPackage) where
  solutionExistenceClosed : P.solutionExistence
  uniquenessClosed : P.uniqueness

def PoissonClosed (P : PoissonPackage) : Prop :=
  P.solutionExistence ∧ P.uniqueness

theorem poisson_closed_from_evidence (P : PoissonPackage) (E : PoissonEvidence P) : PoissonClosed P := by
  exact And.intro E.solutionExistenceClosed E.uniquenessClosed

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse