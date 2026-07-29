import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure WeakFormulationPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  bilinearForm : (manifold → ℝ) → (manifold → ℝ) → ℝ
  continuity : Prop
  coercivity : Prop
  sourceFunctional : (manifold → ℝ) → ℝ
  boundedness : Prop
  solutionExistence : Prop

structure WeakFormulationEvidence (W : WeakFormulationPackage) where
  continuityClosed : W.continuity
  coercivityClosed : W.coercivity
  boundednessClosed : W.boundedness
  solutionExistenceClosed : W.solutionExistence

def WeakFormulationClosed (W : WeakFormulationPackage) : Prop :=
  W.continuity ∧ W.coercivity ∧ W.boundedness ∧ W.solutionExistence

theorem weak_formulation_closed_from_evidence (W : WeakFormulationPackage) (Ev : WeakFormulationEvidence W) : WeakFormulationClosed W := by
  exact And.intro Ev.continuityClosed (And.intro Ev.coercivityClosed (And.intro Ev.boundednessClosed Ev.solutionExistenceClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse