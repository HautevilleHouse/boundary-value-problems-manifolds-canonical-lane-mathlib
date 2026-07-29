import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure NeumannProblemPackage {L : LaplaceBeltramiPackage} where
  domain : Type u
  boundaryData : Type v
  weakSolutionExists : Prop
  compatibilityCondition : Prop
  uniquenessUpToConstant : Prop

structure NeumannProblemEvidence {L : LaplaceBeltramiPackage} (N : NeumannProblemPackage L) where
  weakSolutionExistsClosed : N.weakSolutionExists
  compatibilityConditionClosed : N.compatibilityCondition
  uniquenessUpToConstantClosed : N.uniquenessUpToConstant

def NeumannProblemClosed {L : LaplaceBeltramiPackage} (N : NeumannProblemPackage L) : Prop :=
  N.weakSolutionExists ∧ N.compatibilityCondition ∧ N.uniquenessUpToConstant

theorem neumann_problem_closed_from_evidence {L : LaplaceBeltramiPackage} (N : NeumannProblemPackage L) (E : NeumannProblemEvidence N) :
    NeumannProblemClosed N := by
  exact And.intro E.weakSolutionExistsClosed (And.intro E.compatibilityConditionClosed E.uniquenessUpToConstantClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
