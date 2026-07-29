import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure EllipticPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  ellipticOperator : (manifold → ℝ) → (manifold → ℝ)
  principalSymbol : Prop
  strongEllipticity : Prop
  boundaryOperator : (manifold → ℝ) → (manifold → ℝ)
  coercivityEstimate : Prop
  fredholmProperty : Prop

structure EllipticEvidence (E : EllipticPackage) where
  coercivityEstimateClosed : E.coercivityEstimate
  fredholmPropertyClosed : E.fredholmProperty

def EllipticClosed (E : EllipticPackage) : Prop :=
  E.coercivityEstimate ∧ E.fredholmProperty

theorem elliptic_closed_from_evidence (E : EllipticPackage) (Ev : EllipticEvidence E) : EllipticClosed E := by
  exact And.intro Ev.coercivityEstimateClosed Ev.fredholmPropertyClosed

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse