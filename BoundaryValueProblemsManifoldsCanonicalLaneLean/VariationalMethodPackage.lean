import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.SobolevSpacePackage

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure VariationalMethodPackage {S : SobolevSpacePackage} where
  energyFunctionalDefined : Prop
  functionalCoercive : Prop
  minimizerExists : Prop
  minimizerSatisfiesEquation : Prop

structure VariationalMethodEvidence {S : SobolevSpacePackage} (V : VariationalMethodPackage S) where
  energyFunctionalDefinedClosed : V.energyFunctionalDefined
  functionalCoerciveClosed : V.functionalCoercive
  minimizerExistsClosed : V.minimizerExists
  minimizerSatisfiesEquationClosed : V.minimizerSatisfiesEquation

def VariationalMethodClosed {S : SobolevSpacePackage} (V : VariationalMethodPackage S) : Prop :=
  V.energyFunctionalDefined ∧ V.functionalCoercive ∧ V.minimizerExists ∧ V.minimizerSatisfiesEquation

theorem variational_method_closed_from_evidence {S : SobolevSpacePackage} (V : VariationalMethodPackage S) (E : VariationalMethodEvidence V) : VariationalMethodClosed V := by
  exact And.intro E.energyFunctionalDefinedClosed (And.intro E.functionalCoerciveClosed (And.intro E.minimizerExistsClosed E.minimizerSatisfiesEquationClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse