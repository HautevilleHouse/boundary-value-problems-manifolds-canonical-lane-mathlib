import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.BoundaryValueProblemPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure EllipticRegularityPackage {P : BoundaryValueProblemPackage} where
  operatorElliptic : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop
  globalRegularity : Prop

structure EllipticRegularityEvidence {P : BoundaryValueProblemPackage} (R : EllipticRegularityPackage P) where
  operatorEllipticClosed : R.operatorElliptic
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  globalRegularityClosed : R.globalRegularity

def EllipticRegularityClosed {P : BoundaryValueProblemPackage} (R : EllipticRegularityPackage P) : Prop :=
  R.operatorElliptic ∧ R.interiorRegularity ∧ R.boundaryRegularity ∧ R.globalRegularity

theorem elliptic_regularity_closed_from_evidence {P : BoundaryValueProblemPackage} (R : EllipticRegularityPackage P) (E : EllipticRegularityEvidence R) : EllipticRegularityClosed R := by
  exact And.intro E.operatorEllipticClosed (And.intro E.interiorRegularityClosed (And.intro E.boundaryRegularityClosed E.globalRegularityClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse