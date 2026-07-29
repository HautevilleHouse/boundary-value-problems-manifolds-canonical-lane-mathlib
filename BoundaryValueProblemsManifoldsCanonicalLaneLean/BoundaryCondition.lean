import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure BoundaryConditionPackage (E : EllipticOperatorPackage) where
  boundaryType : Type u
  traceMap : Type v
  regularity : Prop
  ellipticBoundaryCondition : Prop
  wellPosedness : Prop

structure BoundaryConditionEvidence {E : EllipticOperatorPackage}
    (B : BoundaryConditionPackage E) where
  regularityClosed : B.regularity
  ellipticBoundaryConditionClosed : B.ellipticBoundaryCondition
  wellPosednessClosed : B.wellPosedness

def BoundaryConditionClosed {E : EllipticOperatorPackage}
    (B : BoundaryConditionPackage E) : Prop :=
  B.regularity ∧ B.ellipticBoundaryCondition ∧ B.wellPosedness

theorem boundary_condition_closed_from_evidence {E : EllipticOperatorPackage}
    (B : BoundaryConditionPackage E) (Ev : BoundaryConditionEvidence B) :
    BoundaryConditionClosed B := by
  exact And.intro Ev.regularityClosed (And.intro Ev.ellipticBoundaryConditionClosed Ev.wellPosednessClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
