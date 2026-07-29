import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure RegularityPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  boundaryRegularity : Prop
  interiorRegularity : Prop
  schauderEstimate : Prop
  holderContinuity : Prop

structure RegularityEvidence (R : RegularityPackage) where
  boundaryRegularityClosed : R.boundaryRegularity
  interiorRegularityClosed : R.interiorRegularity
  schauderEstimateClosed : R.schauderEstimate
  holderContinuityClosed : R.holderContinuity

def RegularityClosed (R : RegularityPackage) : Prop :=
  R.boundaryRegularity ∧ R.interiorRegularity ∧ R.schauderEstimate ∧ R.holderContinuity

theorem regularity_closed_from_evidence (R : RegularityPackage) (Ev : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro Ev.boundaryRegularityClosed (And.intro Ev.interiorRegularityClosed (And.intro Ev.schauderEstimateClosed Ev.holderContinuityClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse