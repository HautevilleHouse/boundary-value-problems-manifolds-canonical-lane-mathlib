import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure ManifoldWithBoundary where
  carrier : Type
  topology : TopologicalSpace carrier
  boundary : Set carrier
  smoothStructure : Prop
  dimension : Nat

structure BoundaryCondition where
  manifold : ManifoldWithBoundary
  boundaryData : Type
  compatibility : Prop

structure EllipticOperator where
  manifold : ManifoldWithBoundary
  symbol : Type
  ellipticity : Prop
  fredholmIndex : Int

structure EllipticBoundaryValueProblem where
  operator : EllipticOperator
  boundaryCondition : BoundaryCondition
  wellPosedness : Prop
  regularity : Prop

structure EllipticEvidence (P : EllipticBoundaryValueProblem) where
  wellPosednessClosed : P.wellPosedness
  regularityClosed : P.regularity

def EllipticClosed (P : EllipticBoundaryValueProblem) : Prop :=
  P.wellPosedness ∧ P.regularity

theorem elliptic_closed_from_evidence (P : EllipticBoundaryValueProblem) (E : EllipticEvidence P) : EllipticClosed P := by
  exact And.intro E.wellPosednessClosed E.regularityClosed

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
