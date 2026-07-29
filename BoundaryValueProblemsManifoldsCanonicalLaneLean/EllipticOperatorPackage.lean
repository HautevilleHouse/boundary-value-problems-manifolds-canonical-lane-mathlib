import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure EllipticOperatorPackage (M : Type) [TopologicalSpace M] [Manifold M] (S : SobolevSpacePackage M) where
  operator : Type
  fredholmIndex : ℤ
  boundaryCondition : Prop

structure EllipticOperatorEvidence {M : Type} [TopologicalSpace M] [Manifold M] {S : SobolevSpacePackage M} (E : EllipticOperatorPackage M S) where
  operatorClosed : E.operator
  fredholmIndexClosed : E.fredholmIndex = 0
  boundaryConditionClosed : E.boundaryCondition

def EllipticOperatorClosed {M : Type} [TopologicalSpace M] [Manifold M] {S : SobolevSpacePackage M} (E : EllipticOperatorPackage M S) : Prop :=
  E.operator ∧ E.fredholmIndex = 0 ∧ E.boundaryCondition

theorem elliptic_operator_closed_from_evidence {M : Type} [TopologicalSpace M] [Manifold M] {S : SobolevSpacePackage M} (E : EllipticOperatorPackage M S) (Ev : EllipticOperatorEvidence E) : EllipticOperatorClosed E := by
  exact And.intro Ev.operatorClosed (And.intro Ev.fredholmIndexClosed Ev.boundaryConditionClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse