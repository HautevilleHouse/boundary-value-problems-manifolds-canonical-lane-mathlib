import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.EllipticRegularityPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure PoissonEquationPackage {P : BoundaryValueProblemPackage} {R : EllipticRegularityPackage P} where
  laplaceOperatorDefined : Prop
  sourceTermIntegrable : Prop
  weakSolutionConstructed : Prop
  strongSolutionFromRegularity : Prop

structure PoissonEquationEvidence {P : BoundaryValueProblemPackage} {R : EllipticRegularityPackage P} (Q : PoissonEquationPackage R) where
  laplaceOperatorDefinedClosed : Q.laplaceOperatorDefined
  sourceTermIntegrableClosed : Q.sourceTermIntegrable
  weakSolutionConstructedClosed : Q.weakSolutionConstructed
  strongSolutionFromRegularityClosed : Q.strongSolutionFromRegularity

def PoissonEquationClosed {P : BoundaryValueProblemPackage} {R : EllipticRegularityPackage P} (Q : PoissonEquationPackage R) : Prop :=
  Q.laplaceOperatorDefined ∧ Q.sourceTermIntegrable ∧ Q.weakSolutionConstructed ∧ Q.strongSolutionFromRegularity

theorem poisson_equation_closed_from_evidence {P : BoundaryValueProblemPackage} {R : EllipticRegularityPackage P} (Q : PoissonEquationPackage R) (E : PoissonEquationEvidence Q) : PoissonEquationClosed Q := by
  exact And.intro E.laplaceOperatorDefinedClosed (And.intro E.sourceTermIntegrableClosed (And.intro E.weakSolutionConstructedClosed E.strongSolutionFromRegularityClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse