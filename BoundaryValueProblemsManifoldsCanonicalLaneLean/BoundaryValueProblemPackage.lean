import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure BoundaryValueProblemPackage where
  carrierManifold : Type u
  manifoldTopology : TopologicalSpace carrierManifold
  boundaryCondition : Prop
  differentialOperator : Prop
  existenceSolution : Prop
  uniquenessSolution : Prop

structure BoundaryValueProblemEvidence (P : BoundaryValueProblemPackage) where
  boundaryConditionClosed : P.boundaryCondition
  differentialOperatorClosed : P.differentialOperator
  existenceSolutionClosed : P.existenceSolution
  uniquenessSolutionClosed : P.uniquenessSolution

def BoundaryValueProblemClosed (P : BoundaryValueProblemPackage) : Prop :=
  P.boundaryCondition ∧ P.differentialOperator ∧ P.existenceSolution ∧ P.uniquenessSolution

theorem boundary_value_problem_closed_from_evidence (P : BoundaryValueProblemPackage) (E : BoundaryValueProblemEvidence P) : BoundaryValueProblemClosed P := by
  exact And.intro E.boundaryConditionClosed (And.intro E.differentialOperatorClosed (And.intro E.existenceSolutionClosed E.uniquenessSolutionClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse