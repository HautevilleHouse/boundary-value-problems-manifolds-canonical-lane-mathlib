import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure BoundaryValueManifoldPackage (G : RiemannianCurvaturePackage) where
  domain : Type u
  boundary : Type v
  interiorPDE : Prop
  boundaryCondition : Prop
  ellipticOperator : Prop

structure BoundaryValueManifoldEvidence {G : RiemannianCurvaturePackage} (B : BoundaryValueManifoldPackage G) where
  interiorPDEClosed : B.interiorPDE
  boundaryConditionClosed : B.boundaryCondition
  ellipticOperatorClosed : B.ellipticOperator

def BoundaryValueManifoldClosed {G : RiemannianCurvaturePackage} (B : BoundaryValueManifoldPackage G) : Prop :=
  B.interiorPDE ∧ B.boundaryCondition ∧ B.ellipticOperator

theorem boundary_value_manifold_closed_from_evidence
    {G : RiemannianCurvaturePackage} (B : BoundaryValueManifoldPackage G)
    (E : BoundaryValueManifoldEvidence B) : BoundaryValueManifoldClosed B := by
  exact And.intro E.interiorPDEClosed (And.intro E.boundaryConditionClosed E.ellipticOperatorClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse