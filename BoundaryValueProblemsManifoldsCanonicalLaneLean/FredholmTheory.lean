import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure FredholmTheoryPackage {E : EllipticOperatorPackage}
    {B : BoundaryConditionPackage E} (S : SobolevSpacePackage B) where
  indexTheorem : Prop
  fredholmAlternative : Prop
  parametrixConstruction : Prop

structure FredholmTheoryEvidence {E : EllipticOperatorPackage}
    {B : BoundaryConditionPackage E} {S : SobolevSpacePackage B}
    (F : FredholmTheoryPackage S) where
  indexTheoremClosed : F.indexTheorem
  fredholmAlternativeClosed : F.fredholmAlternative
  parametrixConstructionClosed : F.parametrixConstruction

def FredholmTheoryClosed {E : EllipticOperatorPackage}
    {B : BoundaryConditionPackage E} {S : SobolevSpacePackage B}
    (F : FredholmTheoryPackage S) : Prop :=
  F.indexTheorem ∧ F.fredholmAlternative ∧ F.parametrixConstruction

theorem fredholm_theory_closed_from_evidence {E : EllipticOperatorPackage}
    {B : BoundaryConditionPackage E} {S : SobolevSpacePackage B}
    (F : FredholmTheoryPackage S) (Ev : FredholmTheoryEvidence F) :
    FredholmTheoryClosed F := by
  exact And.intro Ev.indexTheoremClosed (And.intro Ev.fredholmAlternativeClosed Ev.parametrixConstructionClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
