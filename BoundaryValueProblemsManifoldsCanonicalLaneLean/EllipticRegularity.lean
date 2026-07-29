import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.DirichletProblem

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure EllipticRegularityPackage {L : LaplaceBeltramiPackage}
    (D : DirichletProblemPackage L) where
  sobolevEstimate : Prop
  schauderEstimate : Prop
  gainRegularity : (n : ℕ) → Prop

structure EllipticRegularityEvidence {L : LaplaceBeltramiPackage}
    {D : DirichletProblemPackage L} (E : EllipticRegularityPackage D) where
  sobolevEstimateClosed : E.sobolevEstimate
  schauderEstimateClosed : E.schauderEstimate
  gainRegularityClosed : (n : ℕ) → E.gainRegularity n

def EllipticRegularityClosed {L : LaplaceBeltramiPackage}
    {D : DirichletProblemPackage L} (E : EllipticRegularityPackage D) : Prop :=
  E.sobolevEstimate ∧ E.schauderEstimate ∧ (∀ n : ℕ, E.gainRegularity n)

theorem elliptic_regularity_closed_from_evidence {L : LaplaceBeltramiPackage}
    {D : DirichletProblemPackage L} (E : EllipticRegularityPackage D)
    (Ev : EllipticRegularityEvidence E) : EllipticRegularityClosed E := by
  exact And.intro Ev.sobolevEstimateClosed
    (And.intro Ev.schauderEstimateClosed Ev.gainRegularityClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse