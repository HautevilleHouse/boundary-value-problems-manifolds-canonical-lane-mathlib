import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure GreenPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  laplaceOperator : (manifold → ℝ) → (manifold → ℝ)
  fundamentalSolution : manifold → manifold → ℝ
  symmetry : Prop
  boundaryBehavior : Prop
  representationFormula : Prop

structure GreenEvidence (G : GreenPackage) where
  symmetryClosed : G.symmetry
  boundaryBehaviorClosed : G.boundaryBehavior
  representationFormulaClosed : G.representationFormula

def GreenClosed (G : GreenPackage) : Prop :=
  G.symmetry ∧ G.boundaryBehavior ∧ G.representationFormula

theorem green_closed_from_evidence (G : GreenPackage) (Ev : GreenEvidence G) : GreenClosed G := by
  exact And.intro Ev.symmetryClosed (And.intro Ev.boundaryBehaviorClosed Ev.representationFormulaClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse